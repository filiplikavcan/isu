<div class="contacts-holder">
    <div class="container">
        <div class="row">
            <div class="col-sm-8">
                <h2>$Title</h2>

                <div class="content">
                    $Content
                </div>
            </div>
            <div class="col-sm-4">
                <% if $Regions %>
                <div class="regions">
                    <h3>Regionálne iniciatívy</h3>

                    <ul>
                        <% loop $Regions %>
                        <li>
                            <a href="$Link" target="_blank">$Title</a>
                        </li>
                        <% end_loop %>
                    </ul>
                </div>
                <% end_if %>
            </div>
        </div>
    </div>
</div>