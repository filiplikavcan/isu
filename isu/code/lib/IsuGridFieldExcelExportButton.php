<?php

class IsuGridFieldExcelExportButton extends GridFieldExcelExportButton
{
    protected $custom_fields = array();

    public function setCustomFields($custom_fields)
    {
        $this->custom_fields = $custom_fields;
    }

    /**
     * Action to export the GridField list to an Excel 2007 file.
     * @param  GridField $gridField
     * @param  SS_HTTPRequest    $request
     * @return string
     */
    public function handleXlsx(GridField $gridField, $request = null)
    {
        $items = $this->getItems($gridField);

        $this->setHeader($gridField, 'xlsx');

        $formater = new ExcelDataFormatter();

        if (!empty($this->custom_fields))
        {
            $formater->setCustomFields($this->custom_fields);
        }

        $fileData = $formater->convertDataObjectSet($items);

        return $fileData;
    }

    /**
     * Action to export the GridField list to an Excel 5 file.
     * @param  GridField $gridField
     * @param  SS_HTTPRequest    $request
     * @return string
     */
    public function handleXls(GridField $gridField, $request = null)
    {
        $items = $this->getItems($gridField);

        $this->setHeader($gridField, 'xls');

        $formater = new OldExcelDataFormatter();

        if (!empty($this->custom_fields))
        {
            $formater->setCustomFields($this->custom_fields);
        }

        $fileData = $formater->convertDataObjectSet($items);

        return $fileData;
    }

    /**
     * Action to export the GridField list to an CSV file.
     * @param  GridField $gridField
     * @param  SS_HTTPRequest    $request
     * @return string
     */
    public function handleCsv(GridField $gridField, $request = null)
    {
        $items = $this->getItems($gridField);

        $this->setHeader($gridField, 'csv');

        $formater = new CsvDataFormatter();

        if (!empty($this->custom_fields))
        {
            $formater->setCustomFields($this->custom_fields);
        }

        $fileData = $formater->convertDataObjectSet($items);

        return $fileData;
    }
}