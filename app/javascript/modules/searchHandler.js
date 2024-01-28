function searchHandler() {
    let historic = ''
    let typingTimer;
    const typingInterval = 1000;

    if (document.querySelector('#searchBox') !== null) {
        document.querySelector('#searchBox').addEventListener('input', async (el) => {
            clearTimeout(typingTimer);

            typingTimer = setTimeout(async () => {
                historic = el.target.value;
                if (historic !== '') {
                    await fetch('/analytic_trends', {
                        method: 'POST',
                        headers: {
                            "Content-Type": 'application/json'
                        },
                        body: JSON.stringify({ query: historic.toLowerCase() }),
                    })
                        .then((response) => {
                            return response.json();
                        })
                }
            }, typingInterval);
        });
    }
}
searchHandler();
