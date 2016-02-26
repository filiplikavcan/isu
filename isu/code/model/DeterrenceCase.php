<?php

class DeterrenceCase extends DataObject
{
    private static $db = array(
        'Name' => 'Varchar(1000)',
        'DeterrenceArgument' => 'HTMLText',
        'StrikeArgument' => 'HTMLText',
        'RealCase' => 'HTMLText',
        'Sort' => 'Int'
    );
    
    private static $has_one = array(
        'Page' => 'SiteTree',
    );

    private static $summary_fields = array(
        'ID' => 'ID',
        'Name' => 'Názov'
    );
}