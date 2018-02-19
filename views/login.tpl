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
        </style>
        <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
    </head>
    <body>
        <section>
            <div id="logoimage"></div>
            <div class="logotext"><span>Axolotl</span></div>
            <form id="signupform" class="hidden" action="/signup" method="post">
                <div class="small-helper">Sign Up:</div>
                <input type="text" name="username" value="" placeholder="Username"><br />
                <input type="password" name="password" value="" placeholder="Password"><br />
                <input type="email" name="email" value="" placeholder="Email Address"><br />
                <input type="submit" name="submit" value="Submit">
                <div class="alt-action">or... Log In!</div>
            </form>
            <form id="loginform" class="" action="/login" method="post">
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
        </script>
    </body>
</html>
