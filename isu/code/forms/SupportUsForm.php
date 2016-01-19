<?php

class SupportUsForm extends Form
{
    /**
     * @var Supporter
     */
    protected $supporter;

    /**
     * @var bool
     */
    protected $is_restricted;

    public function __construct($controller, $is_restricted = false, Supporter $supporter = null)
    {
        $this->setTemplate('SupportUsForm');

        $this->is_restricted = $is_restricted;

        $fields = array(
            (new TextField('Surname'))->addExtraClass('form-control'),
            (new TextField('LastName'))->addExtraClass('form-control'),
            (new TextField('Link'))->addExtraClass('form-control'),
        );
 

        if ($supporter instanceof Supporter)
        {
            $this->supporter = $supporter;

            $fields = array_merge($fields, array(
                new HiddenField('UpdateHash', $supporter->ID)
            ));
        }

        $field_list = new FieldList();

        foreach ($fields as $field)
        {
            $field_list->add($field);
        }

        $actions = new FieldList(
            (new FormAction('SupportUsForm', $this->is_restricted ? 'Uložiť zmeny' : 'Podporujem Vás'))->addExtraClass('btn btn-primary')
        );

        $this->addExtraClass('support-us-form form-horizontal');

        parent::__construct($controller, 'SupportUsForm', $field_list, $actions);

        if ($this->supporter instanceof Supporter)
        {
            $this->loadDataFrom($this->supporter);
        }
    }

    public function ShowRequestUpdateForm()
    {
        return $this->is_restricted && !($this->supporter instanceof Supporter);
    }

    public function getSupporter()
    {
        return $this->supporter;
    }

    public function supporter()
    {
        return $this->is_restricted;
    }

}