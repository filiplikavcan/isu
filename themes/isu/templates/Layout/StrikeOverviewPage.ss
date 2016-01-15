<div class="article-holder">
    <div class="container">
        <div class="row">
            <div class="col-sm-8">
                <h2>$Title</h2>

                $Content

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