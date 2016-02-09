<?php

class Homepage extends Page
{
    private static $db = array(
        'FeaturedButtonTitle' => 'Varchar(1000)',
        'InfotextTitle' => 'Varchar(1000)',
        'HeadlineContent' => 'Text',
    );

    private static $has_one = array(
        'FeaturedPage' => 'Page'
    );

    public function getCMSFields() {
        $fields = parent::getCMSFields();

        $fields->addFieldToTab('Root.Main', new TreeDropdownField('FeaturedPageID', 'Featured Page', 'Page'), 'Content');
        $fields->addFieldToTab('Root.Main', new TextField('FeaturedButtonTitle', 'Featured Button Title'), 'Content');
        $fields->addFieldToTab('Root.Main', new TextField('InfotextTitle', 'Infotext Title'), 'Content');
        $fields->addFieldToTab('Root.Main', new TextareaField('HeadlineContent', 'HeadlineContent'));
        $fields->renameField('Content', 'Infotext Content');

        return $fields;
    }

    public function getActionGroups()
    {
        $result = new ArrayList();
        $action_groups = ActionGroup::get()->innerJoin('Action', 'ActionGroup.ID = Action.GroupID')->where("Action.Date >= '" . date('Y-m-d') . "'");

        foreach ($action_groups as $action_group)
        {
            $result->add(new ArrayData(array(
                'Group' => $action_group,
                'Custom' => true,
            )));
        }

        $other_actions = Action::get()->where('GroupID IS NULL OR GroupID = 0');

        if ($other_actions->count() > 0)
        {
            $result->add(new ArrayData(array(
                'Group' => ActionGroup::getOtherActionsGroup(),
                'Custom' => false,
            )));
        }

        return $result;
    }
}

class Homepage_Controller extends Page_Controller
{
}
