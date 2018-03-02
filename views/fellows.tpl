<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Axolotl: Fellows - {{username}}</title>
        <link href="https://fonts.googleapis.com/css?family=Mukta+Malar" rel="stylesheet">
        <link rel=stylesheet href='https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css' />
        <link href="https://fonts.googleapis.com/css?family=Averia+Libre|Neucha" rel="stylesheet">
        <link rel="stylesheet" href="/library/common.css">
        <link rel="stylesheet" href="/library/fellows.css">
        <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
        <script src="/library/fellows.js"></script>
    </head>
    <body>
        % include('header.tpl')
        <section class="search-container">
            <p>add a new fellow:</p>
            <div class="user-search-container">
                <input type="text" name="usersearch" value="" placeholder="username"><div class="search-button"><img class='search-icon' src='/images/binoculars.svg' /></div>
            </div>
        </section>
        <section class="current-fellows-container">
            <div class="fellow-list-container">
                <h2>current fellows</h2>
                <ul id="fellow-list">

                </ul>
            </div>
        </section>
        <footer>
            <h2 class='title'>Axolotl</h2>
        </footer>
    </body>
</html>
