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
        $('.delete-account').addClass('show');
    });

    $('.cancel-delete').click(() => {
        $('.delete-account').removeClass('show');
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
        $('.edit-email').addClass('show');
    });

    $('.cancel-email').click(() => {
        $('.edit-email').removeClass('show');
    });

    $('.edit-bio-btn').click(() => {
        $('.edit-bio').addClass('show');
    });

    $('.cancel-bio').click(() => {
        $('.edit-bio').removeClass('show');
    });

    $('.edit-email-btn').click(() => {
        $('.edit-email').addClass('show');
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
