<?php
class Actions extends ModelAdmin
{
    private static $managed_models = array(
        'Action',
        'ActionGroup',
    );

    private static $url_segment = 'actions';

    private static $menu_title = 'Akcie';

    private static $menu_icon = 'framework/admin/images/menu-icons/16x16/document.png';

    public $showImportForm = false;

    function getEditForm($id = null, $fields = null) {
        $form = parent::getEditForm();

        $form
            ->Fields()
            ->fieldByName($this->sanitiseClassName($this->modelClass))
            ->getConfig()
            ->addComponent(new GridFieldCopyButton(), 'GridFieldEditButton') // or just ->addComponent(new GridFieldCopyButton())
            ->addComponent(new GridFieldOrderableRows()) // or just ->addComponent(new GridFieldCopyButton())
        ;

        return $form;
    }
}
