 <div class="row">
    <div class="col-sm-12">
        <h2>$Title</h2>
        <div>$PublishDate</div>
        $Content

        <% if File %>
        <div style="text-align: center;">
            <a href="$File.Link" target="_blank" class="btn btn-primary btn-lg">dokument na stiahnutie/tlač</a>
        </div>
        <% end_if %>

        <% if $RelatedArticles %>
            <h3>Súvisiace</h3>
            <ul>
            <% loop $RelatedArticles %>
                <li><a href="$Link">$Title</a></li>
            <% end_loop %>
            </ul>
        <% end_if %>
    </div>
</div>