<div class="actions-holder">
    <div class="container">
        <div class="row">

        	<div class="col-sm-12 document-category">
                <h2>Médiá</h2>

                <ul class="articles-list articles-list--links">
                    <% loop $MediaLinks.Sort(Date, Desc) %>
                    <li>
                        <a href="$Link" class="external-link">
                            $Title
                            <span>
                                $Date.format('j. n. Y')<% if $Date && $Medium %>, <% end_if %>$Medium
                            </span>
                        </a>
                    </li>
                    <% end_loop %>
                </ul>
                
                <!--a href="/media">Zobraziť viac</a-->
            </div>

        </div>
    </div>
</div>