async function searchHandler() {
    if (document.querySelector('#searchBox')!==null){
        document.querySelector('#searchBox').addEventListener('input', async (el) => {
            console.log(el.target.value);
            if (el.target.value === "How is emil hajric doing" || el.target.value === "What is a good car" || el.target.value === "How is Graciano") {
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
    }
}


searchHandler();