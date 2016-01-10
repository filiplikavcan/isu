<div class="article-holder">
    <div class="container">
        <div class="row">
            <div class="col-sm-8">
                <h2>$Title</h2>
                <div class="date">$PublishDate.format('j. n. Y')</div>

                <div class="content">
                    $Content
                </div>

                <% if $RelatedArticles %>
                <div class="related">
                    <h3>Súvisiace články</h3>
                    <% include ArticlesList Articles=$RelatedArticles %>
                </div>
                <% end_if %>
            </div>
            <div class="col-sm-4">
                <% if $Files %>
                <div class="downloads">
                    <h3>Na stiahnutie</h3>
                    <ul class="articles-list">
                        <% loop $Files %>
                        <li>
                            <a href="$Link" class="icon-$Extension" target="_blank">
                                $Name
                                <span>$Size</span>
                            </a>
                        </li>
                        <% end_loop %>
                    </ul>
                </div>
                <% end_if %>
            </div>
        </div>
    </div>
</div>