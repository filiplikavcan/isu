<div class="deterrence-holder">
    <div class="main-banner">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="main-image">
                        <img src="$ThemeDir/images/no-deterrence.png">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            
            <div class="col-sm-12">

                <h2>$Title</h2>
                
                <div class="content">
                    $Content
                </div>
                
                <h5>Ako sa brániť?</h5>
                
                <% loop $DeterrenceCases.Sort(Sort) %>
                <h3 class="underline">$Sort. $Name</h3>
                <div class="row">
                    <div class="col-sm-4">
                        <% if $DeterrenceArgument %>
                        <h4>Argument zastrašovania</h4>
                        $DeterrenceArgument
                        <% end_if %>
                    </div>
                    <div class="col-sm-4">
                        <% if $StrikeArgument %>
                        <h4>Argument štrajkujúcich</h4>
                        $StrikeArgument
                        <% end_if %>
                    </div>
                    <div class="col-sm-4">
                        <% if $RealCase %>
                        <h4>Reálny prípad</h4>
                        $RealCase
                        <% end_if %>
                    </div>
                </div>
                <% end_loop %>

            </div>
        </div>
    </div>
    <% if $DeterrenceVideo %>
        <div class="headline-holder">
            <div class="container">
                <div class="col-xs-12 col-sm-10 col-sm-offset-1">
                    $DeterrenceVideo.RAW
                </div>
            </div>
        </div>
    <% end_if %>
</div>