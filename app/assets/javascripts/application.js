// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= //require bootstrap-sprockets
//= require jquery3
//= require jquery_ujs
//= require jquery.validate
//= require activestorage
//= require turbolinks
//= require_tree .

/*
jQuery to validate the contact form
 */
function ValidateContactUsForm(){
    $('#contact_form').validate({
        rules:{
            'name': {required: true},
            'email': {required: true, email:true},
            'message': {required: true}
        },
        messages:{
            'name': {required: "You must enter your name"},
            'email': {required: "You must enter your email address", email: "You must enter your email address"},
            'message': {required: "You must enter a message"}
        }
    });
}



/*
Reload the JS every time a new page is loaded
When the page is loaded, check the id to see if the contact page has been loaded
 */
$(document).on('turbolinks:load', function() {
    if(document.getElementById('contact_form')){
        ValidateContactUsForm();
    }
});
