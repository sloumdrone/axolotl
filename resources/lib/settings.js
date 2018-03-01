var user = $('p.currentUser').text();

// var basic = $('#crop-container').croppie({
//     viewport: {
//         width: 50,
//         height: 50
//     },
//     boundary: {
//         width: 65,
//         height: 65
//     },
//     showZoomer: true,
//     url: '/images/axolotl.png'
// });

$('#uploadBtn').on('change',function(){
    $('#iconPreview').attr('src',window.URL.createObjectURL(this.files[0]) || '/images/user/axolotl.png')
});
