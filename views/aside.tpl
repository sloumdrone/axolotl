<!DOCTYPE html>
<html>
    <body>
        <aside id='dt-aside'>
            % from random import *
            % hash = randint(1,500)
            <a href="/profile/{{username}}"><div class='dt-profile-pic' style='background-image: url("/images/user/{{username}}.JPEG?hash={{hash}}")'></div></a>

            <p class="dt-currentUser">{{username}}</p>
            <div class='dt-bio'>
                {{bio}}
            </div>
            % include('post_slider.tpl')
        </aside>
    </body>
</html>
