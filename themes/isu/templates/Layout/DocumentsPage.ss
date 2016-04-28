<div class="documents-holder">
    <div class="container">
        <div class="row">

            <% loop $ArticleCategories %>

        	<div class="col-sm-6 document-category">
                        
                    <h3>$Title</h3>
                    <div class="description">
                        $Content
                    </div>

                    <ul class="articles-list">
                        <% loop Children %>
                        <li <% if $Pos > 5 %>class="hidden-link"<% end_if %>>
                            <a href="$Link">
                                $MenuTitle
                                <span>
                                    <% if $PublishDate %>
                                        $PublishDate.format('j. n. Y')
                                    <% end_if %>
                                </span>
                            </a>
                        </li>
                        <% end_loop %>
                    </ul>                

            </div>

            <% end_loop %>

        </div>
    </div>
</div>