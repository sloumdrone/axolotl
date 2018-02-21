<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Axolotl: Settings - {{username}}</title>
        <link href="https://fonts.googleapis.com/css?family=Averia+Libre|Neucha" rel="stylesheet">
        <link rel="stylesheet" href="/library/croppie.css">
        <link rel="stylesheet" href="/library/settings.css">
        <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
        <script src="/library/croppie.js"></script>
    </head>
    <body>
        <header class="topbar">
            <div id="sitelogo"></div>
            <nav>
                <ul>
                    <li><a href="/profile">Home</a></li>
                    <li><a href="/fellows">Fellows</a> </li>
                    <li><a href="/settings">Settings</a> </li>
                    <li><a href="/logout">Log Out</a></li>
                </ul>

            </nav>
            <span class="currentUser">{{username}}</span>
        </header>
        <section>
            <div class="user-icon">
                <p>User Icon:</p>
                <div class="">
                    <div id="crop-container"></div>
                    <div class="update-cropper">
                        <div class="image-control">Select Image</div>
                        <div class="image-control">Set Icon</div>
                        <div class="hidden">Cancel</div>
                    </div>
                </div>
            </div>
        </section>
        <section>
            <div class="delete-account">
                <p>Delete Account:</p>
                <p>WARNING!!! This cannot be undone. Only click the button below if you really want to delete your account. You will not be prompted for more information, your account will just be gone. This is not recoverable.</p>
                <div class="image-control">Delete Account</div>

            </div>
        </section>
        <script type="text/javascript">
            var user = $('.currentUser').text();
            var basic = $('#crop-container').croppie({
                viewport: { width: 50, height: 50 },
                boundary: { width: 65, height: 65 },
                showZoomer: true,
                url: `/images/${user}.jpg`
            });
        </script>
    </body>
</html>
