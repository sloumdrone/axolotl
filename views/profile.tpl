<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="theme-color" content="#2d8591">
        <meta name="mobile-web-app-capable" content="yes">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
        <link rel="apple-touch-icon" href="/images/axolotl-icon-apple.png">
        <link rel="apple-touch-startup-image" href="/images/axolotl-icon-256.png">
        <meta name="apple-mobile-web-app-title" content="Axolotl">
        <link rel="manifest" href="/library/manifest.json">
        <title>Axolotl</title>
        <link href="https://fonts.googleapis.com/css?family=Mukta+Malar" rel="stylesheet">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
        <link rel="stylesheet" href="/library/common.css">
        <link rel="stylesheet" href='/library/profile.css' >
        <link rel="stylesheet" href="/library/aside.css">
        <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
        <script type="text/javascript" src="/library/posts.js"></script>
        <script type="text/javascript" src="/library/nav.js"></script>
        <script type="text/javascript" src="/library/profile.js"></script>
    </head>
    <body>
        <div id='mobile'>
            % include('header.tpl')
            <section class='thread-container'>
                <div class="profile-header">
                    <div class='profile-pic' style='background-image: url("/images/user/{{posts_user}}.JPEG")'></div>
                    <div class='user-info'>
                        <div class="post-user-name"><span id="postsToGrab">{{posts_user}}</span></div>
                        %if friend:

                            <button class='add-btn'><i class="material-icons">star</i></button>
                        %else:
                            <button class='add-btn'><i class="material-icons empty">star_border</i></button>
                        %end
                        <div class='bio'>
                            {{bio}}
                        </div>
                    </div>
                </div>
                <div class="post-container">
                </div>
            </section>
            % include('footer.tpl')
            <div id='landscape'>
                <h1>Whoops! This app is designed for portrait mode.</h1>
            </div>
        </div>
        <div id='desktop'>
            % include('dt_header.tpl')
            % include('setting_modals.tpl')
            <section class='dt-content-container'>
                % include('profile_aside.tpl')
                <section class='dt-thread-container'>
                </section>
            </section>
        </div>
    </body>
</html>
