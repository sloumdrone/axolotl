<html>
    <head>
        <title>Axolotl</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="/library/common.css">
        <link rel="stylesheet" href="library/login.css">
        <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
        <script src="library/login.js" defer></script>
    </head>
    <body>
        <a class='dt-about-link' href='/about'>about</a>
        <section>
            <div id="logoimage"></div>
            %if loginissue:
            <div class="wordBubble">
                %if loginissue == '111':
                    Sorry friend, you used an invalid username or password.
                    %signup = 'hidden'
                    %login = ''
                %else:
                    %code = loginissue[1:]
                    %signup = ''
                    %login = 'hidden'
                    %if code == '22':
                        Aw, bummer! That username is already taken.
                    %elif code == '23':
                        Usernames must contain only letters or numbers and be between 4 and 12 characters.
                    %elif code == '24':
                        Passwords must contain at least one capital letter, one lower case letter, one number, and be between 6 and 15 characters.
                    %elif code == '25':
                        Please enter a valid e-mail address.
                    %end
                %end
            %else:
                %signup = 'hidden'
                %login = ''
            %end
            </div>
            %end
            <div class="logotext"><span>Axolotl</span></div>
            <form id="signupform" class="{{signup}}" action="/signup" method="post">
                <div class="small-helper">Sign Up:</div>
                <input type="text" name="username" value="" placeholder="Username" title="Between 4 and 12 letters and/or numbers" required><br />
                <input type="password" name="password" value="" placeholder="Password" title="Must contain a lowercase letter, an uppercase letter, and a number. Also must be between 6 and 15 characters" required><br />
                <input type="email" name="email" value="" placeholder="Email Address" required><br />
                <input type="submit" name="submit" value="Submit">
                <div class="alt-action">or... Log In!</div>
            </form>
            <form id="loginform" class="{{login}}" action="/login" method="post">
                <div class="small-helper">Log In:</div>
                <input type="text" name="username" value="" placeholder="Username"><br />
                <input type="password" name="password" value="" placeholder="Password"><br />
                <input type="submit" name="submit" value="Submit">
                <div class="alt-action">or... Sign Up!</div>
            </form>
            <div id='landscape'>
                <h1>Whoops! This app is designed for portrait mode.</h1>
            </div>
        </section>
    </body>
</html>
