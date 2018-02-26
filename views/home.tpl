<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Axolotl</title>
        <link href="https://fonts.googleapis.com/css?family=Mukta+Malar" rel="stylesheet">
        <link rel=stylesheet href='https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css' />
        <link rel="stylesheet" href="/library/common.css">
        <link rel="stylesheet" href="/library/feed.css">
        <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
        <script type="text/javascript" src="/library/main.js"></script>
    </head>
    <body>
        % include('header.tpl')
        <section class='thread-container'>
        </section>
        <section class="make-post hide">
            <img class='think-bubble' src='/images/thinkbubble.png' />
            <form action="/post" id="make-post-form" method="post">
                <textarea name="message" autocomplete="off"></textarea>
                <!-- <input type="submit" name="submit" value="&#x270E;"> -->
            </form>
        </section>
        % include('footer.tpl')
    </body>
</html>