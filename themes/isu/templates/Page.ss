<!DOCTYPE html>
<html lang="$ContentLocale">
<head>
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
    <script>
        (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
                    (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
                m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
        })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

        ga('create', 'UA-72222793-1', 'auto');
        ga('send', 'pageview');

    </script>
    <% include Header %>
    <% if IsFlashMessage || IsFlashError %>
        <div class="flash-message-holder">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
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
                </div>
            </div>
        </div>
        </div>
    <% else %>
        $Form
        $Layout
    <% end_if %>

    <% include Footer %>
</body>
</html>
