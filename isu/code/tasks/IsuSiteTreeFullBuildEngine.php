<?php
/**
 * @package staticpublisher
 */ 
class IsuSiteTreeFullBuildEngine extends SiteTreeFullBuildEngine {

	private static $quiet = false;

	public function run($request) {
		$this->deduplicateQueue();

		increase_time_limit_to();
		$this->runFrom(0);

		$this->getUrlArrayObject()->addUrls(array('/'));

		$this->deduplicateQueue();
	}

	protected function deduplicateQueue()
	{
		DB::query("
			DELETE
				q2
			FROM
				StaticPagesQueue AS q1
			INNER JOIN
				StaticPagesQueue AS q2
			ON
				q1.UrlSegment = q2.UrlSegment
			WHERE
				q1.ID < q2.ID");
	}
}
