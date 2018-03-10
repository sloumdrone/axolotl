//--->>
//--->>
$(document).ready(function () {
    applyClickHandlers();
    getFellowsList();
});
//---**
//---**
function applyClickHandlers(){
    let $searchBtn = $('.search-button');

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

    let $post = $('section.make-post');
    let $dt_postBtn = $('#dt-postBtn');
    let $dt_post = $('section.dt-make-post');
    let $dt_settings = $('.dt-settings');
    let $dt_menu = $('.dt-settings-list')
    let modalOpen = false;

//nav click handlers

    $dt_postBtn.click(() => {
        $dt_post.slideToggle();
    });

    $dt_settings.click((e) => {
        if(!modalOpen){
            e.stopPropagation();
            $dt_menu.slideToggle();
        }
    });

    $('.dt-sub-nav a').click(() => {
        $dt_menu.slideUp();
    });

    $(document.body).click( function(e) {
         closeNav();
    });

    $('.dt-settings-li-item').hover(() => {
        $('.dt-sub-nav').slideToggle();
    })

// Modal click handlers

    $('.dt-edit-email').click(() => {
        $('.dt-edit-email-modal').removeClass('dt-hide');
        modalOpen = true;
    });

    $('.dt-cancel-email').click(() => {
        $('.dt-edit-email-modal').addClass('dt-hide');
        modalOpen = false;
    });

    $('.dt-edit-bio').click(() => {
        $('.dt-edit-bio-modal').removeClass('dt-hide');
        modalOpen = true;
    });

    $('.dt-cancel-bio').click(() => {
        $('.dt-edit-bio-modal').addClass('dt-hide');
        modalOpen = false;
    });

    $('.dt-delete-account-btn').click(() => {
        $('.dt-delete-account-modal').removeClass('dt-hide');
        modalOpen = true;
    });

    $('.dt-cancel-delete').click(() => {
        $('.dt-delete-account-modal').addClass('dt-hide');
        modalOpen = false;
    });

// textarea click handlers


    $('.textAreaContainer textarea').on('keyup',function(){
        let length = $(this).val().length
        if (length > 200){
            $(this).val($(this).val().substring(0,200));
            length = 200;
        }
        $('.textCounter').text(`${length}/200`);
    });

    $('.dt-message').on('keyup',function(){
        let length = $(this).val().length
        if (length > 200){
            $(this).val($(this).val().substring(0,200));
            length = 200;
        }
        $('.dt-textCounter').text(`${length}/200`);
    });

    $('.dt-bio-textarea').on('keyup',function(){
        let length = $(this).val().length
        if (length > 85){
            $(this).val($(this).val().substring(0,85));
            length = 85;
        }
        $('#dt-textCounter-bio').text(`${length}/85`);
    });
}
//---**
//---**
function closeNav(){
    $('.dt-settings-list').slideUp();
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
//---xx
//---xx
