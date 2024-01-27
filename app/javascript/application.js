// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

document.querySelector('#searchBox').addEventListener('input',(el)=>{
  console.log(el.target.value);
})