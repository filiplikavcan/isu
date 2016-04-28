<div class="actions-holder">
    <div class="container">
        <div class="row">

            <% loop $Video(100) %>

            <% if $First %>

            <div class="col-sm-12">
                <h2>Videá</h2>
       
                <strong>$snippet.title</strong>
                <iframe width="280" height="158" src="https://www.youtube.com/embed/$id.videoId?rel=0&amp;showinfo=0" frameborder="0" allowfullscreen></iframe>

            </div>

        </div>

        <div class="row">
                    
            <% else %>
                    
        	<div class="col-sm-4 video-cell">
       
                <strong>$snippet.title</strong>
                <iframe width="280" height="158" src="https://www.youtube.com/embed/$id.videoId?rel=0&amp;showinfo=0" frameborder="0" allowfullscreen></iframe>

            </div>

            <% end_if %>

            <% end_loop %>

        </div>
    </div>
</div>