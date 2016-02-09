<?php

class UniversityStrikeForm extends Form
{
    public function __construct($controller)
    {
        $this->setTemplate('UniversityStrikeForm');

        $fields = array(
            (new TextField('ContactName'))->addExtraClass('form-control'),
            (new TextField('ContactSurname'))->addExtraClass('form-control'),
            (new TextField('ContactPosition'))->addExtraClass('form-control'),
            (new DropdownField('University', 'Vysoká škola', University::get()->map()))->addExtraClass('form-control'),
            (new TextField('ContactEmail'))->addExtraClass('form-control'),
            (new TextField('ContactPhone'))->addExtraClass('form-control')
        );

        $field_list = new FieldList();

        foreach ($fields as $field)
        {
            $field_list->add($field);
        }

        $actions = new FieldList(
            (new FormAction('SendSchoolStrikeForm', 'Registrovať'))->addExtraClass('btn btn-primary')
        );

        $this->addExtraClass('school-strike-form form-horizontal');

        parent::__construct($controller, 'UniversityStrikeForm', $field_list, $actions);

        if ($this->registration instanceof UniversityStrikeRegistration)
        {
            $this->loadDataFrom($this->registration);
        }
    }
}