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
                    <h2>Zaregistrujte školu zapojenú do štrajku</h2>

                    <p>
                        Registrácia zapojených škôl slúži výlučne pre potreby <a href="/manualy/strajkovy-vybor-isu/">štrajkového výboru Iniciatívy slovenských učiteľov</a>. Ďakujeme, že registrujete štrajkujúce školy, je to dôležité pre efektívny priebeh štrajku. Údaje o kontaktnej osobe nebudú zverejnené.
                    </p>

                    <div>
                        <a href="/#registracia" class="btn btn-register">Zaregistrovať školu</a>
                    </div>

                    <p style="text-align: center;">
                        Ak ste už Vašu školu zaregistrovali, môžete<br> <a href="$Link('edit')" class="update-form">aktualizovať údaje</a>.
                    </p>
                </div>
            </div>
        </div>
    </div>

    <span class="anchor" id="registracia"></span>
    <div class="container">
        <div class="row registration">
            <div class="col-sm-5">
                <h2>
                    Registrácia školy zapojenej do štrajku
                </h2>

                <p>Odoslaním elektronického prihlasovacieho formulára súhlasím so spracovaním osobných údajov, v zmysle ustanovenia § 11 zákona č. 122/2013 Z.z. o ochrane osobných údajov. Tento súhlas platí výlučne pre interné potreby Iniciatívy slovenských učiteľov v rozsahu osobných údajov:  meno a e-mailová adresa, najmä na zasielanie ďalších oznámení a informácií o štrajku vo forme emailov a newslettera. Iniciatíva slovenských učiteľov nebude tieto údaje nikde zverejňovať, ani ich posielať tretím stranám. Tento súhlas možno písomne odvolať mailom na <a href="mailto:strajk@isu.sk">strajk@isu.sk</a></p>
            </div>

            <div class="col-sm-7">
                $SchoolStrikeCreateRegistrationForm
            </div>
        </div>
    </div>
<% end_if %>

<span class="anchor" id="dokumenty"></span>
<div class="documents">
    <% loop $ArticleCategories %>
    <div class="document-category-holder <% if $Odd %>odd<% else %>even<% end_if %>">
        <div class="container">
            <div class="row">
                <div class="col-sm-5">
                    <% if $Image %><img src="$Image.Link"><% end_if %>
                    <h2>$Title</h2>
                    <div class="description">
                        $Content
                    </div>
                </div>
                <div class="col-sm-7">
                    <ul class="articles-list">
                        <% loop Children %>
                        <li>
                            <a href="$Link" class="icon-$IconName">
                                $MenuTitle
                                <span>
                                    <% if $PublishDate %>
                                        $PublishDate.format('j. n. Y')
                                    <% end_if %>
                                    <% if $FileSize %><% if $PublishDate %> | <% end_if %>$FileSize<% end_if %></span>
                            </a>
                        </li>
                        <% end_loop %>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <% end_loop %>
</div>
