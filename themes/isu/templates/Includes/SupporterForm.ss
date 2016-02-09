<div class="sidebar-holder">
    <h2>
        Podporte štrajk učiteľov osobne
    </h2>
    <form $FormAttributes>
        <label for="{$FormName}_Name">Meno a priezvisko</label>
        $Fields.dataFieldByName('Name')

        <label for="{$FormName}_City">Mesto/obec:</label>
        $Fields.dataFieldByName('City')

        <label for="{$FormName}_Email">Email:</label>
        $Fields.dataFieldByName('Email')

        <div style="margin-top: 10px;">
            <label style="display: inline;">Som</label> $Fields.dataFieldByName('PersonType')
        </div>

        $Fields.dataFieldByName(SecurityID)

        <div class="Actions">
            <% loop $Actions %>$Field<% end_loop %>
        </div>

        <small>Váš podpis sa po overení zobrazí v&nbsp;dolnej časti tejto stránky. Odoslaním formulára súhlasíte so zasielaním noviniek o štrajku.</small>
    </form>
</div>