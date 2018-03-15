from bottle import route, run, template, static_file, post, request, get, redirect, response, error
import os.path, os, hashlib, datetime, sqlite3, time, json, re
from PIL import Image
from shutil import copyfile
from cgi import escape as sanitize
##---**
##---**
##################################################################################
####--------------------------------Globals---------------------------------#####
################################################################################
##---**
##---**
db = './resources/inky.sqlite'
##---**
##---**
##################################################################################
####--------------------Routing for Pages/API Endpoints---------------------#####
################################################################################
##---**
##---**
@route('/')
def main():
    status = str(request.query.statusCode)
    return template('login', loginissue=status)
##---**
##---**
@route('/home')
def home():
    is_logged_in()
    user = request.get_cookie('user')
    biography = retrieve_bio(user) or ' '
    emailaddy = select_user(user)['e-mail']
    return template('home',username=user,bio=biography,email=emailaddy)
##---**
##---**
@route('/profile/<user>')
def profile(user):
    is_logged_in()
    logged_in_user = request.get_cookie('user')
    if not select_user(user):
        user = logged_in_user
    biography = retrieve_bio(user) or ' '
    emailaddy = select_user(user)['e-mail']
    friend = False
    if user in retrieve_fellows(logged_in_user):
        friend = True
    return template('profile',username=logged_in_user,posts_user=user,bio=biography,friend=friend,email=emailaddy)
##---**
##---**
@route('/settings')
def settings():
    is_logged_in()
    user = request.get_cookie('user')
    if os.path.isfile('./resources/images/' + str(user) + '.jpg'):
        photo = str(user) + '.jpg'
    else:
        photo = 'axolotl.png'
    emailaddy = select_user(user)['e-mail']
    return template('settings', username=user, userpic=photo, email=emailaddy)
##---**
##---**
@route('/contact')
def contact():
    is_logged_in()
    user = request.get_cookie('user')
    emailaddy = select_user(user)['e-mail']
    return template('contact', username=user,email=emailaddy)
##---**
##---**
@route('/fellows')
def fellows():
    is_logged_in()
    user = request.get_cookie('user')
    biography = retrieve_bio(user) or ' '
    emailaddy = select_user(user)['e-mail']
    return template('fellows',username=user,bio=biography,email=emailaddy)
##---**
##---**
@route('/get_fellows')
def get_fellows():
    is_logged_in()
    user = request.get_cookie('user')
    return json.dumps(retrieve_fellows(user))
##---**
##---**
@route('/post', method='POST')
def handle_post():
    username = request.get_cookie('user')
    message = request.forms.get('message')
    message = message + ' '
    regex = r'@{1}\w*(?=[\W!?\s]{1})'

    for name in re.findall(regex,message):
        if not select_user(str(name[1:]).rstrip()):
            message = str.replace(message,name,name[1:])

    length = len(message)

    if length > 1 and length <= 200:
        message = re.sub('<[^<]+?>', '', message)
        message = sanitize(message, True)
        post_to_db(username,message)
    return redirect('/home')
##---**
##---**
@route('/new-fellow/<new_fellow>')
def handle_new_fellow(new_fellow):
    username = request.get_cookie('user')
    if username and new_fellow:
        if follow(username,new_fellow):
            return json.dumps({'success': True})
    return json.dumps({'success': False})
##---**
##---**
@route('/get_posts', method='POST')
def retrievePosts():
    username = request.get_cookie('user')
    offset = int(request.forms.get('offset'))
    qty = int(request.forms.get('qty'))
    return json.dumps(retrieve_posts(username,offset,qty))
##---**
##---**
@route('/get_profile_posts/<user>', method='POST')
def retrieveProfilePosts(user):
    if select_user(user):
        username = user
        offset = int(request.forms.get('offset'))
        qty = int(request.forms.get('qty'))
        return json.dumps(retrieve_profile_posts(username,offset,qty))
