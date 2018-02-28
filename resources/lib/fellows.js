$(document).ready(function () {
    applyClickHandlers();
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
