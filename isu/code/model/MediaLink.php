<?php

class MediaLink extends DataObject
{
    private static $db = array(
        'Link' => 'Varchar(1000)',
        'Title' => 'Varchar(1000)',
        'Medium' => 'Varchar(1000)'
    );
}