function renderChart() {
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
                y: 30,
                sliced: true,
                color: '#1D8348',
                selected: true
            }, {
                name: 'ok',
                color: '#F4D03F',
                y: 60
            }, {
                name: 'sad',
                color: '#CD5C5C',
                y: 10
            }]
        }]
    });

    Highcharts.setOptions({
        colors: ['red', 'green', 'grey']
    });

}
$(document).ready(function() {
    renderChart();
})
