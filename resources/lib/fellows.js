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
        url: `/new-fellow/${fellow}`
    });
}

function getFellowsList(){
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

    let $aLink = $('<a>',{href: '/profile/' + fellow,text: fellow}).appendTo($listItem);


    $ul.append($listItem);
    return $listItem;
}
