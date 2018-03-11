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
        <script type="text/javascript" src="/library/nav.js"></script>
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
            % include('dt_header.tpl')
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
