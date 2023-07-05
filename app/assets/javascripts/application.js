// app/assets/javascripts/application.js

document.addEventListener('DOMContentLoaded', function() {
    var hamburgerBtn = document.getElementById('hamburger-btn');
    var menu = document.getElementById('menu');
  
    hamburgerBtn.addEventListener('click', function() {
      menu.classList.toggle('active');
    });
  });
  