<?php

class ArticleFile extends File
{
    public function getIconName()
    {
        return $this->getExtension();
    }
}