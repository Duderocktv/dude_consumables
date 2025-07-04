// Debug control - Change this to true when you need debugging
let debugEnabled = false;

function debugLog(...args) {
    if (debugEnabled) {
        console.log("[dude_consumables]", ...args);
    }
}

var holdTime;

function DisplayApp(data) {
    debugLog("DisplayApp called with quantity: " + data.quantity);
    $("#interact > .secondary").html(`
        <div>Use Item (${data.quantity})</div>
        <div>Options (Press Y)</div>
    `)
    $("#app-main").fadeIn(500);
    holdTime = data.time;
    $(".key .circle span em").css("transition", "transform "+Math.ceil(holdTime/2)+"ms linear;");
    $(".key .circle span:last-child em").css("transition-delay", Math.ceil(holdTime/2)+"ms;");
}

function HideApp() {
    debugLog("HideApp called");
    $("#app-main").fadeOut(500);
}

function HoldInteract(bool) {
    debugLog("HoldInteract called with: " + bool);
    if (bool) {
        $("#interact > .key").addClass("holding");
        $("#interact > .key .circle span:first-child em").css({
            "transform": "rotate(-180deg)",
            "transition": "transform "+Math.ceil(holdTime)+"ms ease-out",
            "transitionDelay": Math.ceil(holdTime/2)+"ms",
        });
        $("#interact > .key .circle span:last-child em").css({
            "transform": "rotate(-180deg)",
            "transition": "transform "+ Math.ceil(holdTime/2) +"ms linear",
            "transitionDelay": "0ms",
        });
    }
    else {
        $("#interact > .key").removeClass("holding");
        $("#interact > .key .circle span:first-child em").css({
            "transform": "rotate(0deg)",
            "transition": "transform 0ms",
            "transitionDelay": "0ms",
        });
        $("#interact > .key .circle span:last-child em").css({
            "transform": "rotate(0deg)",
            "transition": "transform 0ms linear",
            "transitionDelay": "0ms",
        });
    }
}

window.addEventListener('message', function(ev) {
    debugLog("Message received: " + ev.data.type);
    if (ev.data.type == "displayApp") {
        DisplayApp(ev.data.data);
    }
    else if (ev.data.type == "hideApp") {
        HideApp();
    }
    else if (ev.data.type == "holdInteract") {
        HoldInteract(ev.data.bool)
    }
}) 

$(document).ready(function() {
    debugLog("NUI ready");
    $('.key').each(function () {
        $(this).html('<span class="icon">' + $(this).html() + '</span><span class="circle"><span><em></em></span><span><em></em></span></span>');
    });
})