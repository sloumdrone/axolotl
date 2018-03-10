//--->>
//--->>
$(document).ready(profileSpecificClickHandlers);
//---**
//---**
function profileSpecificClickHandlers(){
    $('.add-btn').on('click','.material-icons',function(){
        starHandler(this);
    });

    $('.dt-add-btn').on('click','.dt-star',function(){
        starHandler(this);
    });
}
//---**
//---**
function starHandler(context){
    let username = $('#postsToGrab').text();
    let current = $(context).text();
    if (current === 'star'){
        removeFellow(username);
        $(context).text('star_border').toggleClass('empty');
    } else {
        addNewFellow(username);
        $(context).text('star').toggleClass('empty');
    }
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
