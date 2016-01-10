<% if ShowRequestUpdateForm %>
    <form class="form form-horizontal request-update-form">
        <div class="form-group">
            <label class="col-sm-12">Emailová adresa kontaktnej osoby:</label>
            <div class="col-sm-12">
                <input type="text" name="Email" class="form-control">
                <div>
                    Na emailovú adresu Vám príde email s inštrukciami ako aktualizovať údaje.
                </div>
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-12">
                <input type="submit" value="Odoslať" class="btn btn-primary">
            </div>
        </div>
    </form>
<% else %>
    <% if $IncludeFormTag %>
    <form $AttributesHTML>
        <% end_if %>

        <div class="alert alert-danger form-error-message">
            Prosím, vyplňte všetky označené údaje.
        </div>

        $Fields.fieldByName(UpdateHash)

        <fieldset>
            <h3>
                1. Škola
            </h3>
            <% if $IsRestricted %>
                <div class="form-group choose-city">
                    <label class="col-sm-4 control-label"></label>
                    <div class="col-sm-8">
                        <% with $Registration.School %>
                            <p class="form-control-static">$Name<br>$Street, $City.Name</p>
                        <% end_with %>
                    </div>
                </div>
            <% else %>
                <% cached $CitiesCacheKey %>
                    <div class="form-group choose-city">
                        <label class="col-sm-4 control-label">Vyberte obec:</label>
                        <div class="col-sm-8">
                            $Fields.fieldByName(City)
                            <div><a href="" class="toggle" data-toggle="choose_city">Pridať obec (ak nie je v zozname)</a></div>
                        </div>
                    </div>
                <% end_cached %>

                <div class="form-group add-city">
                    <label class="col-sm-4 control-label">Názov obce:</label>
                    <div class="col-sm-8">
                        <span style="display: inline-block; width: 50%;">$Fields.fieldByName(CityRaw)</span>
                        kraj: $Fields.fieldByName(Region)
                        <div><a href="" class="toggle" data-toggle="choose_city">Vybrať obec zo zoznamu</a></div>
                    </div>
                </div>

                <div class="form-group choose-school">
                    <label class="col-sm-4 control-label">Vyberte školu:</label>
                    <div class="col-sm-8">
                        $Fields.fieldByName(School)
                        <div><a href="" class="toggle" data-toggle="choose_school">Pridať školu (ak nie je v zozname)</a></div>
                    </div>
                </div>

                <div class="form-group add-school">
                    <label class="col-sm-4 control-label">Názov školy:</label>
                    <div class="col-sm-8">
                        $Fields.fieldByName(SchoolRaw)
                        <div class="add-school-toggle"><a href="" class="toggle" data-toggle="choose_school">Vybrať školu zo zoznamu</a></div>
                    </div>
                </div>

                <div class="form-group school-address">
                    <label class="col-sm-4 control-label">Ulica:</label>
                    <div class="col-sm-8">
                        $Fields.fieldByName(SchoolStreet)
                    </div>
                </div>
            <% end_if %>
        </fieldset>

        <div class="other-fields">
            <fieldset>
                <h3>
                    2. Pedagogickí a odborní zamestnanci na škole
                </h3>

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
            </fieldset>

            <fieldset>
                    <h3>
                        3. Kontaktná osoba
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
                    <label class="col-sm-4 control-label">Titul/funkcia:</label>
                    <div class="col-sm-8">
                        $Fields.fieldByName(ContactPosition)
                        <div class="description">
                            Príklad: učiteľ biológie
                        </div>
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
            </fieldset>

            <fieldset>
                <h3>
                    4. Doplňujúce údaje <span>(nepovinné)</span>
                </h3>

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
        </div>
        <% if $IncludeFormTag %>
    </form>
    <% end_if %>
<% end_if %>

<script type="text/javascript">
    APP.init('SchoolStrikeForm');
</script>
