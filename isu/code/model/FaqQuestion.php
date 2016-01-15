<?php

class FaqQuestion extends DataObject
{
    private static $db = array(
        'Question' => 'Text',
        'Answer' => 'HTMLText',
        'Sort' => 'Int',
    );

    private static $summary_fields = array(
        'Question' => 'Question'
    );
}