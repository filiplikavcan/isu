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
    <div class="container">
        <% if IsFlashMessage || IsFlashError %>
            <% if IsFlashMessage %>
                <div class="alert alert-success">
                    $FlashMessage
                </div>
            <% end_if %>

            <% if IsFlashError %>
                <div class="alert alert-danger">
                    $FlashError
                </div>
            <% end_if %>
        <% else %>
            $Form
            $Layout
        <% end_if %>

        <div class="row">
            <div class="col-sm-12">
                <h2>Regionálne iniciatívy</h2>
                <ul>
                    <li>
                        <a href="http://ibu7.webnode.sk/" target="_blank">IBU - Iniciatíva bratislavských učiteľov</a>
                    </li>
                    <li>
                        <a href="http://izu4.webnode.sk/" target="_blank">IZU - Iniciatíva žilinských učiteľov</a>
                    </li>
                    <li>
                        <a href="http://www.velkaprestavka.sk/" target="_blank">Veľká prestávka - iniciatíva považskobystrických učiteľov</a>
                    </li>
                    <li>
                        <a href="http://ibbu1.webnode.sk/" target="_blank">IBBU - Iniciatíva banskobystrických učiteľov</a>
                    </li>
                    <li>
                        <a href="http://itu3.webnode.sk/" target="_blank">ITU - Iniciatíva trnavských učiteľov</a>
                    </li>
                    <li>
                        <a href="https://www.facebook.com/groups/975617185831007/" target="_blank">ILU - Iniciatíva levických učiteľov</a>
                    </li>
                    <li>
                        <a href="https://www.facebook.com/Iniciat%C3%ADva-nitrianskych-u%C4%8Dite%C4%BEov-1655038091427960/" target="_blank">INU - Iniciatíva nitrianskych učiteľov</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</body>
</html>
