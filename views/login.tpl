<html>
    <head>
        <title>Axolotl</title>
        <style>
            section {
                height: 550px;
                width: 320px;
                border: 1px solid #2F3331;
                text-align: center;
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%,-50%);
                border-radius: 10px;
                padding: 10px;
                background-color: #FCFDFF;
                box-shadow: 5px 5px 10px silver;
            }

            form {
                text-align: center;
                margin: 10px auto;
                transition-duration: 1s;
            }

            form input {
                width: 90%;
                height: 50px;
                border: 1px solid #2F3331;
                border-radius: 5px;
                color: black;
                font-size: 0.9em;
                font-family: sans-serif, monospace;
                margin: 5px auto;
                padding-left: 10px;
            }

            form input[type=submit] {
                width: 45%;
                background-color: #87D68D;
                color: #FCFDFF;
                cursor: pointer;
                font-size: 1.5em;
                transition-duration: 0.5s;
                position: absolute;
                right: 8%;
                bottom: 16%;
            }

            form input[type=submit]:hover {
                background-color: #86c98b;
                color: #FCFDFF;
            }

            .small-helper {
                font-size: 0.9em;
                color: #706F6F;
                font-family: sans-serif, monospace;
                margin: 2px 0 2px 9%;
                text-align: left;
                font-weight: bold;
            }



            #logoimage {
                display: block;
                background-image: url('/images/axolotl.png');
                background-size: cover;
                border-radius: 100%;
                border: 4px solid #706F6F;
                background-position: bottom;
                width: 110px;
                height: 110px;
                margin: auto;
                background-color: #FFF;
            }

            .logotext {
                width: 67%;
                height: 11%;
                color: #706F6F;
                background-color: #B8E1FF;
                font-size: 3em;
                margin: -10px auto 20px auto;
                border-radius: 10px;
                font-family: monospace;
                text-shadow: 1px 1px 4px #FCFDFF;
                border: 3px solid #706F6F;
                position: relative;
            }

            .logotext span {
                position: absolute;
                display: inline-block;
                left: 50%;
                top: 50%;
                transform: translate(-50%,-50%);
            }

            .alt-action {
                font-size: 1em;
                color: #706F6F;
                font-family: sans-serif, monospace;
                margin: 80px auto 0 auto;
                text-align: center;
                clear: right;
                cursor: pointer;
                text-decoration: underline;
                position: absolute;
                bottom: 20px;
                left: 50%;
                transform: translateX(-50%);
            }

            .hidden {
                display: none;
            }

            .wordBubble {
                color: red;
                font-size: 0.8rem;
                width: 200px;
                position: absolute;
                top: 10px;
                left: 70%;
                text-align: center;
                border: 1px solid #706F6F;
                background-color: #fbf9f6;
                border-radius: 10px 10px 10px 0px;
                padding: 10px;
                box-shadow: 5px 5px 10px silver;
                user-select: none;
            }
        </style>
        <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
    </head>
    <body>
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
                <input type="text" name="username" value="" placeholder="Username" pattern="[A-Za-z0-9]{4,12}" required><br />
                <input type="password" name="password" value="" placeholder="Password" pattern="^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])\w{6,15}$" required><br />
                <input type="email" name="email" value="" placeholder="Email Address"><br />
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
        </section>
        <script>
            $('.alt-action').click(function(){
                $('form').toggleClass('hidden');
            });

            setTimeout(function(){
                $('.wordBubble').hide('fast');
            },8000);
        </script>
    </body>
</html>
