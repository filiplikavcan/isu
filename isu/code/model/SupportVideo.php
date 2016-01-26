<?php

class SupportVideo extends DataObject
{
    private static $db = array(
        'Name' => 'Varchar(1000)',
        'Description' => 'Varchar(1000)',
        'Link' => 'Varchar(1000)',
        'Code' => 'Text',
        'Sort' => 'Int',
    );

    private static $has_one = array(
        'Image' => 'Image',
        'Page' => 'SiteTree',
    );

    private static $summary_fields = array(
        'ID' => 'ID',
        'Name' => 'Meno',
    );
}