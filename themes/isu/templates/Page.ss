<!DOCTYPE html>
<html lang="$ContentLocale">
<head>
    <% base_tag %>
    <meta charset="utf-8">

    <title><% if $MetaTitle %>$MetaTitle<% else %>$Title<% end_if %> &raquo; $SiteConfig.Title</title>

    <meta property="og:url" content="http://isu.sk/"/>
    <meta property="og:title" content="Iniciatíva slovenských učiteľov"/>
    <meta property="og:image" content="http://isu.sk/themes/isu/images/isu-fb.png"/>
    <meta property="og:description" content="Iniciatíva slovenských učiteľov je neformálne hnutie, ktoré vzniklo spojením lokálnych učiteľských iniciatív z celého Slovenska."/>
    <meta property="og:type" content="website"/>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    $MetaTags(false)

    <!--[if lt IE 9]>
    <script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <link rel="icon" type="image/png" href="/favicon.png" />
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

    <div id="fb-root"></div>
    <script>(function(d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s); js.id = id;
        js.src = "//connect.facebook.net/sk_SK/sdk.js#xfbml=1&version=v2.5";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));</script>

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
        <% if $Form %>
            <div style="margin-top: 100px;">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12">
                            $Layout
                            $Form
                        </div>
                    </div>
                </div>
            </div>
        <% else %>
            $Layout
        <% end_if %>
    <% end_if %>

    <% include Footer %>
</body>
</html>
