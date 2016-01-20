<% if $Action == 'edit' %>
    $SchoolStrikeUpdateRegistrationForm
<% else %>

    <div class="main-banner">
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <div class="main-info">
                        <div>
                            <h2>Iniciatíva slovnských učiteľov vyhlasuje štrajk od 25.1.2016</h2>
                            <h3>Nie je nám to FUK!</h3>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6">
                    <% if $InfotextTitle %>
                        <h2>$InfotextTitle</h2>
                    <% end_if %>

                    $Content

                    <h2>Registrácia pokračuje!<br>PRIDAJTE SA,<br>SPOLU TO DOKÁŽEME!</h2>

                    <p>
                        Registrácia slúži výlučne pre potreby <a href="/manualy/strajkovy-vybor-isu/" style="display: inline;">štrajkového výboru Iniciatívy slovenských učiteľov</a>.
                        Ďakujeme, že sa registrujete, je to dôležité pre efektívny priebeh štrajku. Údaje o kontaktnej osobe nebudú zverejnené.
                    </p>

                    <div>
                        <a href="/#registracia" class="btn btn-register">Registrujte sa</a>
                    </div>

                    <% if $FeaturedPage %>
                        <div>
                            <a href="$FeaturedPage.Link" class="btn btn-register" style="text-transform: none; margin-top: -10px; font-weight: 400">$FeaturedButtonTitle</a>
                        </div>
                    <% end_if %>

                    <p style="text-align: center;">
                        Ak ste sa už zaregistrovali, môžete <a href="$Link('edit')" class="update-form">aktualizovať údaje</a>.
                    </p>
                </div>
            </div>
        </div>
    </div>

    <span class="anchor" id="dokumenty"></span>
    <div class="documents">
        <div class="document-category-holder odd">
            <div class="container">
                <div class="row">
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

    <div class="container">
        <div class="row registration">
            <div class="col-sm-8 col-sm-offset-2">
                <span class="anchor" id="registracia"></span>
                <h2>
                    Registrácia do štrajku
                </h2>

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
<% end_if %>
