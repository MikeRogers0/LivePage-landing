// This is where it all goes :)

// https://developer.chrome.com/webstore/inline_installation - mostly stuff from this

// Add listener so clicking link to install, triggers inline install.

// Update the button if they've installed it showing a thank you message.
const extId = "pilnojpmdoofaelbinaeodfpjheijkbh";

// Confirm livepage installed
const livepageCheck = function(callback){
    chrome.runtime.sendMessage(extId, {message: ""}, callback);
}

$(document).ready(function() {
    // Check for livepage installation
    livepageCheck(function(present){
        if(present){
            $('.ext-install').html('Thanks for installing');
        }
    });

    // "Following" (during) app installation
    chrome.webstore.onInstallStageChanged.addListener(function(stage){
        if (stage == "installing") {
            $('.ext-install').html('Thanks for installing');
        }
    });
});
