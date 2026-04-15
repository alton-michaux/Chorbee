// This is a manifest file that'll be compiled into application.js.
//
// Sprockets directives for required libraries:
//= require turbo
//= require popper
//= require bootstrap
//= require chartkick
//= require Chart.bundle
//= require_tree .

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
        // tablet view
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
