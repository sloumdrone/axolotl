<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Axolotl: Settings - {{username}}</title>
        <link href="https://fonts.googleapis.com/css?family=Mukta+Malar" rel="stylesheet">
        <link rel=stylesheet href='https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css' />
        <link href="https://fonts.googleapis.com/css?family=Averia+Libre|Neucha" rel="stylesheet">
        <link rel="stylesheet" href="/library/common.css">
        <link rel="stylesheet" href="/library/settings.css">
        <link rel="stylesheet" href="/library/croppie.css">
        <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
        <script src="/library/croppie.js"></script>
        <script src="/library/settings.js" defer></script>
    </head>
    <body>
        % include('header.tpl')
        <section>
            <div class="user-icon">
                <button class='logoutBtn'><a href='/logout'>Log Out</a></button>
                <form id="upload" action="/upload_file" method="post" enctype="multipart/form-data">
                    <img id="iconPreview" alt="your image">
                    <input id="cancelBtn" type="reset" name="cancel" value="cancel">
                    <label for="uploadBtn" class="customUploadBtn"><img src='../images/camera.png'</label>
                    <input id="uploadBtn" type="file" name="upload">
                    <input id="saveBtn" type="submit"  name="submit" value="save">
                </form>
            </div>
            <div class="delete-account">
                <p>Delete Account:</p>
                <p>WARNING!!! This cannot be undone. Only click the button below if you really want to delete your account. You will not be prompted for more information, your account will just be gone. This is not recoverable.</p>
                <div class="image-control">Delete Account</div>
            </div>
        </section>
    </body>
</html>
