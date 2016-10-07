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

  // Add the chrome listerners for the inline installer
  installButtons.forEach(function(installButton){
    installButton.addEventListener("click", function(e){
      e.preventDefault();
      chrome.webstore.install(); 
      return false;
    });
  });

})();