##---**
##---**
@route('/signup', method='POST')
def sign_up():
    username = request.forms.get('username')
    if not re.match(r"^[A-Za-z0-9]{4,15}$",username):
        return redirect('/?statusCode=223')
    password = request.forms.get('password')
    email = request.forms.get('email')
    if not re.match(r"[.\w-]+@{1}[\w-]+.{1}\w+",email) and len(email) < 200:
        return redirect('/?statusCode=225')
    if not re.match(r"^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])\w{6,15}$",password):
        return redirect('/?statusCode=224')
    if not select_user(username):
        ts = datetime.datetime.now()+datetime.timedelta(days=1)
        pwhash = hashlib.md5()
        pwhash.update(password)
        session_id = hashlib.md5()
        session_id.update(str(ts))
        response.set_cookie('user',username,expires=ts)
        response.set_cookie('session',session_id.hexdigest(),expires=ts)
        new_user(username,pwhash.hexdigest(),email,session_id.hexdigest())
        follow(username,username)
        newdefault = './resources/images/user/'+ username +'.JPEG'
        copyfile('./resources/images/user/axolotl.JPEG',newdefault)
        return redirect('/home')
    else:
        return redirect('/?statusCode=222')
##---**
##---**
@post('/login', method='POST')
def log_me_in():
    username = request.forms.get('username')
    password = request.forms.get('password')
    pwhash = hashlib.md5()
    pwhash.update(password)
    if verify_login(username,pwhash.hexdigest()):
        ts = datetime.datetime.now()+datetime.timedelta(days=1)
        session_id = hashlib.md5()
        session_id.update(str(ts))
        create_session_db(username,session_id.hexdigest())
        response.set_cookie('user',username,expires=ts)
        response.set_cookie('session',session_id.hexdigest(),expires=ts)
        redirect('/home')
    else:
        redirect('/?statusCode=111')
##---**
##---**
@route('/logout')
def logout():
    username = request.get_cookie("user")

    logout_user_db(username)

    response.delete_cookie("user")
    response.delete_cookie("session")
    redirect('/')
##---**
##---**
@route('/images/<path:path>')
def serve_pictures(path):
    return static_file(path, root='./resources/images/')
##---**
##---**
@route('/library/<lib>')
def serve_libs(lib):
    return static_file(lib, root='./resources/lib/')
##---**
##---**
@route('/upload_file', method='POST')
def do_upload():
    username = request.get_cookie('user')
    upload = request.files.get('upload')
    name, ext = os.path.splitext(upload.filename)

    size = (128, 128)
    error = json.dumps({'success':False,'error':'Filetype not accepted'})
    if ext.lower() not in ('.png', '.jpg', '.jpeg', '.gif'):
        return error

    outfile = './resources/images/user/' + username + ".JPEG"
    if upload.filename != outfile:
        try:
            im = Image.open(upload.file)
            im.resize(size).save(outfile, "JPEG",quality=100)
        except IOError:
            print "Cannot create thumbnail for", upload.filename
            newdefault = './resources/images/user/'+ username + '.JPEG'
            copyfile('./resources/images/user/axolotl.JPEG',newdefault)

    return redirect('/home')
##---**
##---**
@route('/user_update', method='POST')
def update_user():
    username = request.get_cookie('user')
    update_type = request.forms.get('type')
    update_content = request.forms.get('content')
    if update_type == 'bio':
        if update_user_info(username,update_content,'bio'):
            return redirect('/profile/'+username)
    elif update_type == 'email':
        if update_user_info(username,update_content,'email'):
            return redirect('/profile/'+username)
    return json.dumps({'success':False,'error':'Issue updating ' + update_type})
##---**
##---**
@route('/delete_fellow/<fellow>')
def delete_fellow(fellow):
    username = request.get_cookie('user')
    sever_friendship(username, fellow)
    # return redirect('/fellow')
##---**
##---**
@error(404)
@error(500)
def catch_errors(error):
    print 'Error: ' + str(error)
    return '''<!DOCTYPE html>
    <html>
        <head>
            <meta charset="utf-8">
            <title>Axolotl: The sky is falling!</title>
            <link rel="stylesheet" href="/library/error.css">
        </head>
        <body>
            <div class="container">
                <div class="image"></div><div class="title">Axolotl</div>
                <p>Whoa! What is going on here? Something unexpected seems to have happened. Or maybe a wrong turn was taken somewhere? Either way, lets get you out of here!</p>
                <p>
                    <a href="/">Axolotl Homepage</a>
                </p>
            </div>
        </body>
    </html>'''
