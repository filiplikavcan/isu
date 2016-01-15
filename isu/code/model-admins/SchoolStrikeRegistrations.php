<?php
class SchoolStrikeRegistrations extends ModelAdmin
{
    private static $managed_models = array(
        'SchoolStrikeRegistration',
    );

    private static $url_segment = 'registrations';

    private static $menu_title = 'Registrácie';

    private static $menu_icon = 'framework/admin/images/menu-icons/16x16/document.png';

    public $showImportForm = false;

    public function getEditForm($id = null, $fields = null) {
        $form = parent::getEditForm($id, $fields);

        $grid_field = $form->Fields()->fieldByName($this->sanitiseClassName($this->modelClass));

        $export_button = new IsuGridFieldExcelExportButton('toolbar-header-right');
        $export_button->setCustomFields(array(
            'SchoolName',
            'SchoolStreet',
            'SchoolNameFromDb',
            'CityName',
            'RegionName',
            'EmployeesCount',
            'JoinedEmployeesCount',
            'ContactName',
            'ContactSurname',
            'ContactPosition',
            'ContactEmail',
            'ContactPhone',
            'Note',
            'SchoolClosed',
        ));

        $gridFieldConfig = GridFieldConfig::create()->addComponents(
            new GridFieldToolbarHeader(),
            new GridFieldAddNewButton('toolbar-header-right'),
            new GridFieldSortableHeader(),
            new GridFieldDataColumns(),
            new GridFieldPaginator(50),
            new GridFieldEditButton(),
            new GridFieldDeleteAction(),
            new GridFieldDetailForm(),
            $export_button
        );

        $grid_field->setConfig($gridFieldConfig);

        return $form;
    }
}
