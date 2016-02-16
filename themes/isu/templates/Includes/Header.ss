<nav class="navbar navbar-default">
    <div class="container" style="position: relative;">
        <div class="navbar-header">
            <a class="navbar-brand" href="/"><span>Iniciatíva slovenských učiteľov</span></a>
        </div>

        <ul class="nav navbar-nav fb-button">
            <li style="padding-top: 30px; padding-left: 30px;">
                <div class="fb-like" data-href="https://www.facebook.com/iniciativa.slovenskych.ucitelov" data-layout="button" data-action="like" data-show-faces="false" data-share="false"></div>
            </li>
        </ul>

        <% with $StrikeCounter %>
        <div class="counter">
            <div class="box">
                <div class="universities-count">$UniversitiesCount</div>
                <div class="school-stats">
                    zapojených VŠ
                    <% if $Top.StrikeMapPage %>
                        <br><a href="$Top.UniversityListPage.Link">zoznam VŠ</a>
                    <% end_if %>
                </div>
            </div>

            <div class="box">
                <div class="universities-count">
                    $Top.PeopleCount
                </div>
                <div class="school-stats">
                    ľudí podporuje štrajk
                    <br><a href="/podporuju-nas#podporovatelia">zoznam ľudí</a>
                </div>
            </div>
        </div>
        <% end_with %>
    </div>
</nav>

<nav class="navbar navbar-default menu">
    <div class="container" style="position: relative;">
        <ul class="nav navbar-nav">
            <li class="highlighted"><a href="/home#registracia">Registrovať do štrajku</a></li>
            <li class="highlighted"><a href="/podporuju-nas">Podporiť štrajk</a></li>
            <li><a href="/vysoke-skoly">Vysoké školy</a></li>
            <li><a href="/home#dokumenty">Dokumenty</a></li>
            <li><a href="/zastrasovanie">Zastrašovanie</a></li>
            <li><a href="/najcastejsie-otazky">Najčastejšie otázky</a></li>
            <li><a href="#media">Média</a></li>
            <li><a href="/kontakty">Kontakty</a></li>
            <li><a href="/foreign-media" style="color: gray;">Foreign media</a></li>
        </ul>
    </div>
</nav>

<div class="red-alert-holder">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <div class="btn-action">
                    Podrobnosti o akciách nájdete <a href="/home#akcie">v zozname akcií</a>.
                </div>
            </div>
        </div>
    </div>
</div>

