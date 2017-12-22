<!--div class="media-holder" style="margin-top: 40px; padding-top: 75px; padding-bottom: 75px; background-color: #efefef;">
    <div class="container">
        <div class="row">
            <div class="col-sm-6">
                <span class="anchor" id="media"></span>
                <h2 style="padding: 0 0 20px 0; margin: 0;">V médiách</h2>

                <ul style="margin-bottom: 15px; padding-left: 20px;">
                    <% loop $MediaLinks.Sort(Sort) %>
                    <li style="padding-bottom: 5px;" <% if $Pos > 10 %>class="hidden-link"<% end_if %>>
                    <span>$Date.format('j. n. Y')<% if $Date && $Medium %>, <% end_if %>$Medium:</span> <a href="$Link" target="_blank">$Title</a>
                    </li>
                    <% end_loop %>
                </ul>

                <a href="#" class="show-more-links">Zobraziť viac</a>
            </div>

            <div class="col-sm-6">
                <iframe width="560" height="315" src="https://www.youtube.com/embed/LF1M-qdb6RE?rel=0&amp;showinfo=0" frameborder="0" allowfullscreen></iframe>
            </div>
        </div>
    </div>
</div-->

<span class="anchor" id="kontakty"></span>
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

                <h3>ISU</h3>
                <p>
                    Email: <a href="mailto:info@isu.sk">info@isu.sk</a><br>
                    Telefón: 
                    <br>0908 420 468 (pre médiá)
                    <br>0902 347 413 (pre školy)
                    <br>0905 423 790 (pre školy)
                </p>

                <h3>IVU</h3>
                <p>
                    Email: <a href="mailto:ivu@isu.sk">ivu@isu.sk</a><br>
                </p>

                <h3>ĎŽV</h3>
                <p>
                    Email: <a href="mailto:dakujemezevieme@gmail.com">dakujemezevieme@gmail.com</a><br>

                </p>

                <h3>ĎAKUJEME</h3>
                <ul>
                    <li>
                        <a href="http://web.archive.org/web/20160319184106/http://fair-play.sk/" target="_blank">Aliancii Fair-Play</a> za odbornú pomoc a poradenstvo.
                    </li>
                    <li>
                        <a href="http://web.archive.org/web/20160319184106/http://www.frco.sk/" target="_blank">Andrejovi Borskému</a> za grafický návrh webu.
                    </li>
                    <li>
                        Braňovi Bezručkovi za prípravu printových materiálov.
                    </li>
                    <li>
                        Spoločnosti <a href="http://web.archive.org/web/20160319184106/http://www.bratia.sk/" target="_blank">bratia.sk</a> za web.
                    </li>
                    <li>
                        <a href="http://web.archive.org/web/20160319184106/http://www.viaiuris.sk/index.html" target="_blank">Via Iuris</a> za právne poradenstvo.
                    </li>
                    <li>
                        Spoločnosti <a href="http://web.archive.org/web/20160319184106/http://www.websupport.sk/" target="_blank">Websupport</a> za hosting.
                    </li>
                </ul>
            </div>
            <div class="col-sm-4">
                <span class="anchor" id="regiony"></span>
                <h2>Regionálne iniciatívy</h2>
                <ul>
                    <% loop $Regions %>
                    <% if $Link %>
                    <li>
                        <a href="$Link" target="_blank">$Title</a>
                    </li>
                    <% else  %>
                    <li>
                        $Title
                    </li>
                    <% end_if %>
                    <% end_loop %>
                </ul>
            </div>
            <div class="col-sm-4">
                <h2>
                    &nbsp;
                </h2>

                <ul>
                    <% loop $Regions %>
                    <% if $Email %>
                    <li>
                        <a href="mailto:$Email">$Email</a>
                    </li>
                    <% else %>
                    <li>
                        &nbsp;
                    </li>
                    <% end_if %>
                    <% end_loop %>
                    <li>
                        
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>