<?php

class ActionGroup extends DataObject
{
    private static $db = array(
        'Title' => 'Varchar(1000)',
        'Description' => 'Text',
        'Sort' => 'Int',
    );

    private static $has_many = array(
        'Actions' => 'Action'
    );

    private static $summary_fields = array(
        'Title' => 'Title',
    );

    public function getCMSFields() {
        $fields = parent::getCMSFields();

        $fields->removeByName('Actions');

        return $fields;
    }

    public function getDates()
    {
        $result = array();

        if ($this->isInDB())
        {
            $actions = $this->Actions();
        }
        else
        {
            $actions = Action::get()->where('GroupID IS NULL OR GroupID = 0');
        }

        $actions = $actions
            ->where("Action.Date >= '" . date('Y-m-d') . "'")
            ->filter(array('Published' => true))
            ->Sort('Date, TimeFrom, Sort');

        foreach ($actions as $action)
        {
            if (empty($result[$action->Date]))
            {
                $result[$action->Date] = new ArrayData(array(
                    'Date' => $this->translateDate($action->obj('Date')->format('l j. F Y')),
                    'Actions' => new ArrayList()
                ));
            }

            $result[$action->Date]->getField('Actions')->add($action);
        }

        return new ArrayList($result);
    }

    public static function getOtherActionsGroup()
    {
        $group = new self;
        $group->Title = 'Ďalšie akcie';
        return $group;
    }

    protected function translateDate($date)
    {
        $translations = array(
            'January' => 'január',
            'February' => 'február',
            'March' => 'marec',
            'April' => 'apríl',
            'May' => 'máj',
            'June' => 'jún',
            'July' => 'júl',
            'August' => 'august',
            'September' => 'september',
            'October' => 'október',
            'November' => 'november',
            'December' => 'december',

            'Monday' => 'pondelok',
            'Tuesday' => 'utorok',
            'Wednesday' => 'streda',
            'Thursday' => 'štvrtok',
            'Friday' => 'piatok',
            'Saturday' => 'sobota',
            'Sunday' => 'nedeľa',
        );

        return str_replace(array_keys($translations), $translations, $date);
    }
}