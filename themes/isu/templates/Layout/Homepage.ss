<% if $Action == 'edit' %>
    $SchoolStrikeUpdateRegistrationForm
<% else %>

<div class="red-alert-holder">
    <div class="container">
        <div class="row">
            <div class="col-sm-6 col-md-5">
                <h1 class="ziva-retaz-title">
                    Živá reťaz
                </h1>
            </div>
            <div class="col-sm-6">
                <div class="btn-action">
                    Podrobnosti o demonštráciách nájdete <a href="/#dokumenty">v zozname akcií</a>.
                </div>
            </div>
        </div>
    </div>
</div>

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
                <div class="col-sm-6 col-md-5">

                    <% if $InfotextTitle %>
                    <h2>$InfotextTitle</h2>
                    <% end_if %>

                    <div>
                        $Content
                    </div>

                    <h2 style="line-height: 34px;">
                        Do štrajku sa už zapojilo<br> vyše&nbsp;<span style="background-color: black; color: white; display: inline-block; padding: 0 6px; margin-bottom: 2px;">14500</span> učiteľov<br>z&nbsp;viac ako <span style="background-color: black; color: white; display: inline-block; padding: 1px 6px;">950</span> škôl.</small>
                    </h2>

                    <div>
                        Registrácia stále pokračuje. Nezabudnite priebežne aktualizovať údaje.<br>
                    </div>

                    <div>
                        <a href="/#registracia" class="btn btn-register">Registrácia</a>
                    </div>

                    <p style="text-align: center;">
                        Ak ste sa už zaregistrovali, môžete <a href="$Link('edit')" class="update-form">aktualizovať údaje</a>.
                    </p>
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

    <span class="anchor" id="dokumenty"></span>
    <div class="documents">
        <div class="document-category-holder odd">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6 col-md-4 document-category">
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
                    <% loop $ArticleCategories %>
                    <div class="col-sm-4 document-category">
                        <h2>$Title</h2>
                        <div class="description">
                            $Content
                        </div>

                        <ul class="articles-list">
                            <% loop Children %>
                            <li>
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
                    </div>

                    <% if MultipleOf(3) %>
                    <span class="clearfix visible-md-block visible-lg-block visible-sm-block"></span>
                    <% end_if %>
                    <% end_loop %>
                </div>
            </div>
        </div>
    </div>

    <div style="background-color: #efefef;">
    <div class="container">
        <div class="row registration">
            <div class="col-sm-8 col-sm-offset-2">
                <span class="anchor" id="registracia"></span>
                <h2>
                    Registrácia do štrajku
                </h2>

                <p>
                    Registrácia slúži výlučne pre potreby <a href="/manualy/strajkovy-vybor-isu/" style="display: inline;">štrajkového výboru Iniciatívy slovenských učiteľov</a>.
                    Ďakujeme, že sa registrujete, je to dôležité pre efektívny priebeh štrajku. Údaje o kontaktnej osobe nebudú zverejnené.
                </p>

                $SchoolStrikeCreateRegistrationForm
             </div>

            <!--<div class="col-sm-5">-->
                <!--<h2>-->
                    <!--Školy zapojené do štrajku-->
                <!--</h2>-->

                <!--<div id="map">-->

                <!--</div>-->
            <!--</div>-->
        </div>
    </div>
    </div>
<% end_if %>
