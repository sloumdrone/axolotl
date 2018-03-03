$('document').ready(() => {
    applyClickHandlers();
});

function applyClickHandlers() {
    $('.deleteBtn').click(() => {
        $('.delete-account').addClass('show');
    });
    $('.cancel-delete').click(() => {
        $('.delete-account').removeClass('show');
    });
}

var user = $('p.currentUser').text();
var userimage = `/images/user/${user}.JPEG`

$('#uploadBtn').on('change',function(){
    $('#iconPreview').attr('src',window.URL.createObjectURL(this.files[0]) || '/images/user/axolotl.png')
});

$('input[name=cancel]').on('click',function(e){
    checkFileExistence(userimage);
});

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


checkFileExistence(userimage);
