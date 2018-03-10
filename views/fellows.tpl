<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Axolotl: Fellows - {{username}}</title>
        <link href="https://fonts.googleapis.com/css?family=Mukta+Malar" rel="stylesheet">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
        <link rel="stylesheet" href="/library/common.css">
        <link rel="stylesheet" href="/library/fellows.css">
        <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
        <script src="/library/fellows.js"></script>
    </head>
    <body>
        <div id=#mobile>
            % include('header.tpl')
            <div class='content-container'>
                <section class="search-container">
                    <p>add a new fellow:</p>
                    <div class="user-search-container">
                        <input type="text" name="usersearch" value="" placeholder="username"><div class="search-button"><img class='search-icon' src='/images/binoculars.svg' /></div>
                    </div>
                </section>
                <section class="current-fellows-container">
                    <div class="fellow-list-container">
                        <h2>current fellows</h2>
                        <ul id="fellow-list">

                        </ul>
                    </div>
                </section>
            </div>
            <footer>
                <h2 class='title'>Axolotl</h2>
            </footer>
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
                    <i class="material-icons dt-settings">settings</i>
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
                <section class="search-container">
                    <p>add a new fellow:</p>
                    <div class="user-search-container">
                        <input type="text" name="usersearch" value="" placeholder="username"><div class="search-button"><img class='search-icon' src='/images/binoculars.svg' /></div>
                    </div>
                </section>
                <section class="current-fellows-container">
                    <div class="fellow-list-container">
                        <h2>current fellows</h2>
                        <ul id="fellow-list">

                        </ul>
                    </div>
                </section>
            </section>
        </div>
    </body>
</html>
