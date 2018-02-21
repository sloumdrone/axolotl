<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Axolotl: Fellows - {{username}}</title>
        <link href="https://fonts.googleapis.com/css?family=Averia+Libre|Neucha" rel="stylesheet">
        <link rel="stylesheet" href="/library/fellows.css">
        <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
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
        <section class="green-container">
            <p>Add a new fellow:</p>
            <div class="user-search-container">
                <input type="text" name="usersearch" value="" placeholder="Username"><div class="search-button">&#x270A;</div>
            </div>
        </section>
        <section class="white-container">
            <div class="fellow-list-container">
                <h2>Current Fellows</h2>
                <ul id="fellow-list">

                </ul>
            </div>
        </section>
    </body>
</html>
