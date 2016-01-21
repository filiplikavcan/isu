<div class="article-holder">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <h2>$Title</h2>

                $Content
            </div>
            <div class="col-sm-12">
                <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

                <h3>Počet zapojených učiteľov a škôl</h3>
                <div id="chart_div"></div>
            </div>
            <div class="col-sm-12">
                <h3>Zoznam podľa krajov a miest</h3>

                <table class="table table-hover table-condensed stats-table">
                    <% loop StatsByCity %>
                        <thead>
                            <tr>
                                <th>
                                    <h3>$RegionName kraj</h3>
                                </th>
                                <th>
                                    Registrovaní<br>zamestnanci
                                </th>
                                <th>
                                    Registrované<br>školy
                                </th>
                            </tr>
                        </thead>
                        <% loop Cities %>
                            <tr>
                                <td>
                                    $CityName
                                </td>
                                <td>
                                    $JoinedEmployeesCount
                                </td>
                                <td>
                                    $SchoolsCount
                                </td>
                            </tr>
                        <% end_loop %>
                    <% end_loop %>
                </table>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">

    google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(drawChart);

    function drawChart() {

        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Hodiny');
        data.addColumn('number', 'Počet zapojených škôl');
        data.addColumn('number', 'Počet zapojených učiteľov');

        data.addRows($JoinedStatsByHourJSON.RAW);

        var options = {
            curveType: "function",
            legend: {
                position: 'bottom'
            },
            vAxis: {
                viewWindowMode:'explicit',
                viewWindow:{
                    min: 0
                }
            },
            hAxis: {
                showTextEvery: 12
            },
            height: 400
        };

        var chart = new google.visualization.LineChart(document.getElementById('chart_div'));

        chart.draw(data, options);
    }

</script>