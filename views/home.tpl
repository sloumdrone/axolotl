<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Axolotl</title>
        <link href="https://fonts.googleapis.com/css?family=Mukta+Malar" rel="stylesheet">
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
                <div class='dt-logo-container'>
                    <div id='dt-sitelogo'></div>
                    <h1 class='dt-logotext'>Axolotl</h1>
                </div>
            </div>
            <section class='dt-content-container'>
                % include('aside.tpl')
                <section class='dt-thread-container'>
                </section>
            </section>
        </div>
    </body>
</html>
