<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="mobile-web-app-capable" content="yes">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
        <link rel="apple-touch-icon" href="/images/axolotl-icon-192.png">
        <meta name="theme-color" content="#2d8591">
        <link rel="manifest" href="/library/manifest.json">
        <title>Axolotl: Fellows - {{username}}</title>
        <link href="https://fonts.googleapis.com/css?family=Mukta+Malar" rel="stylesheet">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
        <link rel="stylesheet" href="/library/common.css">
        <link rel="stylesheet" href="/library/fellows.css">
        <link rel="stylesheet" href="/library/aside.css">
        <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
        <script type="text/javascript" src="/library/nav.js"></script>
        <script type="text/javascript" src="/library/fellows.js"></script>
    </head>
    <body>
        <div id='mobile'>
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
                        <ul class="fellow-list">

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
            % include('dt_header.tpl')
            % include('setting_modals.tpl')
            <section class='dt-content-container'>
                % include('aside.tpl')
                <section class='dt-fellows-container'>
                    <section class="search-container dt-search-container">
                        <p>add a new fellow:</p>
                        <div class="dt-user-search-container">
                            <input type="text" name="usersearch" value="" placeholder="username"><div class="search-button"><img class='search-icon dt-search-icon' src='/images/binoculars.svg' /></div>
                        </div>
                    </section>
                    <section class="current-fellows-container dt-current-fellows-container">
                        <div class="fellow-list-container dt-fellow-list-container">
                            <h2>current fellows</h2>
                            <ul class='dt-fellow-list'>

                            </ul>
                        </div>
                    </section>
                </section>
            </section>
        </div>
    </body>
</html>
