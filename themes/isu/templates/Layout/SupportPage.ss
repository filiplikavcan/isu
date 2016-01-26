<div class="support-holder">
    <% if $HasSupporterFormError || $HasSupporterFormMessage %>
        <div class="container">
            <div class="row">
                <div class="col-sm-12">

                    <% if $HasSupporterFormMessage %>
                    <h2>Ďakujeme za podporu</h2>

                    <div class="alert alert-success">
                        $SupporterFormFlash
                    </div>
                    <% end_if %>

                    <% if $HasSupporterFormError %>
                    <h2>Podpis nebol pridaný</h2>

                    <div class="alert alert-danger">
                        $SupporterFormFlash
                    </div>

                    $SupporterForm
                    <% end_if %>
                </div>
            </div>
        </div>
    <% else %>
        <div class="container">
            <div class="row">
                <div class="col-sm-7 col-md-8 col-lg-9">
                    <h2>$Title</h2>

                    <div class="row">
                    <% loop SupportVideos %>
                            <% if First %>
                                <span class="anchor" id="video"></span>
                                <div class="col-xs-12 main-video">
                                    <% include Video %>
                                </div>
                            <% else %>
                                <div class="col-xs-6 col-md-4">
                                    <% include Video %>
                                </div>

                                <% if MultipleOf(3,3) %>
                                    <div class="clearfix visible-lg visible-md"></div>
                                <% end_if %>

                                <% if MultipleOf(2,2) %>
                                    <div class="clearfix hidden-lg hidden-md"></div>
                                <% end_if %>
                            <% end_if %>
                    <% end_loop %>
                    </div>
                </div>
                <div class="col-sm-5 col-md-4 col-lg-3">

                    $SupporterForm

                    <div class="sidebar-holder" style="background-color: #efefef;">
                        $SideBarInfo
                    </div>
                </div>
            </div>
        </div>
        <div class="support-organizations-holder">
            <div class="container">
                <div class="row">
                    <div class="col-sm-10 col-sm-offset-1">
                        <h2>
                            Jednotlivci a organizácie
                        </h2>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-5 col-sm-offset-1">
                        $Content
                    </div>
                    <div class="col-sm-5">
                        $ContentRight
                    </div>
                </div>
            </div>
        </div>

        <div class="support-people-holder">
            <div class="container">
                <div class="row">
                    <div class="col-sm-10 col-sm-offset-1">
                        <span class="anchor" id="podporovatelia"></span>
                        <h2>
                            Osobne nás podporili
                        </h2>

                        <p style="margin-bottom: 20px;">
                            Odoslaním podpisu cez formulár podporilo Iniciatívu slovenských učiteľov <strong>$PeopleCount</strong> ľudí:
                        </p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-5 col-sm-offset-1">
                        <ol start="$FirstColumnStart">
                            <% loop $PeopleFirstColumn %>
                                <li>
                                    $Name, $City
                                </li>
                            <% end_loop %>
                        </ol>
                    </div>
                    <div class="col-sm-5">
                        <ol start="$SecondColumnStart">
                            <% loop $PeopleSecondColumn %>
                            <li>
                                $Name, $City
                            </li>
                            <% end_loop %>
                        </ol>
                    </div>

                    <div class="col-sm-12 col-sm-offset-1">
                        <div class="supporters-paginator">
                            <% loop $Pages %>
                                <a href="$Link"<% if $Active %> class="active"<% end_if %>>$Page</a>
                            <% end_loop %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    <% end_if %>
</div>

<script type="text/javascript">
    APP.init('SupportVideos');
</script>