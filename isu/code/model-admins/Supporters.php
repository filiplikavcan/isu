<?php

class Supporters extends ModelAdmin
{
    private static $managed_models = array(
        'Supporter',
    );

    private static $url_segment = 'supporters';

    private static $menu_title = 'Podporovatelia';

    private static $menu_icon = 'framework/admin/images/menu-icons/16x16/document.png';

    public $showImportForm = false;

    public function getEditForm($id = null, $fields = null) {
        $form = parent::getEditForm($id, $fields);

        $grid_field = $form->Fields()->fieldByName($this->sanitiseClassName($this->modelClass));

        $export_button = new IsuGridFieldExcelExportButton('toolbar-header-right');
        $export_button->setCustomFields(array(
            'Name',
            'City',
            'Email',
            'Type',
        ));

        $gridFieldConfig = GridFieldConfig::create()->addComponents(
            new GridFieldToolbarHeader(),
            (new GridFieldAddNewButton('toolbar-header-left'))->setButtonName('Pridať podporovateľa'),
            new GridFieldSortableHeader(),
            new GridFieldDataColumns(),
            new GridFieldPaginator(50),
            new GridFieldEditButton(),
            new GridFieldDeleteAction(),
            new GridFieldDetailForm(),
            new GridFieldCheckboxSelectComponent(),
            new GridFieldApplyToMultipleRows(
                'verifysupporters',
                'Schváliť zvolených podporovateľov',
                array($this, 'verifySupporter'),
                'toolbar-header-right',
                array(
                    'confirm' => 'Naozaj chceš schváliť týchto podporovateľov?'
                )
            ),
            $export_button
        );

        $gridFieldConfig->getComponentByType('GridFieldPaginator')->setItemsPerPage(100);

        $grid_field->setConfig($gridFieldConfig);

        return $form;
    }

    public function verifySupporter($record, $index)
    {
        $record->Verified = true;
        $record->write();
    }
}
