<?php

class SupportedUsPage extends Page
{
	
	private static $allowed_actions = array(
        'SupportUsForm',
        'SendSupportUsForm',
		);
 
	
    public function getStatsByCity()
    {
        $c = DB::query('
            SELECT
                COUNT(*) AS SupportedUsCount
            FROM
                Supporter')->record();

        $result = array();
		$result["SupportedUsCount"] = $c["SupportedUsCount"];

        return new ArrayList($result);
    }
	 public function SupportUsCreateRegistrationForm()
    {
        return new SupportUsForm($this);
    }


}

class SupportedUsPage_Controller extends Page_Controller
{

}
