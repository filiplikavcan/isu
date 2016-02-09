var App = function(inits) {
    if (inits)
    {
        var that = this;

        $.each(inits, function(i, name) {
            that.init(name);
        });
    }
};

App.prototype = {
    init: function(name)
    {
        this['init' + name]();
    },

    initSchoolStrikeForm: function()
    {
        var form = new SchoolStrikeForm();
        form.init();
    },

    initUniversityStrikeForm: function()
    {
        var form = new UniversityStrikeForm();
        form.init();
    },

    initSupportVideos: function()
    {
        var that = this;

        $('.support-holder').on('click', '.video-image', function(){

            $('.support-holder .main-video .video-image').html('').removeClass('hide-image');

            var main_video = $('.support-holder .main-video .video');
            var main_video_html = main_video.html();
            var this_video = $(this).closest('.video');

            main_video.html(this_video.html());
            this_video.html(main_video_html);

            $('.support-holder .main-video .video-image').html($(this).data('embed-code')).addClass('hide-image');

            that.initVideos();
            that.smoothScroll($('#video'));
        });
    },

    smoothScroll: function(target)
    {
        if (target.length) {
            $('html,body').animate({
                scrollTop: target.offset().top
            }, 250);
            return false;
        }
    },

    initMediaLinks: function()
    {
        $('.show-more-links').click(function(e) {
            e.preventDefault();

            $(this).parent().find('.hidden-link').show();
            $(this).hide();
        });
    },

    initVideos: function()
    {
        // Find all YouTube videos
        var $allVideos = $("iframe[src^='https://www.youtube.com']");

        // Figure out and save aspect ratio for each video
        $allVideos.each(function ()
        {
            $(this)
                .data('aspectRatio', this.height / this.width)
                // and remove the hard coded width/height
                .removeAttr('height')
                .removeAttr('width');

            var newWidth = $(this).closest('div').width();

            var $el = $(this);

            $el
                .width(newWidth)
                .height(newWidth * $el.data('aspectRatio'));
        });

        $(window).resize(function(){
            // Resize all videos according to their own aspect ratio
            $allVideos.each(function ()
            {
                var newWidth = $(this).closest('div').width();

                var $el = $(this);

                $el
                    .width(newWidth)
                    .height(newWidth * $el.data('aspectRatio'));

            });
        });
    },

    initNewsletterForm: function()
    {
        var form = $('.newsletter-form');
        form.find('.form-group').prepend(
            '<div class="alert alert-danger form-error-message" style="display: none;">' +
                'Prosím, vyplňte Vašu emailovú adresu.' +
            '</div>');

        form.
            on('submit', function(e) {
                e.preventDefault();

                var email = form.find('[name=Email]');

                if (email.val() == '')
                {
                    email.closest('.form-group').addClass('has-error');
                    form.find('.form-error-message').show();
                }
                else
                {
                    email.closest('.form-group').removeClass('has-error');
                    form.find('.form-error-message').hide();

                    form.addClass('form-submitting');
                    form.find('input[type=submit]').val('Čakajte. Odosiela sa...');
                    form.find('input, select, textarea').prop('disabled', true);

                    $.getJSON('/data/addToNewsletter', { email: email.val() }, function(response) {
                        if (response.code == 'success')
                        {
                            window.location = '/home/message';
                        }
                        else
                        {
                            form.removeClass('form-submitting');
                            form.find('input[type=submit]').val('Odoslať');
                            form.find('input, select, textarea').prop('disabled', false);

                            alert('Emailová adresa je pravdepodobne chybná a NEBOLA zaregistrovaná. Skontrolujte ju a skúste ju odoslať znovu.');
                        }
                    });
                }
            });
    },

    initStrikeMap: function()
    {
        var myLatLng = {lat: -25.363, lng: 131.044};

        var map = new google.maps.Map(document.getElementById('strike-map'), {
            zoom: 4,
            scrollwheel: false,
            center: myLatLng
        });

        var bounds = new google.maps.LatLngBounds();

        var active_infowindow = null;

        var school_markers_count = SCHOOL_MARKERS.length;
        var duration = 5000;

        var batch_size = Math.round(school_markers_count / duration);

        $.each(SCHOOL_MARKERS, function(i, school_marker) {

            if (school_marker.lat && school_marker.lng)
            {
                var marker = new google.maps.Marker({
                    position: {
                        lat: parseFloat(school_marker.lat),
                        lng: parseFloat(school_marker.lng)
                    },
                    map: map,
                    title: school_marker.name
                });

                var infowindow = new google.maps.InfoWindow({
                    content: '<strong>' + school_marker.name + '</strong><br>' + school_marker.address
                });

                marker.addListener('click', function() {
                    if (active_infowindow)
                    {
                        active_infowindow.close();
                    }

                    infowindow.open(map, marker);
                    active_infowindow = infowindow;
                });

                bounds.extend(marker.getPosition());
            }
        });

        map.fitBounds(bounds);
    }
};

var APP = {
    inits: [],
    init: function(name)
    {
        APP.inits.push(name);
    }
};

APP.init('NewsletterForm');
APP.init('Videos');
APP.init('MediaLinks');

//// calculate zoom based on the width of map div
//function calculate_zoom() {
//    var w = $('#map').width();
//    z = 5 + w/310;
//    return z;
//}
//
//// set height of the map (and textarea input) as half of its width
//function resize_map() {
//    var w = $('#map').width();
//    $('#map').css('height', 0.5*w + 'px');
//    $('#vase-zelanie .area-input').css('height', 0.3*w + 'px');
//}
//
//$( window ).resize(function() {
//    map.setZoom(calculate_zoom());
//    resize_map();
//});
//
//var map;
//
$(document).ready(function(){
    APP = new App(APP.inits);

//    // leaflet map
//    resize_map();
//    map = L.map('map', {
//        center: [48.690833, 19.667222],
//        zoom: calculate_zoom(),
//        zoomControl: false,
//        attributionControl: false,
//        dragging: false,
//        touchZoom: false,
//        scrollWheelZoom: false,
//        doubleClickZoom: false,
//        boxZoom: false,
//        tap: false,
////      trackResize: false,
////      keyboard: false
//    });
//
//    // draw country border
//    L.geoJson([border], {
//        style: function (feature) {
//            return feature.properties && feature.properties.style;
//        },
//    }).addTo(map);
//
//    var heat_points = [];
//
//    towns.forEach( function addToMap(town) {
//        heat_points.push([
//            town.lat,
//            town.lng,
//            0.5
//        ]);
//        var circle = L.circle([town.lat, town.lng], 2000, {
//            color: 'transparent',
//            fillColor: '#d96459',
//            fillOpacity: 0.4
//        }).addTo(map);
//        circle.bindPopup(town.name + ': ' + town.value, { autoPan: false });
//    });
//
//    var heat = L.heatLayer(heat_points, {minOpacity: 0.3, radius: 10, blur: 10, gradient: {0.2: 'blue', 0.41: 'lime', 0.5: 'red'}}).addTo(map);
});

