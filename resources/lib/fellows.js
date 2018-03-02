$(document).ready(function () {
    applyClickHandlers();
    getFellowsList();
});



function applyClickHandlers(){
    let $searchBtn = $('.search-button');

    $searchBtn.click(() => {
        $fellowName = $('.user-search-container input[name=usersearch]').val();
        if ($fellowName){
            addNewFellow($fellowName);
            $('.user-search-container input[name=usersearch]').val('');
        };
    });
}

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

function getFellowsList(){
    $('#fellow-list').empty();
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

function buildFellowForList(fellow){
    let $ul = $('#fellow-list');
    let $listItem = $('<li>');
    let $aLink = $('<a>',{href: '/profile/' + fellow,text: fellow})
    let $image = $('<div>',{class: 'post-user-image'}).css({'background-image':`url(/images/user/${fellow}.JPEG)`,'float':'none'}).prependTo($aLink);
    $aLink.appendTo($listItem)


    $ul.append($listItem);
    return $listItem;
}
