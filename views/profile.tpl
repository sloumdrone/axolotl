<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Axolotl</title>
        <link href="https://fonts.googleapis.com/css?family=Mukta+Malar" rel="stylesheet">
        <!-- <link rel=stylesheet href='https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css' /> -->
        <!-- <script defer src="https://use.fontawesome.com/releases/v5.0.8/js/all.js"></script> -->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
        <link rel="stylesheet" href="/library/common.css">
        <link rel="stylesheet" href='/library/profile.css' >
        <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
        <script type="text/javascript" src="/library/posts.js"></script>
        <script type="text/javascript" src="/library/profile.js"></script>
    </head>
    <body>
        % include('header.tpl')
        <section class='thread-container'>
            <div class="profile-header">
                <div class='profile-pic' style='background-image: url("/images/user/{{posts_user}}.JPEG")'></div>
                <div class='user-info'>
                    <div class="post-user-name"><span id="postsToGrab">{{posts_user}}</span></div>
                    %if friend:

                        <button class='add-btn'><i class="material-icons">star</i></button>
                    %else:
                        <button class='add-btn'><i class="material-icons empty">star_border</i></button>
                    %end
                    <div class='bio'>
                        {{bio}}
                    </div>
                </div>
            </div>
            <div class="post-container">
            </div>
        </section>
        % include('footer.tpl')
    </body>
</html>
