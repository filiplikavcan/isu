<?php

class University extends DataObject
{
    private static $db = array(
        'Name' => 'Varchar(1000)',
    );

    private static $summary_fields = array(
        'Name' => 'Name',
    );
}