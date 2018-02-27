$(document).ready(function () {
    retrievePosts();
    applyClickHandlers();
    addScrollHandler();
});

var last_post = 0;
var loading = false;
var endoffeed = false;

function applyClickHandlers(){
    let $postBtn = $('#sitelogo');
    let $post = $('.make-post');

    $postBtn.click(() => {
        $post.toggleClass( 'show', 'hide');
    })

}

function addScrollHandler(){
    $('.thread-container').on('scroll',function(){
        if (($(this).scrollTop() + $(this).innerHeight()) >= $(this)[0].scrollHeight - 10 && !loading && !endoffeed){
            loading = true;
            handleLoading();
            setTimeout(()=>{
                retrievePosts();
                $('#loadContainer').fadeOut(1000,'swing',()=>{$('#loadContainer').remove()});
                loading = false;
            },2000);
        }
    });
}

function addNewFellow(fellow){
    $.ajax({
        url: `/new-fellow/${fellow}`
    });
}

function retrievePosts(){
    $.ajax({
        url: '/get_posts',
        dataType: 'json',
        method: 'POST',
        data: {
            offset: last_post,
            qty: 10
        },
        success: function(result){
            if (Object.keys(result).length == 0){
                endoffeed = true;
            } else {
                for (let row in result){
                    buildPost(result[row]);
                }
            }

        },
        error: function(result){
            let $container = $('<div>',{class: 'post-container',text: 'An error has occurred'}).css('color','red');
            $('.thread-container').append($container);
        }
    })
}


function buildPost(arr){
    let $header = $('<div>',{class: 'post-header'});
    let $body = $('<div>',{class: 'post-body',text: arr[1]});
    let $footer = $('<div>',{class: 'post-footer'});

    let $image = $('<div>',{class: 'post-user-image'}).appendTo($header);
    let $username = $('<div>',{class: 'post-user-name',text: arr[0]}).appendTo($header);

    let $time_elapsed = $('<div>',{class: 'post-like',text: parseTime(arr[2])}).appendTo($footer);

    let $container = $('<div>',{class: 'post-container'}).append($header,$body,$footer);
    $('.thread-container').append($container);
    last_post = arr[3];
    return $container;
}

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


function handleLoading(){
    $container = $('<div>',{'id':'loadContainer'});
    $spinnyLoader = $('<div>',{'id':'loadingSpinner'});
    $spinnyLoader.appendTo($container);
    $('.thread-container').append($container);
}
