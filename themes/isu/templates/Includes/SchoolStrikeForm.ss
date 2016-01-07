<% if $IncludeFormTag %>
<form $AttributesHTML>
    <% end_if %>
    <h2>Rregistrácia školy zapojenej do štrajkovej pohotovosti</h2>
    <% if $Message %>
    <p id="{$FormName}_error" class="message $MessageType">$Message</p>
    <% else %>
    <p id="{$FormName}_error" class="message $MessageType" style="display: none"></p>
    <% end_if %>

    <p>
        Registrácia zapojených škôl slúži výlučne pre potreby Iniciatívy slovenských učiteľov. Ďakujeme, že registrujete štrajkujúce školy, je to dôležité pre efektívny priebeh štrajku. Údaje o kontaktnej osobe nebudú zverejnené.
    </p>

    <p>
        Ak ste už školu zaregistrovali môžete <a href="" class="update-form">aktualizovať údaje</a>.
    </p>

        $Fields.fieldByName(SecurityID)

    <div class="form-group choose-city">
        <label class="col-sm-4 control-label">Vyberte obec:</label>
        <div class="col-sm-8">
            $Fields.fieldByName(City)
            <div><a href="" class="toggle" data-toggle="choose_city">Kliknite ak Vaša obec nie je v zozname</a></div>
        </div>
    </div>

    <div class="form-group add-city">
        <label class="col-sm-4 control-label">Názov obce:</label>
        <div class="col-sm-8">
            <span style="display: inline-block; width: 50%;">$Fields.fieldByName(CityRaw)</span>
            kraj: $Fields.fieldByName(Region)
            <div><a href="" class="toggle" data-toggle="choose_city">Kliknite ak chcete Vašu obec vybrať zo zoznamu</a></div>
        </div>
    </div>

    <div class="form-group choose-school">
        <label class="col-sm-4 control-label">Vyberte školu:</label>
        <div class="col-sm-8">
            $Fields.fieldByName(School)
            <div><a href="" class="toggle" data-toggle="choose_school">Kliknite ak Vaša škola nie je v zozname</a></div>
        </div>
    </div>

    <div class="form-group add-school">
        <label class="col-sm-4 control-label">Názov školy:</label>
        <div class="col-sm-8">
            $Fields.fieldByName(SchoolRaw)
            <div class="add-school-toggle"><a href="" class="toggle" data-toggle="choose_school">Kliknite ak chcete Vašu školu vybrať zo zoznamu</a></div>
        </div>
    </div>

    <div class="form-group school-address">
        <label class="col-sm-4 control-label">Ulica:</label>
        <div class="col-sm-8">
            $Fields.fieldByName(SchoolStreet)
        </div>
    </div>

    <div class="other-fields">
        <h4>Pedagogickí a odborní zamestnanci na škole</h4>
        <div class="form-group">
            <label class="col-sm-4 control-label">Celkový počet:</label>
            <div class="col-sm-8">
                $Fields.fieldByName(EmployeesCount)
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-4 control-label">Počet zapojených:</label>
            <div class="col-sm-8">
                $Fields.fieldByName(JoinedEmployeesCount)
            </div>
        </div>

        <h4>Kontaktná osoba</h4>

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
            <label class="col-sm-4 control-label">Titul/funkcia (napr. učiteľ biológie):</label>
            <div class="col-sm-8">
                $Fields.fieldByName(ContactPosition)
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-4 control-label">Emailová adresa:</label>
            <div class="col-sm-8">
                $Fields.fieldByName(ContactEmail)
                <div>
                    Po odoslaní formulára Vám na túto emailovú adresu príde email s linkou, na ktorú musíte kliknúť, aby ste potvrdili registráciu.
                </div>
            </div>
        </div>

        <h4>Doplňujúce (nepovinné) údaje</h4>

        <div class="form-group">
            <label class="col-sm-4 control-label">Telefón:</label>
            <div class="col-sm-8">
                $Fields.fieldByName(ContactPhone)
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-4 control-label">Poznámka:</label>
            <div class="col-sm-8">
                $Fields.fieldByName(Note)
            </div>
        </div>

        <% if $Actions %>
        <div class="actions">
            <% loop $Actions %>
            $Field
            <% end_loop %>
        </div>
        <% end_if %>
    </div>

    <p><small>Odoslaním elektronického prihlasovacieho formulára súhlasím so spracovaním osobných údajov, v zmysle ustanovenia § 11 zákona č. 122/2013 Z.z. o ochrane osobných údajov. Tento súhlas platí výlučne pre interné potreby Iniciatívy slovenských učiteľov v rozsahu osobných údajov:  meno a e-mailová adresa, najmä na zasielanie ďalších oznámení a informácií o štrajku vo forme emailov a newslettera. Iniciatíva slovenských učiteľov nebude tieto údaje nikde zverejňovať, ani ich posielať tretím stranám. Tento súhlas možno písomne odvolať mailom na <a href="mailto:strajk@isu.sk">strajk@isu.sk</a></small></p>
    <% if $IncludeFormTag %>
</form>
<% end_if %>

<script type="text/javascript">
    APP.init('SchoolStrikeForm');
</script>
