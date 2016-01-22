<div class="article-category-holder $HolderClass">
    <div class="container">
        <div class="row">
            <% if $Image %>
                <div class="col-sm-12">
                    <div class="main-image">
                        <img src="$Image.Link">
                    </div>
                </div>
            <% end_if %>

            <div class="col-sm-12">

                <h2>$Title</h2>
                <div class="date">$PublishDate.format('j. n. Y')</div>

                <div class="content">
                    $Content
                </div>

                <ul>
                    <% loop Children %>
                        <li>
                            <a href="$Link"><% if $PublishDate %>$PublishDate.format('j. n. Y'): <% end_if %>$Title</a>
                        </li>
                    <% end_loop %>
                </ul>
            </div>
        </div>
    </div>
</div>