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

    public function getEditForm($id = null, $fields = null) {
        $form = parent::getEditForm($id, $fields);

        $grid_field = $form->Fields()->fieldByName($this->sanitiseClassName($this->modelClass));

        $gridFieldConfig = GridFieldConfig::create()->addComponents(
            new GridFieldToolbarHeader(),
            new GridFieldAddNewButton('toolbar-header-right'),
            new GridFieldSortableHeader(),
            new GridFieldDataColumns(),
            new GridFieldPaginator(50),
            new GridFieldEditButton(),
            new GridFieldDeleteAction(),
            new GridFieldDetailForm(),
            new GridFieldOrderableRows()
        );

        $grid_field->setConfig($gridFieldConfig);

        return $form;
    }
}
