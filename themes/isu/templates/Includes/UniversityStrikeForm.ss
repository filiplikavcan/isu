<% if $IncludeFormTag %>
<form class="form form-horizontal university-strike-form">
    <% end_if %>

    <div class="alert alert-danger form-error-message">
        Prosím, vyplňte všetky označené údaje.
    </div>

    $Fields.fieldByName(UpdateHash)

    <div class="other-fields">
        <fieldset>
                <h3>
                    Zamestnanec VŠ
                </h3>
            <div class="form-group">
                <label class="col-sm-4 control-label">Meno:</label>
                <div class="col-sm-8">
                    $Fields.fieldByName(ContactName)
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-4 control-label">Priezvisko:</label>
                <div class="col-sm-8">
                    $Fields.fieldByName(ContactSurname)
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-4 control-label">Vysoká škola:</label>
                <div class="col-sm-8">
                    $Fields.fieldByName(University)
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-4 control-label">Emailová adresa:</label>
                <div class="col-sm-8">
                    $Fields.fieldByName(ContactEmail)
                    <div class="description">
                        <% if not $IsRestricted %>
                            Po odoslaní formulára Vám na túto emailovú adresu príde email s linkou, na ktorú musíte kliknúť,
                            aby ste potvrdili registráciu.
                        <% end_if %>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-4 control-label">Telefón:</label>
                <div class="col-sm-8">
                    $Fields.fieldByName(ContactPhone)
                </div>
            </div>
        </fieldset>

        <% if $Actions %>
        <div class="form-group">
            <div class="col-sm-8 col-sm-offset-4">
                <% loop $Actions %>
                $Field
                <% end_loop %>
            </div>
        </div>
        <% end_if %>

        <p><small>Odoslaním elektronického prihlasovacieho formulára súhlasím so spracovaním osobných údajov, v zmysle ustanovenia § 11 zákona č. 122/2013 Z.z. o ochrane osobných údajov. Tento súhlas platí výlučne pre interné potreby Iniciatívy slovenských učiteľov v rozsahu osobných údajov:  meno a e-mailová adresa, najmä na zasielanie ďalších oznámení a informácií o štrajku vo forme emailov a newslettera. Iniciatíva slovenských učiteľov nebude tieto údaje nikde zverejňovať, ani ich posielať tretím stranám. Tento súhlas možno písomne odvolať mailom na <a href="mailto:strajk@isu.sk">strajk@isu.sk</a></small></p>

    </div>
    <% if $IncludeFormTag %>
</form>
<% end_if %>

<script type="text/javascript">
    APP.init('UniversityStrikeForm');
</script>
