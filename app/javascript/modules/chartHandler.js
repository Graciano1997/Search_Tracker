function getColor() {
    const letters = '0123456789ABCDEF';
    let color = '#';
    for (let i = 0; i < 6; i++) {
        color += letters[Math.floor(Math.random() * 16)];
    }
    return color;
}
async function seekData(url) {
    let trendsArray = [];
    let xValues = [];
    let yValues = [];
    let barColors = [];

    await fetch(url)
        .then((response) => response.json())
        .then((data) => trendsArray = data.data);
    trendsArray.forEach((trend) => {
        xValues.push(trend.query);
        yValues.push(trend.search_total);
        barColors.push(getColor());
    });
    new Chart(document.querySelector("#myChart").getContext('2d'), {
        type: "bar",
        data: {
            labels: xValues,
            datasets: [{
                backgroundColor: barColors,
                data: yValues
            }]
        },
        options: {
            legend: { display: false },
            title: {
                display: true,
                text: "The People Searching Trends"
            }
        }
    });
}

seekData('/analytictrends');
