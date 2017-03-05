function renderChart(data) {
    console.log(data)
    var sad_percentage = Math.ceil(data.sad * 100/ data.total)
    var happy_percentage = Math.ceil(data.happy * 100/ data.total)
    var neutral_percentage = 100 - happy_percentage - sad_percentage
    Highcharts.chart('feedback-chart', {
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false,
            type: 'pie'
        },
        title: {
            text: 'Feedback Chart'
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: true,
                    format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                    style: {
                        color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                    }
                }
            }
        },
        series: [{
            name: 'Brands',
            colorByPoint: true,
            data: [{
                name: 'Happy',
                y: happy_percentage,
                sliced: true,
                selected: true
            }, {
                name: 'ok',
                y: neutral_percentage
            }, {
                name: 'sad',
                y: sad_percentage
            }]
        }]
    });
}
