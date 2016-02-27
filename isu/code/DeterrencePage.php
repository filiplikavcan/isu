<?php

class DeterrencePage extends Page
{
    private static $db = array(
        'DeterrenceVideo' => 'Text',
    );
    
    private static $has_many = array(
        'DeterrenceCases' => 'DeterrenceCase'
    );

    public function getCMSFields() {
        $fields = parent::getCMSFields();

        $fields->addFieldToTab('Root.Main', new TextareaField('DeterrenceVideo', 'DeterrenceVideo'));

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

        $gridField = new GridField(
            "Cases", 
            "Príklady zastrašovania", 
            $this->DeterrenceCases(), 
            $gridFieldConfig
        );
        $fields->addFieldToTab("Root.Príklady", $gridField);
        
        return $fields;
    }

}

class DeterrencePage_Controller extends Page_Controller
{

}
