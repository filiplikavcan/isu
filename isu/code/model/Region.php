<?php

class Region extends DataObject
{
    private static $db = array(
        'Title' => 'Varchar(1000)',
        'Link' => 'Varchar(1000)',
        'Shortcut' => 'Varchar(1000)',
        'Email' => 'Varchar(1000)'
    );
}