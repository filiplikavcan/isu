<?php
class MediaLinks extends ModelAdmin
{
    private static $managed_models = array(
        'MediaLink',
    );

    private static $url_segment = 'media-links';

    private static $menu_title = 'V médiách';

    private static $menu_icon = 'framework/admin/images/menu-icons/16x16/document.png';

    public $showImportForm = false;
}
