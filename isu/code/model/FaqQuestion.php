<?php

class FaqQuestion extends DataObject
{
    private static $db = array(
        'Question' => 'Varchar(1000)',
        'Answer' => 'HTMLText'
    );
}