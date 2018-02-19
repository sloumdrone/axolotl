<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Axolotl</title>
        <link rel="stylesheet" href="/library/feed.css">
        <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
        <script type="text/javascript" src="/library/main.js"></script>
    </head>
    <body>
        <header class="topbar">
            <div id="sitelogo"></div>
            <nav>
                <ul>
                    <li><a href="/profile/{{username}}">Home</a></li>
                    <li><a href="#">Fellows</a> </li>
                    <li><a href="#">Settings</a> </li>
                    <li><a href="/logout">Log Out</a></li>
                </ul>

            </nav>
        </header>
        <section class="make-post">
            <form action="/post" id="make-post-form" method="post">
                <textarea name="message" autocomplete="off"></textarea>
                <input type="submit" name="submit" value="&#x270E;">
            </form>
        </section>
    </body>
</html>
