<?php

class Supporter extends DataObject
{
    private static $db = array(
        'Name' => 'Varchar(1000)',
        'City' => 'Varchar(1000)',
        'Verified' => 'Boolean',
    );

    private static $summary_fields = array(
        'ID' => 'ID',
        'Name' => 'Meno',
        'City' => 'Mesto/Obec',
        'Verified' => 'Overené'
    );

    private static $default_sort = 'ID DESC';

    public function VerifiedHumanized()
    {
        return $this->Verified ? 'Áno' : 'Nie';
    }
}