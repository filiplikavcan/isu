<span class="anchor" id="registracia"></span>
<div class="container">
<% if $Action == 'edit' %>
    <div class="row">
        <div class="col-sm-5" >
            <h2>
                Aktualizácia údajov školy zapojenej do štrajku
            </h2>

            <p>Odoslaním elektronického prihlasovacieho formulára súhlasím so spracovaním osobných údajov, v zmysle ustanovenia § 11 zákona č. 122/2013 Z.z. o ochrane osobných údajov. Tento súhlas platí výlučne pre interné potreby Iniciatívy slovenských učiteľov v rozsahu osobných údajov:  meno a e-mailová adresa, najmä na zasielanie ďalších oznámení a informácií o štrajku vo forme emailov a newslettera. Iniciatíva slovenských učiteľov nebude tieto údaje nikde zverejňovať, ani ich posielať tretím stranám. Tento súhlas možno písomne odvolať mailom na <a href="mailto:strajk@isu.sk">strajk@isu.sk</a></p>
        </div>

        <div class="col-sm-7">
            $SchoolStrikeUpdateRegistrationForm

            <p>
                Ak ste Vašu školu ešte nezaregistrovali môžete <a href="$Link" class="update-form">vytvoriť novú registráciu</a>.
            </p>
        </div>
    </div>
<% else %>
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
<% end_if %>
</div>

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
                            <a href="$Link">$Title</a>
                        </li>
                        <% end_loop %>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <% end_loop %>
</div>
