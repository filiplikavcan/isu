<div class="media-holder" style="margin-top: 40px; padding-top: 75px; padding-bottom: 75px; background-color: #efefef;">
    <div class="container">
        <div class="row">
            <div class="col-sm-6">
                <span class="anchor" id="media"></span>
                <h2 style="padding: 0 0 20px 0; margin: 0;">V médiách</h2>

                <ul style="margin-bottom: 45px;">
                    <% loop $MediaLinks.Sort(Sort) %>
                    <li style="padding-bottom: 5px;">
                        <span>$Date.format('j. n. Y')<% if $Date && $Medium %>, <% end_if %>$Medium:</span> <a href="$Link" target="_blank">$Title</a>
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
                    <% loop $Regions %>
                    <li>
                        <a href="$Link" target="_blank">$Title</a>
                    </li>
                    <% end_loop %>
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
                        <a href="http://www.viaiuris.sk/index.html" target="_blank">Via Iuris</a> za právne poradenstvo.
                    </li>
                    <li>
                        Spoločnosti <a href="http://www.websupport.sk/" target="_blank">Websupport</a> za hosting.
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>