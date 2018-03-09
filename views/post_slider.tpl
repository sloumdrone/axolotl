<!DOCTYPE html>
<html>
    <body>
        <i id='dt-postBtn' class="material-icons">create</i>
        <section class="dt-make-post">
            <form action="/post" id="dt-make-post-form" method="post">
                <div class="textAreaContainer dt-textAreaContainer">
                    <textarea name="dt-message" autocomplete="off" maxlength="200" minlength="1"></textarea>
                    <span class="textCounter dt-textCounter">0/200</span>
                </div>
                <input class='dt-post'type="submit" name="submit" value="post">
            </form>
        </section>
    </body>
</html>
