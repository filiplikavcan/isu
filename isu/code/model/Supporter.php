<?php

class Supporter extends DataObject
{
    private static $db = array(
        'Surname' => 'Varchar(100)',
        'LastName' => 'Varchar(100)',
        'Link' => 'Varchar(1000)',
    );

}