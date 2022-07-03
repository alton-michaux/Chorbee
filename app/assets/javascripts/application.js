// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require chartkick
//= require Chart.bundle

const domElements = {
    childMain: document.getElementsByClassName('child-main'),
    choreMain: document.getElementsByClassName('chore-main'),
    appointmentMain: document.getElementsByClassName('appointment-main'),
    appointmentShow: document.getElementsByClassName('appointment-show')
}

window.addEventListener('load', function(e) {
    windowWidth = window.innerWidth;
    childView = domElements.childMain[0];
    choreView = domElements.choreMain[0];
    appointmentView = domElements.appointmentMain[0];
    appointmentShow = domElements.appointmentShow[0];
    if (windowWidth < 768) {
        // mobile view
        if (childView) {
            domElements.childMain[0].style.width = '100%';
        }
        if (choreView) {
            domElements.choreMain[0].style.width = '100%';
        }
        if (appointmentView) {
            domElements.appointmentMain[0].style.width = '100%';
        }
    }
    if (windowWidth > 768 && windowWidth < 1024) {
        // desktop view
        if (childView) {
            domElements.childMain[0].style.width = '720px';
        }
        if (choreView) {
            domElements.choreMain[0].style.width = '720px';
        }
        if (appointmentView) {
            domElements.appointmentMain[0].style.width = '720px';
        }
    }
    if (windowWidth > 1280) {
        // large desktop view
        if (childView) {
            domElements.childMain[0].style.width = '50%';
        }
        if (choreView) {
            domElements.choreMain[0].style.width = '50%';
        }
        if (appointmentShow) {
            domElements.appointmentMain[0].style.width = '50%';
        }
        else {
            domElements.appointmentMain[0].style.width = '75%';
        }
    }
})
