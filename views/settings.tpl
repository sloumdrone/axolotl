<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Axolotl: Settings - {{username}}</title>
        <link href="https://fonts.googleapis.com/css?family=Mukta+Malar" rel="stylesheet">
        <link rel="stylesheet" href="/library/common.css">
        <link rel="stylesheet" href="/library/settings.css">
        <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
        <script src="/library/settings.js" defer></script>
    </head>
    <body>
        % include('header.tpl')
        <section id='content-container'>
            <div class="user-icon">
                <a href='/logout' class='logoutBtn'><button>log out</button></a>
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
            <section class="edit-email">
                <h3>edit email</h3>
                <form action="/user_update" id="bio-form" method="post">
                    <div class="textAreaContainer">
                        <input name="content" autocomplete="off" minlength="1"></input>
                        <input type="hidden" name="type" value="email"><br />
                        Current e-mail: {{email}}
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
                <p>WARNING!!! This CANNOT be undone and is not recoverable.</p>
                <div class='image-control cancel-delete'>cancel</div>
                <div class="image-control confirm-delete">delete account</div>
            </div>
            <footer>
                <h2 class='title'>Axolotl</h2>
            </footer>
        </section>
    </body>
</html>
