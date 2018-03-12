<!DOCTYPE html>
<html>
<head>
</head>
    <body>
        <section class="make-post">
            <form action="/post" id="make-post-form" method="post">
                <div class="textAreaContainer">
                    <textarea name="message" autocomplete="off" maxlength="200" minlength="1"></textarea>
                    <span class="textCounter">0/200</span>
                </div>
                <input type="submit" name="submit" value="post">
            </form>
        </section>
        <footer>
            <a><div id="sitelogo"></div></a>
            <h2 class='title'>Axolotl</h2>
        </footer>
    </body>
</html>
