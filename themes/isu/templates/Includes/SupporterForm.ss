<div class="sidebar-holder">
    <h2>
        Podporte štrajk učiteľov osobne
    </h2>
    <form $FormAttributes>
        <label for="{$FormName}_Name">Meno a priezvisko</label>
        $Fields.dataFieldByName('Name')

        <label for="{$FormName}_City">Mesto/obec:</label>
        $Fields.dataFieldByName('City')

        $Fields.dataFieldByName(SecurityID)

        <div class="Actions">
            <% loop $Actions %>$Field<% end_loop %>
        </div>

        <small>Váš podpis sa zobrazí v&nbsp;dolnej časti tejto stránky.</small>
    </form>
</div>