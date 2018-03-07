//--->>
//--->>
$(document).ready(function () {
    applyClickHandlers();
    getFellowsList();
});
//---**
//---**
function applyClickHandlers(){
    let $searchBtn = $('.search-button');

    $searchBtn.click(() => {
        $fellowName = $('.user-search-container input[name=usersearch]').val();
        if ($fellowName){
            addNewFellow($fellowName);
            $('.user-search-container input[name=usersearch]').val('');
        };
    });

    $('#fellow-list').on('click','.material-icons',function(){
        removeFellow(event.target);
    });
}
//---**
//---**
function removeFellow(e){
    $.ajax({
        url: `/delete_fellow/${event.target.axolotlFellow}`,
        success: function(result){
            getFellowsList();
        }
    });
}
//---**
//---**
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
//---**
//---**
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
//---**
//---**
function buildFellowForList(fellow){
    let $ul = $('#fellow-list');
    let $listItem = $('<li>');
    let $aLink = $('<a>',{href: '/profile/' + fellow})
    let $image = $('<div>',{class: 'post-user-image'}).css({'background-image':`url(/images/user/${fellow}.JPEG)`});
    let $userName = $('<h1>', {class: 'username', text: fellow});

    let $deleteBtn = $('<i>', {class: 'material-icons', text: 'star'})
    $deleteBtn[0].axolotlFellow = fellow;
    $listItem.append($image,$userName,$deleteBtn);
    $userName.wrap($aLink)
    $image.wrap($aLink)
    $ul.append($listItem);
    return $listItem;
}
//---xx
//---xx
