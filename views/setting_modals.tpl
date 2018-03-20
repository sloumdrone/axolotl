<!DOCTYPE html>
<html>
    <body>
        <section class="dt-edit-email-modal dt-modal dt-hide">
            <h3>current email</h3>
            <h3 class='dt-current-email'>{{email}}</h3>
            <form action="/user_update" id="dt-bio-form" method="post">
                <div class="dt-textAreaContainer">
                    <input name="content" autocomplete="off" minlength="1"></input>
                    <input type="hidden" name="type" value="email"><br />
                </div>
                <button class='dt-modal-btn dt-save' type="submit" name="emailsave" value="save">save</button>
                <button class='dt-modal-btn dt-cancel-email' type="reset" name="emailcancel" value="cancel">cancel</button>
            </form>
        </section>
        <section class="dt-edit-bio-modal dt-modal dt-hide">
            <h3>edit bio</h3>
            <form id="dt-bio-form" action="/user_update" method="post">
                <div class="dt-textAreaContainer">
                    <textarea class="dt-bio-textarea" name="content" autocomplete="off" maxlength="85" minlength="1"></textarea>
                    <span id="dt-textCounter-bio">0/85</span>
                    <input type="hidden" name="type" value="bio">
                </div>
                <button class='dt-save-bio dt-modal-btn' type="submit" name="biosave" value="save">save</button>
                <button class='dt-cancel-bio dt-modal-btn' type="reset" name="biocancel" value="cancel">cancel</button>
            </form>
        </section>
        <section class="dt-modal dt-hide dt-edit-image-modal">
            <h3>edit user image</h3>
            <form id="upload" action="/upload_file" method="post" enctype="multipart/form-data">
                <img id="iconPreview" alt="your image">
                <input id="cancelBtn" type="reset" class="dt-modal-btn" name="cancel" value="cancel">
                <label for="uploadBtn" class="customUploadBtn"><img src='../images/camera.png' /></label>
                <input id="uploadBtn" type="file" name="upload">
                <input id="saveBtn" type="submit" class="dt-modal-btn"  name="submit" value="save">
            </form>
            <p class="smallText">* accepts: jpg, jpeg, and gif (non-animated)</p>
        </section>


        <div class="dt-delete-account-modal dt-modal dt-hide">
            <p><span class='warning-text'>WARNING!!!</span> This CANNOT be undone and is not recoverable.</p>
            <div class='dt-cancel-delete dt-modal-btn'>cancel</div>
            <div class="dt-confirm-delete dt-modal-btn">delete</div>
        </div>

        <script type="text/javascript">



        </script>
    </body>
</html>
