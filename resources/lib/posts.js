//--->>
//--->>
$(document).ready(function () {
    retrievePosts();
    applyPostClickHandlers();
    addScrollHandler();
});
//---**
//---**
function applyPostClickHandlers(){
    let $postBtn = $('#sitelogo');
    let $post = $('section.make-post');
    let $dt_postBtn = $('#dt-postBtn');
    let $dt_post = $('section.dt-make-post');

    $postBtn.click(() => {
        $post.toggleClass('show');
    });

    $dt_postBtn.click(() => {
        $dt_post.slideToggle();
    });
}
//---**
//---**
var last_post = 0;
var loading = false;
var endoffeed = false;
//---**/
//---**/
function buildPost(arr){
    let $header = $('<div>',{class: 'post-header'});
    let linkText = parseUserLinks(arr[1]);
    let $body = $('<div>',{class: 'post-body'}).html(linkText);
    let $footer = $('<div>',{class: 'post-footer'});

    let $image = $('<div>',{class: 'post-user-image'}).css('background-image',`url(/images/user/${arr[0]}.JPEG)`).appendTo($header);
    let $username = $('<div>',{class: 'post-user-name',text: arr[0]}).appendTo($header);

    let $time_elapsed = $('<div>',{class: 'post-like',text: parseTime(arr[2])}).appendTo($footer);

    let $container = $('<div>',{class: 'post-container'}).append($header,$body,$footer);
    $image.wrap(`<a href="/profile/${arr[0]}"></a>`);
    $username.wrap(`<a href="/profile/${arr[0]}"></a>`);
    $('.thread-container').append($container);
    last_post = arr[3];
    return $container;
}
//---**
//---**
function buildPostDesktop(arr){
    let $header = $('<div>',{class: 'dt-post-header'});
    let linkText = parseUserLinks(arr[1]);
    let $body = $('<div>',{class: 'dt-post-body'}).html(linkText);
    let $footer = $('<div>',{class: 'dt-post-footer'});

    let $image = $('<div>',{class: 'dt-post-user-image'}).css('background-image',`url(/images/user/${arr[0]}.JPEG)`).appendTo($header);
    let $username = $('<div>',{class: 'dt-post-user-name',text: arr[0]}).appendTo($header);

    let $time_elapsed = $('<div>',{class: 'dt-post-like',text: parseTime(arr[2])}).appendTo($footer);

    let $container = $('<div>',{class: 'dt-post-container'}).append($header,$body,$footer);
    $image.wrap(`<a href="/profile/${arr[0]}"></a>`);
    $username.wrap(`<a href="/profile/${arr[0]}"></a>`);
    $('.dt-thread-container').append($container);
    last_post = arr[3];
    return $container;
}
//---**
//---**
function parseUserLinks(message){
    const regex = /@{1}\w*(?=[\W!?\s]{1})/g;
    message = message + ' ';

    let matches = message.match(regex);
    let uniqueMatches = [...new Set(matches)];
    let edited_message = message;

    uniqueMatches.forEach(function(link){
        let user = link.substring(1);
        let alink = `<a href="/profile/${link.substring(1)}">${link}</a>`;
        edited_message = edited_message.replace(new RegExp(`${link}`,"g"),alink);
    });

    return edited_message;
}
//---**
//---**
function addScrollHandler(){
    $('.thread-container, .dt-thread-container').on('scroll',function(){
        if (($(this).scrollTop() + $(this).innerHeight()) >= $(this)[0].scrollHeight - 200 && !loading && !endoffeed){
            loading = true;
            handleLoading();
            setTimeout(()=>{
                retrievePosts();
                $('#loadContainer').fadeOut(1000,'swing',()=>{$('#loadContainer').remove()});
                loading = false;
            },300);
        }
    });
}
//---**
//---**
function parseTime(post_time){
    let current_time = Date.now() / 1000;
    post_time = Math.round(post_time);
    let elapsed_time = current_time - post_time;

    if (elapsed_time < 60){
        return `${Math.round(elapsed_time)}s ago`;
    } else if (elapsed_time < 3600){
        return `${Math.round(elapsed_time/60)}m ago`;
    } else if (elapsed_time < 86400){
        return `${Math.round((elapsed_time/60) / 60)}h ago`;
    } else {
        return `${Math.round(((elapsed_time/60) / 60) / 24)}d ago`;
    }
}
//---**
//---**
function handleLoading(){
    $container = $('<div>',{'id':'loadContainer'});
    $spinnyLoader = $('<div>',{'id':'loadingSpinner'});
    $spinnyLoader.appendTo($container);
    $('.thread-container').append($container);
}
//---**
//---**
function retrievePosts(){
    let page = window.location.pathname == '/home' ? '/get_posts' : '/get_profile_posts/'+$('#postsToGrab').text();
    $.ajax({
        url: page,
        dataType: 'json',
        method: 'POST',
        data: {
            offset: last_post,
            qty: 20
        },
        success: function(result){
            if (Object.keys(result).length == 0){
                endoffeed = true;
            } else {
                for (let row in result){
                    buildPost(result[row]);
                    buildPostDesktop(result[row]);
                }}
        },
        error: function(result){
            let $container = $('<div>',{class: 'post-container',text: 'An error has occurred'}).css('color','red');
            $('.thread-container').append($container);
        }
    })
}
//---xx
//---xx
