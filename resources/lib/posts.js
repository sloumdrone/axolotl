//--->>
//--->>
var last_post = 0;
var loading = false;
var endoffeed = false;
//---**
//---**
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
function parseUserLinks(message){
    const regex = /@{1}\S*\W{1}/g;
    message = message + ' ';

    let matches = message.match(regex);
    let uniqueMatches = [...new Set(matches)];
    let edited_message = message;

    uniqueMatches.forEach(function(link){
        let user = link.substring(1);
        let alink = `<a href="/profile/${link.substring(1)}">${link}</a>`;
        edited_message = edited_message.replace(link,alink);
    });

    return edited_message;
}
//---**
//---**
function addScrollHandler(){
    $('.thread-container').on('scroll',function(){
        if (($(this).scrollTop() + $(this).innerHeight()) >= $(this)[0].scrollHeight - 10 && !loading && !endoffeed){
            loading = true;
            handleLoading();
            setTimeout(()=>{
                retrievePosts();
                $('#loadContainer').fadeOut(1000,'swing',()=>{$('#loadContainer').remove()});
                loading = false;
            },800);
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
//---XX
//---XX