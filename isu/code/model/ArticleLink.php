<?php

class ArticleLink extends DataObject
{
    private static $db = array(
        'Name' => 'Varchar',
        'Link' => 'Varchar',
    );

    private static $has_one = array(
        'ArticlePage' => 'ArticlePage'
    );
}