//--->>
//--->>
var user = $('p.currentUser').text();
var userimage = `/images/user/${user}.JPEG`;
checkFileExistence(userimage);
//---**
//---**
$(document).ready(() => {
    applySettingClickHandlers();
});
//---**
//---**
function applySettingClickHandlers() {
    $('.deleteBtn').click(() => {
        $('.delete-account').addClass('settings-show');
    });

    $('.cancel-delete').click(() => {
        $('.delete-account').removeClass('settings-show');
        if ($('.confirm-account-delete').hasClass('hide')){
            setTimeout(function(){
                $('.confirm-account-delete').toggleClass('hide');
                $('.execute-account-delete').toggleClass('hide');
            },1000)
        }
    });

    $('#deleteAccount').click(deleteAccount);

    $('.confirm-delete').click(() => {
        $('.confirm-account-delete').toggleClass('hide');
        $('.execute-account-delete').toggleClass('hide');
    });

    $('.edit-email-btn').click(() => {
        $('.edit-email').addClass('settings-show');
    });

    $('.cancel-email').click(() => {
        $('.edit-email').removeClass('settings-show');
    });

    $('.edit-bio-btn').click(() => {
        $('.edit-bio').addClass('settings-show');
    });

    $('.cancel-bio').click(() => {
        $('.edit-bio').removeClass('settings-show');
    });

    $('.edit-email-btn').click(() => {
        $('.edit-email').addClass('settings-show');
    });

    $('.textAreaContainer textarea').on('keyup',function(){
        let length = $(this).val().length
        if (length > 85){
            $(this).val($(this).val().substring(0,85));
            length = 85;
        }
        $('#textCounter').text(`${length}/85`);
    });

    $('#uploadBtn').on('change',function(){
        $('#iconPreview').attr('src',window.URL.createObjectURL(this.files[0]) || '/images/user/axolotl.png')
    });

    $('input[name=cancel]').on('click',function(e){
        checkFileExistence(userimage);
    });
}
//---**
//---**
function checkFileExistence(url){
    var xhr = new XMLHttpRequest();
    xhr.open('HEAD', url, true);
    xhr.onreadystatechange = function(){
        if (xhr.readyState === XMLHttpRequest.DONE){
            if(parseInt(xhr.status) >= 400){
                userimage = '/images/user/axolotl.png';
            }
            $('#iconPreview').attr('src', userimage);
        }
    }
    xhr.send();
}
//---**
//---**
function deleteAccount(){

    $.ajax({
        url: '/delete_account',
        dataType: 'json',
        method: 'POST',
        data: {
            pwd: $('#pwinput').val()
        },
        success: function(result){
            if (result.success){
                window.location.replace('/');
            } else {
                $('.pwerror').toggle('fast');
                setTimeout(function(){
                    $('.pwerror').toggle('fast');
                },4000);
            }
        },
        error: function(result){
            console.log(result);
        }
    });
    $('#pwinput').val('');
}
//---xx
//---xx
