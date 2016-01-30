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
    private static $allowed_actions = array(
        'SchoolStrikeForm',
        'SendSchoolStrikeForm',
        'edit',
        'back'
    );

    /**
     * @var SchoolStrikeRegistration
     */
    protected $registration;

    public function init()
    {
        parent::init();

        if ($this->urlParams['Action'] == 'edit')
        {
            $update_hash = $this->request->getVar('h');

            if (!empty($update_hash))
            {
                $this->registration = SchoolStrikeRegistration::get()->filter(array('UpdateHash' => $update_hash))->last();

                if (!$this->registration instanceof SchoolStrikeRegistration)
                {
                    Session::set('FlashError',
                        $this->renderWith(array('FlashErrorRegistrationUpdateHashInvalid'))
                    );

                    $this->redirect($this->Link('edit'));
                }
            }
        }
    }

    public function back()
    {
        $this->redirect(BASE_URL);
    }

    public function SchoolStrikeCreateRegistrationForm()
    {
        return new SchoolStrikeForm($this);
    }

    public function SchoolStrikeUpdateRegistrationForm()
    {
        return new SchoolStrikeForm($this, true, $this->registration);
    }

    public function getUpdateHash()
    {
        return $this->request->getVar('hash');
    }
}
