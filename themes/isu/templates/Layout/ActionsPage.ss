<div class="actions-holder">
    <div class="container">
        <div class="row">

        	<% if $ActionGroups %>
            <div class="col-sm-6 col-md-6 document-category">
                <h2>Akcie</h2>
                <% loop $ActionGroups %>
                    <% with $Group %>
                        <div class="action-group<% if $Up.Custom %> custom-action-group<% end_if %>">
                            <h3>$Title</h3>
                            $Description

                            <% loop $Dates %>
                                <h4>$Date</h4>

                                <% loop $Actions.GroupedBy('TimeFrom') %>
                                    <% loop Children %>
                                        <div class="day-row">
                                            <div class="row">
                                                <div class="col-xs-3">
                                                    <strong>$TimeFrom</strong>
                                                </div>
                                                <div class="col-xs-9">
                                                    <% if $Up.Up.Up.Up.Up.Custom %>
                                                        <div>
                                                            <strong>$City</strong>,
                                                            $Place<% if $Link %>&nbsp;<a href="$Link" target="_blank"><i class="fa fa-external-link"></i></a><% end_if %>
                                                            <% if $TimeTo %><em><br> koniec o $TimeTo</em><% end_if %>
                                                        </div>
                                                    <% else %>
                                                        <div>
                                                            <strong>$City </strong>&ndash; $Title<% if $Link %>&nbsp;<a href="$Link" target="_blank"><i class="fa fa-external-link"></i></a><% end_if %><br>
                                                            $Place <% if $Description %><br>$Description<% end_if %>
                                                            <% if $TimeTo %><em><br> koniec o $TimeTo</em><% end_if %>
                                                        </div>
                                                    <% end_if %>
                                                </div>
                                            </div>
                                        </div>
                                    <% end_loop %>
                                <% end_loop %>
                            <% end_loop %>
                        </div>
                    <% end_with %>
                <% end_loop %>
            </div>
            <% end_if %>
            
            <div class="<% if $ActionGroups %>col-sm-6 col-md-6<% else %>col-sm-12 col-md-12<% end_if %> document-category">
                <% loop $OtherActionGroups %>
                    <% with $Group %>
                        <div class="action-group<% if $Up.Custom %> custom-action-group<% end_if %> other-action-group">
                            <h3>$Title</h3>
                            $Description

                            <% loop $Dates %>
                            	<h4>$Date</h4>

                                <% loop $Actions.GroupedBy('TimeFrom') %>
                                    <% loop Children %>
                                        <div class="day-row">
                                            <div class="row">
                                                <div class="col-xs-3">
                                                    <strong>$TimeFrom</strong>
                                                </div>
                                                <div class="col-xs-9">
                                                    <% if $Up.Up.Up.Up.Up.Custom %>
                                                        <div>
                                                            <strong>$City</strong>,
                                                            $Place<% if $Link %>&nbsp;<a href="$Link" target="_blank"><i class="fa fa-external-link"></i></a><% end_if %>
                                                            <% if $TimeTo %><em><br> koniec o $TimeTo</em><% end_if %>
                                                        </div>
                                                    <% else %>
                                                        <div>
                                                            <strong>$City </strong>&ndash; $Title<% if $Link %>&nbsp;<a href="$Link" target="_blank"><i class="fa fa-external-link"></i></a><% end_if %><br>
                                                            $Place <% if $Description %><br>$Description<% end_if %>
                                                            <% if $TimeTo %><em><br> koniec o $TimeTo</em><% end_if %>
                                                        </div>
                                                    <% end_if %>
                                                </div>
                                            </div>
                                        </div>
                                    <% end_loop %>
                                <% end_loop %>
                            <% end_loop %>
                        </div>
                    <% end_with %>
                <% end_loop %>
            </div>

        </div>
        <div class="row">
        	<div class="col-sm-12 col-md-12 document-category">
                <% loop $OldActionGroups %>
                    <% with $Group %>
                        <div class="action-group<% if $Up.Custom %> custom-action-group<% end_if %> other-action-group">
                            <h3>$Title</h3>
                            $Description

                            <% loop $OldDates.Reverse %>
                            	<h4>$Date</h4>

                                <% loop $Actions.GroupedBy('TimeFrom') %>
                                    <% loop Children %>
                                        <div class="day-row">
                                            <div class="row">
                                                <div class="col-xs-3">
                                                    <strong>$TimeFrom</strong>
                                                </div>
                                                <div class="col-xs-9">
                                                    <% if $Up.Up.Up.Up.Up.Custom %>
                                                        <div>
                                                            <strong>$City</strong>,
                                                            $Place<% if $Link %>&nbsp;<a href="$Link" target="_blank"><i class="fa fa-external-link"></i></a><% end_if %>
                                                            <% if $TimeTo %><em><br> koniec o $TimeTo</em><% end_if %>
                                                        </div>
                                                    <% else %>
                                                        <div>
                                                            <strong>$City </strong>&ndash; $Title<% if $Link %>&nbsp;<a href="$Link" target="_blank"><i class="fa fa-external-link"></i></a><% end_if %><br>
                                                            $Place <% if $Description %><br>$Description<% end_if %>
                                                            <% if $TimeTo %><em><br> koniec o $TimeTo</em><% end_if %>
                                                        </div>
                                                    <% end_if %>
                                                </div>
                                            </div>
                                        </div>
                                    <% end_loop %>
                                <% end_loop %>
                            <% end_loop %>
                        </div>
                    <% end_with %>
                <% end_loop %>
            </div>

        </div>
    </div>
</div>