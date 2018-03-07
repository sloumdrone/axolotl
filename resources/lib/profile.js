//--->>
//--->>
$(document).ready(profileSpecificClickHandlers);
//---**
//---**
function profileSpecificClickHandlers(){
    $('.add-btn .material-icons').on('click',function(){
        let username = $('#postsToGrab').text();
        let current = $(this).text();
        if (current === 'star'){
            removeFellow(username);
            $(this).text('star_border').toggleClass('empty');
        } else {
            addNewFellow(username);
            $(this).text('star').toggleClass('empty');
        }


    });
}
//---**
//---**
function addNewFellow(fellow){
    $.ajax({
        url: `/new-fellow/${fellow}`,
        success: toggleStar
    });
}
//---**
//---**
function removeFellow(fellow){
    $.ajax({
        url: `/delete_fellow/${fellow}`,
        success: toggleStar
    });
}
//---**
//---**
function toggleStar(){
    $('.add-btn .empty').toggleClass('hide');
    $('.add-btn .full').toggleClass('hide');
}
//---xx
//---xx
