<?php
class Schools extends ModelAdmin
{
    private static $managed_models = array(
        'School',
        'SchoolType',
        'City',
    );

    private static $url_segment = 'shools';

    private static $menu_title = 'Schools';

    private static $menu_icon = 'framework/admin/images/menu-icons/16x16/document.png';

    public $showImportForm = false;
}
