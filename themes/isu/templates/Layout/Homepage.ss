<% if $Action == 'edit' %>
    $SchoolStrikeUpdateRegistrationForm
<% else %>
    <div class="main-banner">
        <div class="container">
            <div class="row">
                <div class="col-sm-6 col-md-5">
                    <div class="main-info">
                        <div>
                            <h2>Iniciatíva slovnských učiteľov vyhlasuje štrajk od 25.1.2016</h2>
                            <h3>Nie je nám to FUK!</h3>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-6">

                    <% if $InfotextTitle %>
                    <h2>$InfotextTitle</h2>
                    <% end_if %>

                    <div>
                        $Content
                    </div>

                    <h2 style="font-size: 58px; text-transform: none; line-height: 60px;">
                        <br>
                        Nemáte sto dní! <a href="http://den100.isu.sk/ " target="_blank" style="font-size: 40px;"><i class="fa fa-external-link"></i></a>
                    </h2>
                    
                    <div>
                        <a href="/podporuju-nas" class="btn btn-register" style="margin-top: 0;">Podporiť štrajk</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <% if $HeadlineContent %>
        <div class="headline-holder">
            <div class="container">
                <div class="col-xs-12 col-sm-10 col-sm-offset-1">
                    $HeadlineContent.RAW
                </div>
            </div>
        </div>
    <% end_if %>

    <span class="anchor" id="akcie"></span>
    <div class="documents">
        <div class="document-category-holder odd">
            <div class="container">
                <div class="row">
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
                    
                    <div class="col-sm-6 col-md-6 document-category">
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

                    <div class="row">
                    
                    <div class="col-sm-12 col-md-12">
                        <a href="/akcie" title="Zobraziť všetky akcie">Zobraziť viac</a>
                    </div>

                    <!--div class="col-md-7 col-md-offset-1 col-sm-6 document-category">
                        <span class="anchor" id="registracia"></span>
                        <h2 style="padding-bottom: 15px;">
                            Registrácia zamestnanca VŠ do&nbsp;štrajku
                        </h2>

                        <p style="margin-bottom: 15px;">
                             Ak chcete registrovať materskú, základnú alebo strednú školu <a href="/registracia-ms-zs-a-ss" style="display: inline;">použite registračný formulár pre MŠ, ZŠ a SŠ</a>.
                        </p>

                        $UniversityStrikeForm
                    </div-->
                </div>
                <span class="anchor" id="dokumenty"></span>
                <div class="row">

                    <% loop $ArticleCategories %>
                    <div class="col-sm-5 document-category">
                        <h2>$Title</h2>
                        <div class="description">
                            $Content
                        </div>

                        <ul class="articles-list">
                            <% loop Children %>
                            <li <% if $Pos > 10 %>class="hidden-link"<% end_if %>>
                                <a href="$Link">
                                    $MenuTitle
                                        <span>
                                            <% if $PublishDate %>
                                                $PublishDate.format('j. n. Y')
                                            <% end_if %>
                                        </span>
                                </a>
                            </li>
                            <% end_loop %>
                        </ul>

                        <a href="#" class="show-more-links">Zobraziť viac</a>
                    </div>

                    <% if MultipleOf(3) %>
                    <span class="clearfix visible-md-block visible-lg-block visible-sm-block"></span>
                    <% end_if %>
                    <% end_loop %>
                </div>
            </div>
        </div>
    </div>
<% end_if %>
