<?php
class Regions extends ModelAdmin
{
    private static $managed_models = array(
        'Region',
    );

    private static $url_segment = 'regions';

    private static $menu_title = 'Regióny';

    private static $menu_icon = 'framework/admin/images/menu-icons/16x16/document.png';

    public $showImportForm = false;
}
