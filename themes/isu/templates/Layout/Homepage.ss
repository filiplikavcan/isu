<div class="row">
    <div class="col-sm-6">
        <% if $Action == 'edit' %>
            <h2>
                Aktualizácia údajov školy zapojenej do štrajku
            </h2>

            $SchoolStrikeUpdateRegistrationForm

            <p>
                Ak ste Vašu školu ešte nezaregistrovali môžete <a href="$Link" class="update-form">vytvoriť novú registráciu</a>.
            </p>

        <% else %>
            <h2>
                Rregistrácia školy zapojenej do štrajku
            </h2>

            <p>
                Registrácia zapojených škôl slúži výlučne pre potreby Iniciatívy slovenských učiteľov. Ďakujeme, že registrujete štrajkujúce školy, je to dôležité pre efektívny priebeh štrajku. Údaje o kontaktnej osobe nebudú zverejnené.
            </p>

            <p>
                Ak ste Vašu už školu zaregistrovali môžete <a href="$Link('edit')" class="update-form">aktualizovať údaje</a>.
            </p>

            $SchoolStrikeCreateRegistrationForm
        <% end_if %>
    </div>
</div>