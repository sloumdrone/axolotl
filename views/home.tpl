<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Axolotl</title>
        <link href="https://fonts.googleapis.com/css?family=Mukta+Malar" rel="stylesheet">
        <link rel=stylesheet href='https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css' />
        <link rel="stylesheet" href="/library/feed.css">
        <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
        <script type="text/javascript" src="/library/main.js"></script>
    </head>
    <body>
        <header class="topbar">
            <p class="currentUser">{{username}}</p>
            <nav>
                <ul>
                    <li><a href="/home"><img class='nav-icon' src='/images/thread.svg' /></a></li>
                    <li><a href="/profile"><img class='nav-icon' src='/images/portrait.svg'/></a></li>
                    <li><a href="/fellows"><img class='nav-icon' src='/images/cheers.svg'/></a> </li>
                    <li><a href="/settings"><img class='nav-icon' src='/images/settings.png'/></a></li>
                    <!-- <li><a href="/logout">Log Out</a></li> -->
                </ul>
            </nav>
        </header>
        <!-- <section class="make-post">
            <form action="/post" id="make-post-form" method="post">
                <textarea name="message" autocomplete="off"></textarea>
                <input type="submit" name="submit" value="&#x270E;">
            </form>
        </section> -->
        <footer>
            <a><div id="sitelogo"></div></a>
            <h2 class='title'>Axolotl</h2>
        </footer>
    </body>
</html>
