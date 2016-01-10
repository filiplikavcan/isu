<?php

class SchoolStrikeForm extends Form
{
    /**
     * @var SchoolStrikeRegistration
     */
    protected $registration;

    /**
     * @var bool
     */
    protected $is_restricted;

    public function __construct($controller, $is_restricted = false, SchoolStrikeRegistration $registration = null)
    {
        $this->setTemplate('SchoolStrikeForm');

        $this->is_restricted = $is_restricted;

        $fields = array(
            // Pedagogickí a odborní zamestnanci
            (new TextField('EmployeesCount'))->addExtraClass('form-control'),
            (new TextField('JoinedEmployeesCount'))->addExtraClass('form-control'),

            // Kontaktná osoba
            (new TextField('ContactName'))->addExtraClass('form-control'),
            (new TextField('ContactSurname'))->addExtraClass('form-control'),
            (new TextField('ContactPosition'))->addExtraClass('form-control'),
            (new TextField('ContactEmail'))->addExtraClass('form-control'),

            (new TextField('ContactPhone'))->addExtraClass('form-control'),
            (new TextareaField('Note'))->addExtraClass('form-control')
        );

        if (!$this->is_restricted)
        {
            $city_field = new SchoolStrikeCityField('City', 'Obec');
            $city_field->setCities(City::all());
            $city_field->setEmptyString('---');
            $city_field->setTemplate('SchoolStrikeCityField');
            $city_field->addExtraClass('form-control');

            $fields = array_merge($fields, array(
                // Škola
                new DropdownField('Region', 'Kraj', City::regions()),
                $city_field,
                (new TextField('CityRaw'))->addExtraClass('form-control'),

                (new DropdownField('School'))->addExtraClass('form-control'),
                (new TextField('SchoolRaw'))->addExtraClass('form-control'),
                (new TextField('SchoolStreet'))->addExtraClass('form-control')
            ));
        }

        if ($registration instanceof SchoolStrikeRegistration)
        {
            $this->registration = $registration;

            $fields = array_merge($fields, array(
                new HiddenField('UpdateHash', $registration->ID)
            ));
        }

        $field_list = new FieldList();

        foreach ($fields as $field)
        {
            $field_list->add($field);
        }

        $actions = new FieldList(
            (new FormAction('SendSchoolStrikeForm', $this->is_restricted ? 'Uložiť zmeny' : 'Registrovať'))->addExtraClass('btn btn-primary')
        );

        $this->addExtraClass('school-strike-form form-horizontal');

        parent::__construct($controller, 'SchoolStrikeForm', $field_list, $actions);

        if ($this->registration instanceof SchoolStrikeRegistration)
        {
            $this->loadDataFrom($this->registration);
        }
    }

    public function ShowRequestUpdateForm()
    {
        return $this->is_restricted && !($this->registration instanceof SchoolStrikeRegistration);
    }

    public function getRegistration()
    {
        return $this->registration;
    }

    public function IsRestricted()
    {
        return $this->is_restricted;
    }

    public function CitiesCacheKey()
    {
        return implode('-',
            array(
                City::get()->count(),
                City::get()->sort('LastEdited DESC')->first()->LastEdited
            )
        );
    }
}