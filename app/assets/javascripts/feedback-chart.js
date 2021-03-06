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
            type: 'pie',
            backgroundColor:'rgba(255, 255, 255, 0.0)',
            margin: [0,0,0,0],
            padding: 0,
            minPadding: 0,
            maxPadding: 0,
            spacing: [0, 0, 0, 0],
            height: 300
        },
        title: {
            text: data.text
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
                },
                borderWidth: 0
            }
        },
        series: [{
            name: 'Brands',
            colorByPoint: true,
            data: [{
                name: 'Happy',
                y: happy_percentage,
                sliced: true,
                color: '#1D8348',
                selected: true
            }, {
                name: 'ok',
                color: '#F4D03F',
                y: neutral_percentage
            }, {
                name: 'sad',
                color: '#CD5C5C',
                y: sad_percentage
            }]
        }]
    });

    Highcharts.setOptions({
        colors: ['red', 'green', 'grey']
    });

    $('.highcharts-credits').remove();
}
