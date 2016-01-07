<!DOCTYPE html>
<html lang="$ContentLocale">
<head>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,700italic,300,400,600,700&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
    <% base_tag %>
    <title><% if $MetaTitle %>$MetaTitle<% else %>$Title<% end_if %> &raquo; $SiteConfig.Title</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    $MetaTags(false)

    <!--[if lt IE 9]>
    <script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
</head>
<body>
    $Form
    $Layout
</body>
</html>
