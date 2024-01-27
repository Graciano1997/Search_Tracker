// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"



document.querySelector('#searchBox').addEventListener('input', async (el) => {
    console.log(el.target.value);
    if (el.target.value === "How is emil hajric doing" || el.target.value === "What is a good car") {
        await fetch('/analytic_trends', {
            method: 'POST',
            headers: {
                "Content-Type": 'application/json'
            },
            body: JSON.stringify({ query: el.target.value }),
        })
            .then((response) => {
                console.log(response.json());
            })
    }
});