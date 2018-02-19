<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Axolotl</title>
        <style>
            body {
                background-color: #FCFDFF;
            }

            #logout {
                display: inline-block;
                position: fixed;
                top: 10px;
                right: 25px;
            }

            #sitelogo {
                background-image: url(/images/axolotl.png);
                background-size: cover;
                border-radius: 100%;
                border: 3px solid #706F6F;
                background-position: bottom;
                width: 110px;
                height: 110px;
                background-color: #FFF;
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
            }

            section.upload {
                width: 750px;
                border-left: 3px solid #706F6F;
                border-right: 3px solid #706F6F;
                margin: 0 auto;
                background-color: #87D68D;
                padding: 10px 0;
            }

            header {
                position: relative;
                width: 750px;
                height: 150px;
                background-color: #B8E1FF;
                color: #2F3331;
                margin: 10px auto 0 auto;
                border: 3px solid #706F6F;
                border-bottom: 1px solid antiquewhite;
                border-radius: 50px 50px 0 0;
            }

            nav {
                position: absolute;
                bottom: 0px;
                right: 0px;
            }

            nav ul {
                list-style: none;
                margin-bottom: 0;
            }

            nav ul li {
                display: inline-block;
                color: #706F6F;
                font-size: 1.1em;
                font-family: monospace;
                background-color: antiquewhite;
                padding: 5px 10px;
                border-radius: 5px 5px 0 0;
            }

            #file-upload {
                width: 60%;
                height: 100px;
                border: 3px dashed #FCFDFF;
                color: #FCFDFF;
                text-align: center;
                margin: 0 auto;
                border-radius: 10px;
            }

            .post-container {
                width: 750px;
                height: auto;
                position: relative;
                border-left: 3px solid #706F6F;
                border-right: 3px solid #706F6F;
                margin: 0 auto;
                background-color: white;
            }

            .post-header {
                width: 100%;
                height: 70px;
                display: block;
            }

            .post-user-image {
                width: 50px;
                height: 50px;
                border-radius: 5px;
                float: left;
                margin: 10px;
                display: inline-block;
                background-image: url(/images/axolotl.png);
                background-size: cover;
                background-color: white;
                border: 2px solid #706F6F;
            }

            .post-user-name {
                float:left;
                color: #2F3331;
                display: inline-block;
                margin: 10px;
                font-family: monospace;
                font-size: 1.5em;
                vertical-align: middle;
            }

            .post-body {
                font-size: 1.6em;
                color: #2F3331;
                text-align: center;
                font-family: sans-serif, serif;
                padding-left: 15px;
                padding-right: 15px;
            }

            .post-like {
                color: red;
                border-bottom: 1px solid #706F6F;
                font-size: 2em;
                padding-right: 20px;
                text-align: right;
            }
        </style>
        <script type="text/javascript" src="/library/dropzone.js"></script>
    </head>
    <body>
        <header class="topbar">
            <div id="sitelogo"></div>
            <nav>
                <ul>
                    <li><a href="/profile/{{username}}">Home</a></li>
                    <li><a href="#">Fellows</a> </li>
                    <li><a href="#">Settings</a> </li>
                    <li><a href="/logout">Log Out</a></li>
                </ul>

            </nav>
        </header>
        <section class="upload">
            <form action="/image_post" class="dropzone" id="file-upload">
                <input type="hidden" name="username" value="{{username}}">
            </form>
        </section>
        <div class="post-container">
            <div class="post-header">
                <div class="post-user-image"></div>
                <div class="post-user-name">I_am_a_user_name</div>
            </div>
            <p class="post-body">Man, Trumps tweets really blow.</p>
            <div class="post-footer">
                <div class="post-like">&hearts;</div>
            </div>
        </div>
        <div class="post-container">
            <div class="post-header">
                <div class="post-user-image"></div>
                <div class="post-user-name">I_am_a_user_name</div>
            </div>
            <p class="post-body">What is up internet? Is this what tweeting is like?</p>
            <div class="post-footer">
                <div class="post-like">&#x2661;</div>
            </div>
        </div>
    </body>
</html>
<!-- Making a twitter clone. Start doing morme styling and then -->
