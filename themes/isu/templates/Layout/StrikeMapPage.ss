<div class="contacts-holder">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <h2>$Title <small>(aktualizácia: $LastRegistrationDate)</small></h2>

                <% if $AddressesWithoutGPS %>
                    <h3>Chýbajúce GPS súradnice</h3>

                    <table class="table table-condensed table-hover">
                        <% loop $AddressesWithoutGPS %>
                            <tr>
                                <td>
                                    $ID
                                </td>
                                <td>
                                    $Address
                                </td>
                            </tr>
                        <% end_loop %>
                    </table>
                <% end_if %>

                <div class="content">
                    $Content
                </div>

                <div id="strike-map" style="height: 500px;">

                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    APP.init('StrikeMap');

    var SCHOOL_MARKERS = $SchoolMarkersJSON;
</script>