//--->>
//--->>
$(document).ready(function () {
    buildSinglePost();
});
//---**
//---**
function buildSinglePost(){
    let data = [$('input[name=username]').val(),$('input[name=post]').val(),$('input[name=time]').val()]
    buildPost(data);
    buildPostDesktop(data);
}
//---**
//---**
var imgHash = Math.random() * 500
//---**/
//---**/
function buildPost(arr){
    let $header = $('<div>',{class: 'post-header'});
    let linkText = parseUserLinks(parseWebLinks(arr[1]));
    let $body = $('<div>',{class: 'post-body'}).html(linkText);
    let $footer = $('<div>',{class: 'post-footer'});

    let $image = $('<div>',{class: 'post-user-image'}).css('background-image',`url(/images/user/${arr[0]}.JPEG?hash=${imgHash})`).appendTo($header);
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
    let linkText = parseUserLinks(parseWebLinks(arr[1]));
    let $body = $('<div>',{class: 'dt-post-body'}).html(linkText);
    let $footer = $('<div>',{class: 'dt-post-footer'});

    let $image = $('<div>',{class: 'dt-post-user-image'}).css('background-image',`url(/images/user/${arr[0]}.JPEG?hash=${imgHash})`).appendTo($header);
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
function parseWebLinks(message){
    const regex = /(https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|www\.[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9]\.[^\s]{2,}|www\.[a-zA-Z0-9]\.[^\s]{2,})/g;

    let matches = message.match(regex);
    let uniqueMatches = [...new Set(matches)];
    let edited_message = message;

    uniqueMatches.forEach(function(link){
        let url = link.search('http') < 0 && link[0].toLowerCase() == 'w' ? 'http://' + link : link;
        let alink = `<a href="${url}" target="_blank">${link}</a>`;
        edited_message = edited_message.replace(new RegExp(`${link}`,"g"),alink);
    });

    return edited_message;
}
//---**
//---**
function parseTime(post_time){
    let current_time = Date.now() / 1000;
    post_time = Math.round(Number(post_time));
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
//---xx
//---xx
