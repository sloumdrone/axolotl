<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Axolotl: Contact - {{username}}</title>
        <link href="https://fonts.googleapis.com/css?family=Mukta+Malar" rel="stylesheet">
        <link rel=stylesheet href='https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css' />
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
        <link rel="stylesheet" href="/library/common.css">
        <link rel="stylesheet" href="/library/contact.css">
        <link rel="stylesheet" href="/library/aside.css">
        <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
        <script type="text/javascript" src="/library/nav.js"></script>
    </head>
    <body>
        <div id='mobile'>
            % include('header.tpl')
            <section class='contact-content'>
                <div class='profile-container'>
                    <div class='img-container'>
                        <img class='contact-img' src='/images/brian.jpg' />
                    </div>
                    <div class='info'>
                        <h1>brian evans</h1>
                        <div class='icon-container'>
                            <a href="http://brianmevans.com/" target="_blank"><i class='icon fa fa-rocket'></i></a>
                            <a href="https://www.linkedin.com/in/brian-m-evans/" target="_blank"><i class="icon fa fa-linkedin"></i></a>
                            <a href="https://github.com/sloumdrone" target="_blank"><i class='icon fa fa-github'></i></a>
                        </div>
                    </div>
                </div>
                <div class='profile-container'>
                    <div class='img-container'>
                        <img class='contact-img' src='/images/lori.JPG' />
                    </div>
                    <div class='info'>
                        <h1>lori mitchell</h1>
                        <div class='icon-container'>
                            <a href="https://lorimitchell.tech" target="_blank"><i class='icon fa fa-rocket'></i></a>
                            <a href="https://www.linkedin.com/in/lorimitchell524/" target="_blank"><i class="icon fa fa-linkedin"></i></a>
                            <a href="https://github.com/lmitchell524" target="_blank"><i class='icon fa fa-github'></i></a>
                        </div>
                    </div>
                </div>
            </section>
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
            <section class='dt-contact-content'>
                <div class='dt-profile-container'>
                    <div class='dt-img-container'>
                        <img class='dt-contact-img' src='/images/brian.jpg' />
                    </div>
                    <div class='dt-info'>
                        <h1 class='dt-name'>brian evans</h1>
                        <div class='dt-icon-container'>
                            <a href="http://brianmevans.com/" target="_blank"><i class='dt-icon fa fa-rocket'></i></a>
                            <a href="https://www.linkedin.com/in/brian-m-evans/" target="_blank"><i class="dt-icon fa fa-linkedin"></i></a>
                            <a href="https://github.com/sloumdrone" target="_blank"><i class='dt-icon fa fa-github'></i></a>
                        </div>
                    </div>
                </div>
                <div class='dt-profile-container'>
                    <div class='dt-img-container'>
                        <img class='dt-contact-img' src='/images/lori.JPG' />
                    </div>
                    <div class='dt-info'>
                        <h1 class='dt-name'>lori mitchell</h1>
                        <div class='dt-icon-container'>
                            <a href="https://lorimitchell.tech" target="_blank"><i class='dt-icon fa fa-rocket'></i></a>
                            <a href="https://www.linkedin.com/in/lorimitchell524/" target="_blank"><i class="dt-icon fa fa-linkedin"></i></a>
                            <a href="https://github.com/lmitchell524" target="_blank"><i class='dt-icon fa fa-github'></i></a>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </body>
</html>
