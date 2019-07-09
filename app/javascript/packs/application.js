// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require('jquery')


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

document.addEventListener('turbolinks:load', () => {
    $('.board-cell').click((event) => {
        const user = '';
        const x = $(event.target).data('x');
        const y = $(event.target).data('y');
        const room_id = $('#room_id').val();
        console.log('CLicked: ', x, y, room_id);

        $.post(`/rooms/${room_id}/cell_click`, {x, y}, (result) => {
            // console.log('Error: ', err, params);
            console.log('result: ', result);
        })
    }) 
})