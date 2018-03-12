<!DOCTYPE html>
<html>
    <body>
        <aside id='dt-aside'>
            <div class='dt-profile-pic' style='background-image: url("/images/user/{{posts_user}}.JPEG")'></div>
                <div class="post-user-name dt-currentUser"><span id="postsToGrab">{{posts_user}}</span></div>
                %if friend:

                    <button class='dt-add-btn'><i class="material-icons dt-star">star</i></button>
                %else:
                    <button class='dt-add-btn'><i class="material-icons dt-star empty">star_border</i></button>
                %end
                <div class='dt-bio'>
                    {{bio}}
                </div>
                % include('post_slider.tpl')
        </aside>
    </body>
</html>
