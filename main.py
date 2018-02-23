from bottle import route, run, template, static_file, post, request, get, post, redirect, response
import os.path, os, hashlib, datetime, sqlite3, time, json


db = './resources/inky.sqlite'


@route('/')
def main():
    # return '''
    #     <form action="/login" method="post">
    #         Username: <input name="username" type="text" />
    #         Password: <input name="password" type="password" />
    #         <input value="Login" type="submit" />
    #     </form>
    #     <p>Or sign up</p>
    #     <form action="/signup" method="post">
    #         Username: <input name="username" type="text" />
    #         Password: <input name="password" type="password" />
    #         Email: <input name="email" type="email" />
    #         <input value="Sign Up" type="submit" />
    #     </form>
    # '''
    return template('login')

@route('/home')
def home():
    is_logged_in()
    user = request.get_cookie('user')
    return template('home',username=user)

@route('/profile')
def profile():
    is_logged_in()
    user = request.get_cookie('user')
    return template('profile',username=user)
    # return retrieve_posts(user)

@route('/settings')
def settings():
    is_logged_in()
    user = request.get_cookie('user')
    if os.path.isfile('./resources/images/' + str(user) + '.jpg'):
        photo = str(user) + '.jpg'
    else:
        photo = 'axolotl.png'
    return template('settings', username=user, userpic=photo)

@route('/fellows')
def fellows():
    is_logged_in()
    user = request.get_cookie('user')
    return template('fellows',username=user)

@route('/post', method='POST')
def handle_post():
    username = request.get_cookie('user')
    message = request.forms.get('message')
    post_to_db(username,message)
    return redirect('/profile')

@route('/new-fellow/<new_fellow>')
def handle_new_fellow(new_fellow):
    username = request.get_cookie('user')
    if username and new_fellow:
        if follow(username,new_fellow):
            return 'It worked!'
    return 'It didnt work :('

@route('/get_posts', method='POST')
def retrievePosts():
    username = request.get_cookie('user')
    return json.dumps(retrieve_posts(username))

@route('/signup', method='POST')
def sign_up():
    username = request.forms.get('username')
    password = request.forms.get('password')
    if not select_user(username):
        ts = datetime.datetime.now()+datetime.timedelta(days=1)
        pwhash = hashlib.md5()
        pwhash.update(password)
        session_id = hashlib.md5()
        session_id.update(str(ts))
        response.set_cookie('user',username,expires=ts)
        response.set_cookie('session',session_id.hexdigest(),expires=ts)
        new_user(username,pwhash.hexdigest(),session_id.hexdigest())
        redirect('/profile')
    else:
        return '<p>Username already exists</p><p>Return <a href="/">HOME</a></p>'


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
        redirect('/profile')
    else:
        return '<p>Login Failed</p><p>Return <a href="/">HOME</a></p>'

@route('/logout')
def logout():
    username = request.get_cookie("user")

    logout_user_db(username)

    response.delete_cookie("user")
    response.delete_cookie("session")
    redirect('/')

@route('/images/<picture>')
def serve_pictures(picture):
    return static_file(picture, root='./resources/images/')

@route('/library/<lib>')
def serve_libs(lib):
    return static_file(lib, root='./resources/lib/')


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

def verify_login(un,pw):
    udata = select_user(un)
    if udata:
        if pw == udata['password']:
            return True
    return False


def check_and_build_db():
    if not os.path.isfile(db):
        db_conn = sqlite3.connect('./resources/inky.sqlite')
        c = db_conn.cursor()
        c.execute("CREATE TABLE users (username text PRIMARY KEY, password text NOT NULL,session_id text DEFAULT null)")
        c.execute("CREATE TABLE friends (ID integer PRIMARY KEY AUTOINCREMENT, username text NOT NULL, friend text NOT NULL)")
        c.execute("CREATE TABLE posts (ID integer PRIMARY KEY AUTOINCREMENT, username text NOT NULL, post_body text NOT NULL, post_time real NOT NULL)")
        db_conn.commit()
        db_conn.close()

def select_user(user):
    db_conn = sqlite3.connect(db)
    c = db_conn.cursor()
    c.execute('''SELECT username, password, session_id FROM users WHERE username=?''',(user,))
    row_data = c.fetchone()
    if row_data is None:
        return False
    user_data = {"username":row_data[0],"password":row_data[1],"session_id":row_data[2]}
    db_conn.close()
    return user_data

def logout_user_db(user):
    db_conn = sqlite3.connect(db)
    c = db_conn.cursor()
    c.execute('''UPDATE users SET session_id = 'Invalid' WHERE username=?''',(user,))
    db_conn.commit()
    db_conn.close()

def create_session_db(user,session):
    db_conn = sqlite3.connect(db)
    c = db_conn.cursor()
    c.execute('''UPDATE users SET session_id=? WHERE username=?''',(session,user))
    db_conn.commit()
    db_conn.close()

def new_user(un,pw,sid):
    db_conn = sqlite3.connect(db)
    c = db_conn.cursor()
    c.execute('''INSERT INTO users(username,password,session_id) VALUES(?,?,?)''',(un,pw,sid))
    lastid = c.lastrowid
    db_conn.commit()
    db_conn.close()
    if lastid:
        return True
    return False

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

def follow(user,new_friend):
    db_conn = sqlite3.connect(db)
    c = db_conn.cursor()
    c.execute('''INSERT INTO friends(username,friend) VALUES(?,?)''',(user,new_friend))
    lastid = c.lastrowid
    db_conn.commit()
    db_conn.close()
    if lastid:
        return True
    return False

def retrieve_posts(user):
    db_conn = sqlite3.connect(db)
    c = db_conn.cursor()
    c.execute('''SELECT * FROM posts WHERE username IN (SELECT friend FROM friends WHERE username=?) ORDER BY post_time DESC LIMIT 10''',(user,))
    output = []
    for row in c:
        output.append([row[1],row[2],row[3]])
    db_conn.commit()
    db_conn.close()
    return output

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

def verify_user_existence(user):
    db_conn = sqlite3.connect(db)
    c = db_conn.cursor()
    c.execute('''SELECT * FROM users WHERE username=?''',(user,))
    data = c.fetchone()
    db_conn.commit()
    db_conn.close()
    if data is None:
        return False
    return True


#####---------------------------Run-the-server-----------------------------#####
if __name__ == '__main__':
    check_and_build_db()
    run(host='localhost', port=8080)
