<ul class="articles-list">
    <% loop $Articles %>
    <li>
        <a href="$Link" class="icon-$IconName">
            $Title
            <span><% if $FileSize %>$FileSize<% end_if %></span>
        </a>
    </li>
    <% end_loop %>
</ul>