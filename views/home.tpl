<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Axolotl</title>
        <link href="https://fonts.googleapis.com/css?family=Mukta+Malar" rel="stylesheet">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
        <link rel="stylesheet" href="/library/common.css">
        <link rel="stylesheet" href="/library/home.css">
        <link rel="stylesheet" href="/library/aside.css">
        <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
        <script type="text/javascript" src="/library/posts.js"></script>
    </head>
    <body>
        <div id='mobile'>
            % include('header.tpl')
            <section class='thread-container'>
            </section>
            % include('footer.tpl')
            <div id='landscape'>
                <h1>Whoops! This app is designed for portrait mode.</h1>
            </div>
        </div>
        <div id='desktop'>
            <div id='dt-header'>
                <div class='dt-sized-header'>
                    <a href='/home'>
                        <div id='dt-sitelogo'></div>
                        <h1 class='dt-logotext'>Axolotl</h1>
                    </a>
                    <i class="material-icons dt-settings">line_weight</i>
                    <ul class='dt-settings-list'>
                        <li><a href='/fellows'>fellows</a></li>
                        <li><a href='/logout'>log out</a></li>
                        <li class='dt-edit-bio'>edit bio</li>
                        <li class='dt-edit-email'>edit email</li>
                        <li><a href='/contact'>contact us</a></li>
                        <li class='dt-delete-account-btn'>delete account</li>
                    </ul>
                </div>
            </div>
            % include('setting_modals.tpl')
            <section class='dt-content-container'>
                % include('aside.tpl')
                % include('post_slider.tpl')
                <section class='dt-thread-container'>
                </section>
            </section>
        </div>
    </body>
</html>
