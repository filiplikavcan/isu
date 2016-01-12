<div class="media-holder" style="margin-top: 40px; padding-top: 75px; padding-bottom: 75px; background-color: #efefef;">
    <div class="container">
        <div class="row">
            <div class="col-sm-6">
                <span class="anchor" id="media"></span>
                <h2 style="padding: 0 0 20px 0; margin: 0;">V médiách</h2>

                <ul style="margin-bottom: 45px;">
                    <% loop $MediaLinks %>
                    <li style="padding-bottom: 5px;">
                        <a href="$Link" target="_blank">$Title</a> <small>$Medium</small>
                    </li>
                    <% end_loop %>
                </ul>
            </div>

            <div class="col-sm-6">
                <iframe width="560" height="315" src="https://www.youtube.com/embed/LF1M-qdb6RE?rel=0&amp;showinfo=0" frameborder="0" allowfullscreen></iframe>
            </div>
        </div>
    </div>
</div>

<div class="footer">
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <form class="form form-horizontal newsletter-form">
                    <h2>
                        Chcete zostať informovaný?
                    </h2>

                    <p>
                        Zadajte svoju emailovú adresu, ak chcete dostávať<br> emailom novinky o činnosti ISU.
                    </p>

                    <div class="form-group">
                        <div class="col-sm-6 col-sm-offset-3">
                            <div class="input-group">
                                <input type="text" name="Email" class="form-control" placeholder="emailová adresa">
                                <span class="input-group-btn">
                                    <input type="submit" class="btn btn-primary" value="Odoslať">
                                </span>
                            </div>
                        </div>
                    </div>

                    <p>
                        Nespamujeme a odhlásiť sa je jednoduché.
                    </p>
                </form>
            </div>
        </div>
        <div class="row info-boxes">
            <div class="col-sm-4">
                <h2>Kontakt</h2>
                <p>
                    Email: <a href="mailto:info@isu.sk">info@isu.sk</a><br>
                    Telefón: 0908 420 468
                </p>

                <h2 style="margin-top: 40px;">O ISU</h2>

                <p>
                    Iniciatíva slovenských učiteľov je neformálne hnutie, ktoré vzniklo spojením lokálnych učiteľských iniciatív z celého Slovenska.
                </p>
            </div>
            <div class="col-sm-4">
                <span class="anchor" id="regiony"></span>
                <h2>Regionálne iniciatívy</h2>
                <ul>
                    <li>
                        <a href="http://ibu7.webnode.sk/" target="_blank">IBU - Iniciatíva bratislavských učiteľov</a>
                    </li>
                    <li>
                        <a href="http://izu4.webnode.sk/" target="_blank">IZU - Iniciatíva žilinských učiteľov</a>
                    </li>
                    <li>
                        <a href="http://www.velkaprestavka.sk/" target="_blank">Veľká prestávka - iniciatíva považskobystrických učiteľov</a>
                    </li>
                    <li>
                        <a href="http://ibbu1.webnode.sk/" target="_blank">IBBU - Iniciatíva banskobystrických učiteľov</a>
                    </li>
                    <li>
                        <a href="http://itu3.webnode.sk/" target="_blank">ITU - Iniciatíva trnavských učiteľov</a>
                    </li>
                    <li>
                        <a href="https://www.facebook.com/groups/975617185831007/" target="_blank">ILU - Iniciatíva levických učiteľov</a>
                    </li>
                    <li>
                        <a href="https://www.facebook.com/Iniciat%C3%ADva-nitrianskych-u%C4%8Dite%C4%BEov-1655038091427960/" target="_blank">INRU - Iniciatíva nitrianskych učiteľov</a>
                    </li>
                    <li>
                        <a href="https://www.facebook.com/groups/1681140675501152/" target="_blank">ITNU - Iniciatíva trenčianskych učiteľov</a>
                    </li>
                </ul>
            </div>
            <div class="col-sm-4">
                <h2>
                    Ďakujeme
                </h2>

                <ul>
                    <li>
                        <a href="http://fair-play.sk/" target="_blank">Aliancii Fair-Play</a> za odbornú pomoc a poradenstvo.
                    </li>
                    <li>
                        <a href="http://www.frco.sk/" target="_blank">Andrejovi Borskému</a> za grafický návrh webu.
                    </li>
                    <li>
                        Braňovi Bezručkovi za prípravu printových materiálov.
                    </li>
                    <li>
                        Spoločnosti <a href="http://www.bratia.sk/" target="_blank">bratia.sk</a> za web.
                    </li>
                    <li>
                        Spoločnosti <a href="http://www.websupport.sk/" target="_blank">Websupport</a> za hosting.
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>