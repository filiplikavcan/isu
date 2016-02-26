<div class="deterrence-holder">
    <% if $Image %>
        <div class="main-banner">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="main-image">
                            <img src="$Image.Link">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    <% end_if %>
    <div class="container">
        <div class="row">
            
            <div class="col-sm-12">

                <h2>$Title</h2>
                
                <div class="content">
                    $Content
                </div>
                
                <% loop $DeterrenceCases.Sort(Sort) %>
                <h3 class="underline">$Sort. $Name</h3>
                <div class="row">
                    <div class="col-sm-4">
                        <h4>Argument zastrašovania</h4>
                        $DeterrenceArgument
                    </div>
                    <div class="col-sm-4">
                        <h4>Argument štrajkujúcich</h4>
                        $StrikeArgument
                    </div>
                    <div class="col-sm-4">
                        <h4>Reálny prípad</h4>
                        $RealCase
                    </div>
                </div>
                <% end_loop %>

            </div>
        </div>
    </div>
</div>