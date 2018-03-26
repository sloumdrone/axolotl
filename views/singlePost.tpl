<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="mobile-web-app-capable" content="yes">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
        <link rel="apple-touch-icon" href="/images/axolotl-icon-apple.png">
        <link rel="apple-touch-startup-image" href="/images/axolotl-icon-256.png">
        <meta name="apple-mobile-web-app-title" content="Axolotl">
        <meta name="theme-color" content="#2d8591">
        <link rel="manifest" href="/library/manifest.json">
        <title>Axolotl: A Social Space</title>
        <link href="https://fonts.googleapis.com/css?family=Mukta+Malar" rel="stylesheet">
        <link rel=stylesheet href='https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css' />
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
        <link rel="stylesheet" href="/library/common.css">
        <link rel="stylesheet" href="/library/contact.css">
        <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
        <script src="/library/singlePost.js"></script>
    </head>
    <body>
        <input type="hidden" name="username" value="{{username}}">
        <input type="hidden" name="time" value="{{time}}">
        <input type="hidden" name="post" value="{{post}}">
        <div id='mobile'>
            <div id='about-header'>
                <div class='dt-sized-header'>
                    <a href='/home'>
                        <div id='about-sitelogo'></div>
                        <h1 class='about-logotext'>Axolotl</h1>
                    </a>
                    <div class='dt-userName'>{{username}}</div>
                </div>
            </div>
            <section class='thread-container'>


            </section>
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
                    <div class='dt-userName'><a href='/' class="dt-backBtn">back</a></div>
                </div>
            </div>
            <section class='dt-thread-container'>

            </section>
        </div>
    </body>
</html>
