<div class="faq-holder">
    <div class="container">
        <div class="row">
            <div class="col-sm-8">
                <h2>$Title</h2>

                <div class="content">
                    $Content
                </div>

                <% loop $Questions.Sort(Sort) %>
                    <h3>$Question</h3>
                    <div class="answer">
                        $Answer
                    </div>
                <% end_loop %>
            </div>
        </div>
    </div>
</div>