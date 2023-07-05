// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

// app/assets/javascripts/application.js

document.addEventListener('DOMContentLoaded', function() {
    var hamburgerBtn = document.getElementById('hamburger-btn');
    var menu = document.getElementById('menu');
  
    hamburgerBtn.addEventListener('click', function() {
      menu.classList.toggle('active');
    });
  });
  