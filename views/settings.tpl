<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="theme-color" content="#2d8591">
        <meta name="mobile-web-app-capable" content="yes">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
        <link rel="apple-touch-icon" href="/icons/axolotl-icon-192.png">
        <link rel="manifest" href="/library/manifest.json">
        <title>Axolotl: Settings - {{username}}</title>
        <link href="https://fonts.googleapis.com/css?family=Mukta+Malar" rel="stylesheet">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
        <link rel="stylesheet" href="/library/common.css">
        <link rel="stylesheet" href="/library/settings.css">
        <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
        <script type="text/javascript" src="/library/nav.js"></script>
        <script src="/library/settings.js" defer></script>
    </head>
    <body>
        <div id='mobile'>
            % include('header.tpl')
            <section id='content-container'>
                <div class="user-icon">
                    <a href='/logout' class='logoutBtn'>log out</a>
                    <form id="upload" action="/upload_file" method="post" enctype="multipart/form-data">
                        <img id="iconPreview" alt="your image">
                        <input id="cancelBtn" type="reset" name="cancel" value="cancel">
                        <label for="uploadBtn" class="customUploadBtn"><img src='../images/camera.png'</label>
                        <input id="uploadBtn" type="file" name="upload">
                        <input id="saveBtn" type="submit"  name="submit" value="save">
                    </form>
                </div>
                <div button-container>
                    <a class='contact-link' href='/contact'><button class='settingsBtn'><img class='button-icon' src='/images/unicorn.svg' />contact us<img class='arrow' src='/images/arrow.svg' /></button></a>
                    <button class='settingsBtn edit-email-btn'><img class='button-icon' src='/images/pencil.svg' />edit email</button>
                    <button class='settingsBtn edit-bio-btn'><img class='button-icon' src='/images/edit.svg' />edit bio</button>
                    <button class='settingsBtn deleteBtn'><img class='button-icon' src='/images/trashcan.svg' />delete account</button>
                </div>
            </section>
            <section class="edit-email">
                <h3>current email</h3>
                <h3 class='current-email'>{{email}}</h3>
                <form action="/user_update" id="email-form" method="post">
                    <div class="textAreaContainer">
                        <input name="content" autocomplete="off" minlength="1"></input>
                        <input type="hidden" name="type" value="email"><br />
                    </div>
                    <input class='save-email bio-btn' type="submit" name="emailsave" value="save">
                    <input class='cancel-email bio-btn' type="reset" name="emailcancel" value="cancel">
                </form>
            </section>
            <section class="edit-bio">
                <h3>edit bio</h3>
                <form id="bio-form" action="/user_update" method="post">
                    <div class="textAreaContainer">
                        <textarea name="content" autocomplete="off" maxlength="85" minlength="1"></textarea>
                        <span id="textCounter">0/85</span>
                        <input type="hidden" name="type" value="bio">
                    </div>
                    <input class='save-bio bio-btn' type="submit" name="biosave" value="save">
                    <input class='cancel-bio bio-btn' type="reset" name="biocancel" value="cancel">
                </form>
            </section>
            <div class="delete-account">
                <div class="confirm-account-delete">
                    <p>WARNING!!! This CANNOT be undone and is not recoverable.</p>
                    <div class='image-control cancel-delete'>cancel</div>
                    <div class="image-control confirm-delete">delete account</div>
                </div>
                <div class="execute-account-delete hide">
                    <div class="pwerror hide">
                        Invalid password.
                    </div>
                    <p>Enter password for {{username}}:</p>
                    <input type="password" name="pwd" value="" class="pwinput" id="pwinput" autocomplete="off" minlength="1">
                    <div class='image-control cancel-delete'>cancel</div>
                    <button class="image-control" id="deleteAccount">delete</button>
                </div>

            </div>
            <footer>
                <h2 class='title'>Axolotl</h2>
            </footer>
            <div id='landscape'>
                <h1>Whoops! This app is designed for portrait mode.</h1>
            </div>
        </div>
        <div id='desktop'>
            % include('dt_header')
            <div class='dt-container'>
                <h1 class='dt-settings-message'>Looks like you've switched from mobile to desktop. Click here to go to the home page.</h1>
                <a href='/home'><button class='dt-home-btn'>home</button></a>
            </div>
        </div>
    </body>
</html>
