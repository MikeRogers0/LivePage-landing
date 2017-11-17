(function(){
  var installButtons = document.querySelectorAll(".btn-livepage-install");

  // If it's installed, add a thank you to the button
  if (chrome.app.isInstalled) {
    installButtons.forEach(function(installButton){
      installButton.innerText = installButton.dataset["installedText"]
      installButton.className += installButton.dataset["installedClass"]
    });

    // It's installed, so don't trigger the inline install.
    return;
  }
})();
