
if ("serviceWorker" in navigator) {
    navigator.serviceWorker.register("https://axolotl.network/library/service-worker.js",{
        scope: '/'
    }).then(function(){
        console.log('Service worker registered');
    }).error(function(err){
        console.log(err);
    })
}

$('.alt-action').click(function(){
    $('form').toggleClass('hidden');
});

setTimeout(function(){
    $('.wordBubble').hide('fast');
},8000);
