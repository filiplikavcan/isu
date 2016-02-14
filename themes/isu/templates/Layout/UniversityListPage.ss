<div class="article-holder">
    <div class="container">
        <div class="row">
            <div class="col-sm-9">
                <h2>$Title</h2>

                <div class="content">
                    $Content
                </div>

                <table class="table table-responsive university-table">
                    <% loop $Universities %>
                        <tr <% if $Joined %>class="joined"<% end_if %>>
                            <td>
                                $Name
                            </td>
                            <td>
                                <% if $Joined %>
                                    zapojená
                                <% else %>
                                    nezapojená
                                <% end_if %>
                            </td>
                        </tr>
                    <% end_loop %>
                </table>
            </div>
        </div>
    </div>
</div>