##---**
##---**
@route('/delete_account', method='POST')
def delete_account():
    is_logged_in()
    user = request.get_cookie('user')
    pwd = request.forms.get('pwd')
    pwhash = hashlib.md5()
    pwhash.update(pwd)
    if verify_login(user,pwhash.hexdigest()):
        if delete_account(user):
            response.delete_cookie("user")
            response.delete_cookie("session")
            return json.dumps({'success':True, 'error':None})
        else:
            return json.dumps({'success':False,'error':'SQL error'})
    return json.dumps({'success':False,'error':'Passwords do not match.'})
##---**
##---**
@route('/about')
def about():
    return template('aboutpage', username=' ')
##---**
##---**
@route('/icons/<filename>')
def icons(filename):
    return static_file(filename, root='./resources/icons/', mimetype='image/png')
##---xx
##---xx
##################################################################################
####----------------------Routes Above/Functions Below----------------------#####
################################################################################
##---**
##---**
def is_logged_in():
    if request.get_cookie("user") != None:
        un = request.get_cookie("user")
        udata = select_user(un)
        if un == udata["username"]:
            if udata["session_id"] != request.get_cookie("session"):
                redirect('/')
        else:
            redirect('/')
    else:
        redirect('/')
##---**
##---**
def verify_login(un,pw):
    udata = select_user(un)
    if udata:
        if pw == udata['password']:
            return True
    return False
##---**
##---**
def check_and_build_db():
    if not os.path.isfile(db):
        db_conn = sqlite3.connect('./resources/inky.sqlite')
        c = db_conn.cursor()
        c.execute("CREATE TABLE users (username text PRIMARY KEY, password text NOT NULL,email text NOT NULL,bio text DEFAULT null,session_id text DEFAULT null)")
        c.execute("CREATE TABLE friends (ID integer PRIMARY KEY AUTOINCREMENT, username text NOT NULL, friend text NOT NULL)")
        c.execute("CREATE TABLE posts (ID integer PRIMARY KEY AUTOINCREMENT, username text NOT NULL, post_body text NOT NULL, post_time real NOT NULL)")
        db_conn.commit()
        db_conn.close()
    ##---**
    ##---**
def select_user(user):
    db_conn = sqlite3.connect(db)
    c = db_conn.cursor()
    c.execute('''SELECT username, password, session_id, email FROM users WHERE username=?''',(user,))
    row_data = c.fetchone()
    db_conn.close()
    if row_data is None:
        return False
    user_data = {"username":row_data[0],"password":row_data[1],"session_id":row_data[2],"e-mail":row_data[3]}

    return user_data
##---**
##---**
def logout_user_db(user):
    db_conn = sqlite3.connect(db)
    c = db_conn.cursor()
    c.execute('''UPDATE users SET session_id = 'Invalid' WHERE username=?''',(user,))
    db_conn.commit()
    db_conn.close()
##---**
##---**
def create_session_db(user,session):
    db_conn = sqlite3.connect(db)
    c = db_conn.cursor()
    c.execute('''UPDATE users SET session_id=? WHERE username=?''',(session,user))
    db_conn.commit()
    db_conn.close()
##---**
##---**
def new_user(un,pw,em,sid):
    db_conn = sqlite3.connect(db)
    c = db_conn.cursor()
    c.execute('''INSERT INTO users(username,password,email,session_id) VALUES(?,?,?,?)''',(un,pw,em,sid))
    lastid = c.lastrowid
    db_conn.commit()
    db_conn.close()
    if lastid:
        return True
    return False
##---**
##---**
def post_to_db(user, message):
    current_time = time.time()
    message = message.strip()
    db_conn = sqlite3.connect(db)
    c = db_conn.cursor()
    c.execute('''INSERT INTO posts(username,post_body,post_time) VALUES(?,?,?)''',(user,message,current_time))
    db_conn.commit()
    lastid = c.lastrowid
    db_conn.close()
    if lastid:
        return True
    return False
