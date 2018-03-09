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
                    <div id='dt-sitelogo'></div>
                    <h1 class='dt-logotext'>Axolotl</h1>
                    <i class="material-icons dt-settings">settings</i>
                    <ul class='dt-settings-list'>
                        <li><a href='/logout'>log out</a></li>
                        <li class='dt-edit-bio'>edit bio</li>
                        <li class='dt-edit-email'>edit email</li>
                        <li><a href='/contact'>contact us</a></li>
                        <li class='dt-delete-account-btn'>delete account</li>
                    </ul>
                </div>
            </div>
            <section class="dt-edit-email-modal dt-modal dt-hide">
                <h3>current email</h3>
                <h3 class='dt-current-email'>filler email</h3>
                <form action="/user_update" id="dt-bio-form" method="post">
                    <div class="dt-textAreaContainer">
                        <input name="content" autocomplete="off" minlength="1"></input>
                        <input type="hidden" name="type" value="email"><br />
                    </div>
                    <button class='dt-modal-btn dt-save' type="submit" name="emailsave" value="save">save</button>
                    <button class='dt-modal-btn dt-cancel-email' type="reset" name="emailcancel" value="cancel">cancel</button>
                </form>
            </section>
            <section class="dt-edit-bio-modal dt-modal dt-hide">
                <h3>edit bio</h3>
                <form id="dt-bio-form" action="/user_update" method="post">
                    <div class="dt-textAreaContainer">
                        <textarea class="dt-bio-textarea" name="content" autocomplete="off" maxlength="85" minlength="1"></textarea>
                        <span id="dt-textCounter">0/85</span>
                        <input type="hidden" name="type" value="bio">
                    </div>
                    <button class='dt-save-bio dt-modal-btn' type="submit" name="biosave" value="save">save</button>
                    <button class='dt-cancel-bio dt-modal-btn' type="reset" name="biocancel" value="cancel">cancel</button>
                </form>
            </section>
            <div class="dt-delete-account-modal dt-modal dt-hide">
                <p><span class='warning-text'>WARNING!!!</span> This CANNOT be undone and is not recoverable.</p>
                <div class='dt-cancel-delete dt-modal-btn'>cancel</div>
                <div class="dt-confirm-delete dt-modal-btn">delete</div>
            </div>
            <section class='dt-content-container'>
                % include('aside.tpl')
                % include('post_slider.tpl')
                <section class='dt-thread-container'>
                </section>
            </section>
        </div>
    </body>
</html>
