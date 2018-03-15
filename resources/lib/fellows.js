//--->>
//--->>
$(document).ready(function () {
    applyFellowClickHandlers();
    getFellowsList();
    $('#mobile .user-search-container input').on('focus',resizeForKeybaobrd)
});
//---**
//---**
function applyFellowClickHandlers(){
    let $searchBtn = $('.search-button');
    let $postBtn = $('#sitelogo');
    let $post = $('section.make-post');
    let $dt_postBtn = $('#dt-postBtn');
    let $dt_post = $('section.dt-make-post');

    $searchBtn.click(() => {
        $fellowName = $('.user-search-container input[name=usersearch]').val();
        $fellowNameDt = $('.dt-user-search-container input[name=usersearch]').val();
        if ($fellowName.length > 2){
            addNewFellow($fellowName);
            $('.user-search-container input[name=usersearch]').val('');
        } else if ($fellowNameDt.length > 2){
            addNewFellow($fellowNameDt);
            $('.dt-user-search-container input[name=usersearch]').val('');
        }
    });

    $('.fellow-list, .dt-fellow-list').on('click','.dt-star',function(){
        removeFellow(event.target);

    });

    $postBtn.click(() => {
        $post.toggleClass('show');
    });

    $dt_postBtn.click(() => {
        $dt_post.slideToggle();
    });
}
//---**
//---**
function removeFellow(){
    $.ajax({
        url: `/delete_fellow/${event.target.axolotlFellow}`,
        success: function(result){
            getFellowsList();
        }
    });
}
//---**
//---**
function addNewFellow(fellow){
    $.ajax({
        url: `/new-fellow/${fellow}`,
        success: function(result){
            result = JSON.parse(result);
            if (result.success){
                getFellowsList();
            }
        }
    });
}
//---**
//---**
function getFellowsList(){
    $('.fellow-list, .dt-fellow-list').empty();
    $.ajax({
        url: '/get_fellows',
        method: 'GET',
        success: function(result){
            result = JSON.parse(result);
            for (let i = 0; i < result.length; i++){
                buildFellowForList(result[i]);
            }
        },
        error: function(result){
            console.warn(result);
        }
    });
}
//---**
//---**
function buildFellowForList(fellow){
    let $ul = $('.fellow-list');
    let $ulDesktop = $('.dt-fellow-list');
    let $listItem = $('<li>');
    let $listItemDt = $('<li>');
    let $aLink = $('<a>',{href: '/profile/' + fellow})
    let $aLinkDt = $('<a>',{href: '/profile/' + fellow})
    let $image = $('<div>',{class: 'post-user-image'}).css({'background-image':`url(/images/user/${fellow}.JPEG)`});
    let $imageDt = $('<div>',{class: 'post-user-image'}).css({'background-image':`url(/images/user/${fellow}.JPEG)`});
    let $userName = $('<h1>', {class: 'username', text: fellow});
    let $userNameDt = $('<h1>', {class: 'username', text: fellow});

    let $deleteBtn = $('<i>', {class: 'material-icons dt-star', text: 'star'})
    let $deleteBtnDt = $('<i>', {class: 'material-icons dt-star', text: 'star'})
    $deleteBtn[0].axolotlFellow = fellow;
    $deleteBtnDt[0].axolotlFellow = fellow;
    $listItem.append($image,$userName,$deleteBtn);
    $listItemDt.append($imageDt,$userNameDt,$deleteBtnDt);
    $userName.wrap($aLink);
    $userNameDt.wrap($aLinkDt);
    $image.wrap($aLink);
    $imageDt.wrap($aLinkDt);
    $ul.append($listItem);
    $ulDesktop.append($listItemDt);
    return $listItem;
}
//--**
//--**
function resizeForKeybaobrd(){
    console.log('trigger resize');
    setTimeout(function () {
        let viewheight = $(window).height();
        let viewwidth = $(window).width();
        let viewport = document.querySelector("meta[name=viewport]");
        viewport.setAttribute("content", "height=" + parseInt(viewheight) + "px, width=" + parseInt(viewwidth) + "px, initial-scale=1.0");
    }, 300);
}
//---xx
//---xx
setTimeout(function () {
    let viewheight = $(window).height();
    let viewwidth = $(window).width();
    let viewport = document.querySelector("meta[name=viewport]");
    viewport.setAttribute("content", "height=" + parseInt(viewheight) + "px, width=" + parseInt(viewwidth) + "px, initial-scale=1.0");
}, 300);
