<nav class="navbar navbar-default">
    <div class="container" style="position: relative;">
        <div class="navbar-header">
            <a class="navbar-brand" href="/"><span>Iniciatíva slovenských učiteľov</span></a>
        </div>

        <ul class="nav navbar-nav fb-button">

            <li>
                <a href="https://www.facebook.com/iniciativa.slovenskych.ucitelov/" target="_blank" title="" class="fb-link">Iniciatíva slovenských učiteľov</a>
            </li>

            <li>
                <a href="https://www.facebook.com/iniciativa.vs.ucitelov/" target="_blank" title="Iniciatíva vysokoškolských učiteľov" class="fb-link">Iniciatíva vysokoškolských učiteľov</a>
            </li>

            <li>
                <a href="https://www.facebook.com/dakujemezevieme/" target="_blank" title="Ďakujeme, že vieme" class="fb-link">Ďakujeme, že vieme</a>
            </li>

            <!--li style="padding-top: 30px; padding-left: 30px;">
                <div class="fb-like" data-href="https://www.facebook.com/iniciativa.slovenskych.ucitelov" data-layout="button" data-action="like" data-show-faces="false" data-share="false"></div>
            </li-->
        </ul>



        <% with $StrikeCounter %>
        <!--div class="counter">
            <div class="box">
                <div class="universities-count">$UniversityRegistrationsCount</div>
                <div class="school-stats">
                    zapojených zamestnancov VŠ
                </div>
            </div>

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
        </div-->
        <% end_with %>
    </div>
</nav>

<nav class="navbar navbar-default menu">
    <div class="container" style="position: relative;">
        <ul class="nav navbar-nav">
            <li><a href="/home/#registracia">Registrácia</a></li>
            <li><a href="/akcie">Akcie</a></li>
            <li><a href="/media">Médiá</a></li>
            <li><a href="/video">Videá</a></li>
            <li><a href="/dokumenty">Dokumenty</a></li>
            <li><a href="/zastrasovanie">Zastrašovanie</a></li>
            <li><a href="/sesttyzdnovy-strajk">Šesťtýždňový štrajk</a></li>
            <li><a href="#kontakty">Kontakty</a></li>
            <li><a href="/foreign-media" style="color: gray;">Foreign media</a></li>
        </ul>

        <% with $StrikeCounter %>
            <% if $PeopleCount > 1000 %>
                <div class="counter">
                    <div class="people-count">$PeopleCount</div>
                    <div class="school-stats">registrovaných učiteľov<br>z&nbsp;<span>$SchoolsCount</span> škôl</div>
                    <% if $Top.StrikeMapPage %>
                        <a href="$Top.StrikeMapPage.Link">viac info</a>
                    <% end_if %>
                </div>
            <% end_if %>
        <% end_with %>
    </div>
</nav>

<div class="red-alert-holder">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <div class="btn-action">
                    Pokračujeme v štrajku!
                </div>
            </div>
        </div>
    </div>
</div>

