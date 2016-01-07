<?php

class SchoolStrikeForm extends Form
{
    public function __construct($controller) {
        $city_field = new SchoolStrikeCityField('City', 'Obec');
        $city_field->setCities(City::all());
        $city_field->setEmptyString('---');
        $city_field->setTemplate('SchoolStrikeCityField');
        $city_field->addExtraClass('form-control');

        $fields = new FieldList(

            // Škola
            new DropdownField('Region', 'Kraj', City::regions()),
            $city_field,
            (new TextField('CityRaw'))->addExtraClass('form-control'),

            (new DropdownField('School'))->addExtraClass('form-control'),
            (new TextField('SchoolRaw'))->addExtraClass('form-control'),
            (new TextField('SchoolAddress', 'Adresa školy'))->addExtraClass('form-control'),

            // Pedagogickí a odborní zamestnanci
            (new TextField('EmployeesCount', 'Celkový počet'))->addExtraClass('form-control'),
            (new TextField('JoinedEmployeesCount', 'Počet zapojených'))->addExtraClass('form-control'),

            // Kontaktná osoba
            (new TextField('ContactName', 'Meno'))->addExtraClass('form-control'),
            (new TextField('ContactSurname', 'Priezvisko'))->addExtraClass('form-control'),
            (new TextField('ContactPosition', 'Titul/funkcia (napr. učiteľ biológie)'))->addExtraClass('form-control'),
            (new TextField('ContactEmail', 'E-mail'))->addExtraClass('form-control'),
            (new TextField('ContactPhone', 'Telefón'))->addExtraClass('form-control'),

            (new TextareaField('Note', 'Poznámka'))->addExtraClass('form-control')
        );

        $actions = new FieldList(
            (new FormAction('SendSchoolStrikeForm', 'Registrovať'))->addExtraClass('btn btn-primary')
        );

        $this->addExtraClass('school-strike-form form-horizontal');

        parent::__construct($controller, 'SchoolStrikeForm', $fields, $actions);
    }

    public function isValid()
    {
        foreach ($this->fields as $field)
        {
            $value = $field->Value();

            if (empty($value))
            {
                return false;
            }
        }

        return true;
    }
}