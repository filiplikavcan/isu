<% if $Action == 'edit' %>
    $SchoolStrikeUpdateRegistrationForm
<% else %>
    <div class="main-banner">
        <div class="container">
            <div class="row">
                <div class="col-sm-6 col-md-5">
                    <div class="main-info">
                        $MainBannerMedia.RAW
                        <!--div> REMOVE FROM CSS
                            <h2>Iniciatíva slovnských učiteľov vyhlasuje štrajk od 25.1.2016</h2>
                            <h3>Nie je nám to FUK!</h3>
                        </div-->
                    </div>
                </div>
                <div class="col-sm-6 col-md-6">

                    <% if $InfotextTitle %>
                    <h2>$InfotextTitle</h2>
                    <% end_if %>

                    <div>
                        $MainBannerContent.RAW
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

                    <div class="row">
                    
                        <div class="col-sm-12 col-md-12">
                            <a href="/akcie" title="Zobraziť všetky akcie">Zobraziť viac</a>
                        </div>
                    </div>

                </div>
                <span class="anchor" id="dokumenty"></span>
                <div class="row">

                    <div class="col-sm-4 document-category">
                        <h2>Videá</h2>

                        <ul class="articles-list articles-list--links">
                            <% loop $HomePageVideo %>
                            <li <% if $Pos > 3 %>class="hidden-link"<% end_if %>>
                                <br>
                                <strong>$snippet.title</strong>
                                    <!--span>
                                        $snippet.publishedAt.format('j. n. Y')
                                    </span-->
                                <iframe width="280" height="158" src="https://www.youtube.com/embed/$id.videoId?rel=0&amp;showinfo=0" frameborder="0" allowfullscreen></iframe>
                            </hr>
                            </li>
                            <% end_loop %>
                        </ul>

                        <a href="/video">Zobraziť viac</a>
                    </div>

                    <div class="col-sm-4 document-category">
                        <h2>Médiá</h2>

                        <ul class="articles-list articles-list--links">
                            <% loop $MediaLinks.Sort(Date, Desc) %>
                            <li <% if $Pos > 10 %>class="hidden-link"<% end_if %>>
                                <a href="$Link" class="external-link">
                                    $Title
                                    <span>
                                        $Date.format('j. n. Y')<% if $Date && $Medium %>, <% end_if %>$Medium
                                    </span>
                                </a>
                            </li>
                            <% end_loop %>
                        </ul>
                        
                        <a href="/media">Zobraziť viac</a>
                    </div>

                    <div class="col-sm-4 document-category">
                        <h2>Dokumenty</h2>

                        <% loop $ArticleCategories %>


                            <h3>$Title</h3>
                            <div class="description">
                                $Content
                            </div>

                            <ul class="articles-list">
                                <% loop Children %>
                                <li <% if $Pos > 5 %>class="hidden-link"<% end_if %>>
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

                        <% end_loop %>

                        <a href="/dokumenty">Zobraziť viac</a>
                    </div>

                </div>
            </div>
        </div>
    </div>

    <% if $CustomContent %>
    <div class="custom-content">
        <div class="container">
            <div class="row">
                <div class="col-sm-12 col-md-12">$CustomContent.RAW</div>
            </div>
        </div>
    </div>


    <% end_if %>
    <div id="registracia"></div>
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
        </div>
    </div>
    </div>
<% end_if %>
