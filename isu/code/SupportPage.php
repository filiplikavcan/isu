<?php

class SupportPage extends ArticlePage
{
    private static $db = array(
        'SideBarInfo' => 'HTMLText',
        'ContentRight' => 'HTMLText',
    );

    private static $has_many = array(
        'SupportVideos' => 'SupportVideo'
    );

    public function getCMSFields() {
        $fields = parent::getCMSFields();

        $fields->addFieldToTab('Root.Main', new HtmlEditorField('SideBarInfo', 'SideBarInfo'), 'Content');
        $fields->addFieldToTab('Root.Main', new HtmlEditorField('ContentRight', 'Jednotlivci a organizácie vpravo'), 'Content');
        $fields->renameField('Content', 'Jednotlivci a organizácie vľavo');

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

        $gridField = new GridField("Videos", "Videos", $this->SupportVideos(), $gridFieldConfig);
        $fields->addFieldToTab("Root.Videá", $gridField);

        return $fields;
    }
}

class SupportPage_Controller extends ArticlePage_Controller
{
    private static $allowed_actions = array(
        'SupporterForm',
        'flash'
    );

    protected static $supporters_per_column = 200;

    public function init()
    {
        parent::init();

        if ($this->urlParams['Action'] == 'flash')
        {
            if (!$this->HasSupporterFormError() && !$this->HasSupporterFormMessage())
            {
                Session::clear("FormInfo.Form_SupporterForm.data");
                $this->redirect($this->Link());
            }
        }
    }

    public function getPeopleFirstColumn()
    {
        return $this->getPeopleColumn(1);
    }

    public function getPeopleSecondColumn()
    {
        return $this->getPeopleColumn(2);
    }

    public function getFirstColumnStart()
    {
        return $this->getColumnStart(1) + 1;
    }

    public function getSecondColumnStart()
    {
        return $this->getColumnStart(2) + 1;
    }

    public function getPeopleCount()
    {
        return Supporter::get()->filter(array('Verified' => true))->count();
    }

    public function getPages()
    {
        $page = isset($this->requestParams['p']) ? $this->requestParams['p'] : 1;

        $count = $this->getPeopleCount();

        $nr_of_pages = ceil($count / (self::$supporters_per_column * 2));

        $result = new ArrayList();

        for ($f = 1; $f <= $nr_of_pages; $f++)
        {
            $result->add(new ArrayData(array(
                'Page' => $f,
                'Link' => $this->Link('?p=' . $f . '#podporovatelia'),
                'Active' => $f == $page,
            )));
        }

        return $result;
    }

    public function getColumnStart($column)
    {
        $page = isset($this->requestParams['p']) ? $this->requestParams['p'] : 1;
        return ((($page - 1) * 2) + ($column - 1)) * self::$supporters_per_column;
    }

    protected function getPeopleColumn($column)
    {
        return Supporter::get()->filter(array('Verified' => true))->sort('ID DESC')->limit(self::$supporters_per_column, $this->getColumnStart($column));
    }

    public function HasSupporterFormError()
    {
        $result = Session::get('SupporterFormFlash');
        return !empty($result) and $result[0] == 'error';
    }

    public function HasSupporterFormMessage()
    {
        $result = Session::get('SupporterFormFlash');
        return !empty($result) and $result[0] == 'message';
    }

    public function SupporterFormFlash()
    {
        $result = Session::get('SupporterFormFlash');
        Session::clear('SupporterFormFlash');
        return $result[1];
    }

    public function SupporterForm()
    {
        return new SupporterForm($this);
    }

    public function doSubmit($data, Form $form) {

        if (empty($data['Name']) || empty($data['City']) || empty($data['Email']) || empty($data['PersonType']))
        {
            Session::set('SupporterFormFlash', array('error', 'Zadajte, prosím, meno, priezvisko, mesto/obec, email a kto ste.'));
            Session::set("FormInfo.Form_SupporterForm.data", $data);
        }
        else
        {
            Session::set('SupporterFormFlash', array('message', 'Váš podpis bol uložený a po kontrole bude zverejnený v zozname podporovateľov.'));

            $supporter = Supporter::get()->filter(array('Email' => $data['Email']))->first();

            if (!($supporter instanceof Supporter))
            {
                $supporter = new Supporter;

                $supporter->Name = $data['Name'];
                $supporter->City = $data['City'];
                $supporter->Email = $data['Email'];
            }

            $supporter->Type = $data['PersonType'];

            $supporter->write();
        }

        return $this->redirect($this->Link('flash'));
    }
}
