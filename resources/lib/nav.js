$(document).ready(function () {
    applyClickHandlers();
});
//---**
//---**
function applyClickHandlers(){
    let $dt_settings = $('.dt-settings');
    let $dt_menu = $('.dt-settings-list')
    let modalOpen = false;

// nav click handlers

    $dt_settings.click((e) => {
        if(!modalOpen){
            e.stopPropagation();
            $dt_menu.slideToggle();
        }
    });

    $('.dt-sub-nav a').click(() => {
        $dt_menu.slideUp();
    })

    $(document.body).click( function(e) {
         closeNav();
    });

    $('.dt-settings-li-item').hover(() => {
        $('.dt-sub-nav').slideToggle();
    })

// modal click handlers

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
