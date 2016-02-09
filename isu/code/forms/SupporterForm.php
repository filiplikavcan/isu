<?php

class SupporterForm extends Form
{
    /**
     * @var SchoolStrikeRegistration
     */
    protected $registration;

    /**
     * @var bool
     */
    protected $is_restricted;

    public function __construct($controller)
    {
        $fields = new FieldList(
            TextField::create('Name', 'Meno a priezvisko'),
            TextField::create('City', 'Obec/Mesto'),
            TextField::create('Email', 'Email'),
            OptionsetField::create('PersonType', 'Som', array(
                'parent' => 'rodič',
                'other' => 'podporovateľ'
            ), 'parent')
        );

        $actions = new FieldList(
            FormAction::create("doSubmit")->setTitle("Odoslať")
        );

        parent::__construct($controller, 'SupporterForm', $fields, $actions);

        $this->setAttribute('novalidate', true);
        $this->setTemplate(array('SupporterForm'));
        $this->disableSecurityToken();

        $data = Session::get("FormInfo.Form_SupporterForm.data");

        if (is_array($data))
        {
            $this->loadDataFrom($data);
            Session::clear("FormInfo.Form_SupporterForm.data");
        }
    }
}