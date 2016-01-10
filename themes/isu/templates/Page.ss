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
    <% include Header %>
    <% if IsFlashMessage || IsFlashError %>
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
    <% else %>
        $Form
        $Layout
    <% end_if %>

    <% include Footer %>
</body>
</html>
