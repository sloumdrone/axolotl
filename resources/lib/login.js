
if ("serviceWorker" in navigator) {
    navigator.serviceWorker.register("https://axolotl.network/library/service-worker.js");
}

$('.alt-action').click(function(){
    $('form').toggleClass('hidden');
});

setTimeout(function(){
    $('.wordBubble').hide('fast');
},8000);