##---**
##---**
def follow(user,new_friend):
    db_conn = sqlite3.connect(db)
    c = db_conn.cursor()
    c.execute('''SELECT count(*) FROM users WHERE username = ?''',(new_friend,))
    validfriend = c.fetchone()[0]
    c.execute('''SELECT count(*) FROM friends WHERE username = ? and friend = ?''',(user,new_friend))
    duplicate = c.fetchone()[0]
    if validfriend == 1 and duplicate == 0:
        c.execute('''INSERT INTO friends(username,friend) VALUES(?,?)''',(user,new_friend))
        db_conn.commit()
        db_conn.close()
        return True
    db_conn.close()
    return False
##---**
##---**
def retrieve_posts(user,offset,qty):
    db_conn = sqlite3.connect(db)
    c = db_conn.cursor()
    if offset > 1:
        c.execute('''SELECT * FROM posts WHERE username IN (SELECT friend FROM friends WHERE username=?) and id < ? ORDER BY post_time DESC LIMIT ?''',(user,offset,qty))
    elif offset == 0:
        c.execute('''SELECT * FROM posts WHERE username IN (SELECT friend FROM friends WHERE username=?) ORDER BY post_time DESC LIMIT ?''',(user,qty))
    output = []
    for row in c:
        output.append([row[1],row[2],row[3],row[0]])
    db_conn.commit()
    db_conn.close()
    return output
##---**
##---**
def retrieve_profile_posts(user,offset,qty):
    db_conn = sqlite3.connect(db)
    c = db_conn.cursor()
    if offset > 1:
        c.execute('''SELECT * FROM posts WHERE username=? and id < ? ORDER BY post_time DESC LIMIT ?''',(user,offset,qty))
    elif offset == 0:
        c.execute('''SELECT * FROM posts WHERE username=? ORDER BY post_time DESC LIMIT ?''',(user,qty))
    output = []
    for row in c:
        output.append([row[1],row[2],row[3],row[0]])
    db_conn.commit()
    db_conn.close()
    return output
##---**
##---**
def retrieve_fellows(user):
    db_conn = sqlite3.connect(db)
    c = db_conn.cursor()
    c.execute('''SELECT DISTINCT friend FROM friends WHERE username=? ORDER BY friend ASC''',(user,))
    output = []
    for row in c:
        output.append(row[0])
    db_conn.commit()
    db_conn.close()
    return output
##---**
##---**
def retrieve_bio(user):
    db_conn = sqlite3.connect(db)
    c = db_conn.cursor()
    c.execute('''SELECT bio FROM users WHERE username=?''',(user,))
    bio = c.fetchone()[0]
    db_conn.commit()
    db_conn.close()
    return bio
##---**
##---**
def update_user_info(user,text,col):
    db_conn = sqlite3.connect(db)
    c = db_conn.cursor()
    if col == 'bio':
        c.execute('''UPDATE users SET bio=? WHERE username=?''',(text,user))
    else:
        c.execute('''UPDATE users SET email=? WHERE username=?''',(text,user))
    success = c.rowcount
    db_conn.commit()
    db_conn.close()
    if success:
        return True
    return False
##---**
##---**
def sever_friendship(user, fellow):
    db_conn = sqlite3.connect(db)
    c = db_conn.cursor()
    c.execute('''DELETE FROM friends WHERE username=? and friend=?''',(user, fellow))
    db_conn.commit()
    db_conn.close()
    return
##---**
##---**
def delete_account(user):
    success = 0
    db_conn = sqlite3.connect(db)
    c = db_conn.cursor()
    c.execute('''DELETE FROM users WHERE username = ?''',(user,))
    db_conn.commit()
    success += c.rowcount
    c.execute('''DELETE FROM friends WHERE username = ? OR friend = ?''',(user,user))
    db_conn.commit()
    c.execute('''DELETE FROM posts WHERE username = ?''',(user,))
    db_conn.commit()
    success += c.rowcount
    db_conn.close()
    if success:
        return True
    return False

##---xx
##---xx
##################################################################################
#####---------------------------Run-the-server-----------------------------######
################################################################################
##---**
##---**
if __name__ == '__main__':
    check_and_build_db()
    run(host='localhost', port=8080)
##---xx
##---xx
