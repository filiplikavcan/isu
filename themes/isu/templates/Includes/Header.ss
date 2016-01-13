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
    </div>
</nav>

<nav class="navbar navbar-default menu">
    <div class="container" style="position: relative;">
        <ul class="nav navbar-nav">
            <li><a href="/home#registracia">Registrácia</a></li>
            <li><a href="/home#dokumenty">Aktuality, manuály, vyhlásenia</a></li>
            <li><a href="#media">V médiách</a></li>
            <!--<li><a href="/casto-kladene-otazky">Často kladené otázky</a></li>-->
            <li><a href="/kontakty">Kontakty</a></li>
        </ul>

        <% with $StrikeCounter %>
            <div class="counter">
                <div class="people-count">$PeopleCount</div>
                <div class="school-stats">registrovaných učiteľov<br>z&nbsp;<span>$SchoolsCount</span> škôl</div>
            </div>
        <% end_with %>
    </div>
</nav>
