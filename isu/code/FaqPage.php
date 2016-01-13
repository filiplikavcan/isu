<?php

class FaqPage extends Page
{
    private static $many_many = array(
        'Questions' => 'FaqQuestion',
    );

    public function getCMSFields() {
        $fields = parent::getCMSFields();

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

        $gridField = new GridField("Questions", "Otázky", $this->Questions(), $gridFieldConfig);
        $fields->addFieldToTab("Root.Otázky", $gridField);

        return $fields;
    }
}

class FaqPage_Controller extends Page_Controller
{

}
