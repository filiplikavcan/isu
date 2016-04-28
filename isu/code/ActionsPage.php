<?php

class ActionsPage extends Page
{
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

        /**$other_actions = Action::get()->where('GroupID IS NULL OR GroupID = 0');

        if ($other_actions->count() > 0)
        {
            $result->add(new ArrayData(array(
                'Group' => ActionGroup::getOtherActionsGroup(),
                'Custom' => false,
            )));
        }*/

        return $result;
    }
    
    public function getOtherActionGroups()
    {
        $result = new ArrayList();
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

    public function getOldActionGroups()
    {
        $result = new ArrayList();
        $other_actions = Action::get();

        if ($other_actions->count() > 0)
        {
            $result->add(new ArrayData(array(
                'Group' => ActionGroup::getOldActionsGroup(),
                'Custom' => false,
            )));
        }

        return $result;
    }
}

class ActionsPage_Controller extends Page_Controller
{

}
