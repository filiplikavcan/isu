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
                            window.location = '/';
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
});

var SchoolStrikeForm = function() {
    this.form_holder = $('.school-strike-form');
    this.city_select = null;
    this.cities_by_regions = {};

    this.choose_city = true;
    this.choose_school = false;

    this.schools_by_city = {};

    this.is_new = this.form_holder.find('[name=UpdateHash]').length == 0;

    this.data = {
        UpdateHash: null,
        EmployeesCount: null,
        JoinedEmployeesCount: null,
        SchoolClosed: 'maybe',
        ContactName: '',
        ContactSurname: '',
        ContactPosition: '',
        ContactEmail: '',
        ContactPhone: '',
        Note: ''
    };

    this.required = [
        ['EmployeesCount'],
        ['JoinedEmployeesCount'],
        ['ContactName'],
        ['ContactSurname'],
        ['ContactPosition'],
        ['ContactEmail']
    ];

    if (this.is_new)
    {
        $.extend(this.data, {
            City: null,
            CityRaw: '',
            CityLat: null,
            CityLng: null,
            Region: null,
            School: null,
            SchoolRaw: '',
            SchoolStreet: ''
        });

        $.merge(this.required, [
            ['City', 'CityRaw'],
            ['School', 'SchoolRaw'],
            ['SchoolStreet']
        ]);
    }
};

SchoolStrikeForm.prototype = {
    init: function() {
        var that = this;

        $('.school-strike-form select[name=SchoolClosed]').select2({
            minimumResultsForSearch: Infinity
        });

        if (this.is_new)
        {
            this.initCityData();

            this.city_select = $('.school-strike-form select[name=City]').select2();

            this.city_select.on("select2:select", function() {
                that.choose_school = true;
                that.form_holder.find('[name=SchoolStreet]').val('');
                that.render();
            });
        }

        this.initEvents();
        this.render();
    },

    render: function(invalid_fields)
    {
        var that = this;

        if (this.is_new)
        {
            var previous_city = this.data.City;
        }

        this.storeForm();

        if (this.is_new)
        {
            if (this.choose_city)
            {
                this.form_holder.find('.choose-city').show();
                this.form_holder.find('.add-city').hide();

                if (this.data.City)
                {
                    this.form_holder.find('.add-school-toggle').show();
                }
            }
            else
            {
                this.form_holder.find('.choose-city').hide();
                this.form_holder.find('.add-city').show();

                var region_select = $('.school-strike-form select[name=Region]');

                if (region_select.data('select2'))
                {
                    region_select.select2('destroy');
                }

                region_select.select2({
                    minimumResultsForSearch: Infinity
                });
            }

            if (this.choose_school)
            {
                this.form_holder.find('.choose-school').show();
                this.form_holder.find('.add-school').hide();

                if (previous_city != this.data.City)
                {
                    this.updateSchoolSelect();
                }
            }
            else
            {
                this.form_holder.find('.choose-school').hide();
                this.form_holder.find('.add-school').show();
            }
        }

        this.form_holder.find('.form-error-message').hide();
        this.form_holder.find('.has-error').removeClass('has-error');

        if (invalid_fields)
        {
            this.form_holder.find('.form-error-message').show();

            $.each(invalid_fields, function(i, fields) {
                $.each(fields, function(j, field) {
                    that.form_holder.find('[name=' + field + ']').closest('.form-group').addClass('has-error');
                })
            });
        }
    },

    updateSchoolSelect: function()
    {
        var that = this;

        if (typeof this.schools_by_city[this.data.City] == 'undefined')
        {
            $.getJSON('/data/schoolsByCity', { city_id: this.data.City }, function(response) {
                that.schools_by_city[response.city_id] = response.schools;
                that.updateSchoolSelect();
            });
        }
        else
        {
            var school_select = $('.school-strike-form select[name=School]');

            if (school_select.data('select2'))
            {
                school_select.select2('destroy');
            }

            var school_addresses = {};

            school_select.html('<option value="">---</option>');
            $.each(this.schools_by_city[this.data.City], function(i, school) {
                school_addresses[school.id ] = school.street;
                school_select.append('<option value="' + school.id + '">' + school.name + '</option>');
            });

            school_select.select2()
                .on("select2:select", function(e) {
                    that.form_holder.find('[name=SchoolStreet]').val(school_addresses[e.params.data.id]);
                });
        }
    },

    storeForm: function()
    {
        var that = this;

        $.each(this.data, function(key, value) {
            that.data[key] = that.form_holder.find('[name=' + key + ']').val();
        });
    },

    initEvents: function()
    {
        var that = this;

        $('.request-update-form')
            .on('submit', function(e){
                e.preventDefault();
                that.requestUpdateEmail();
            });

        this.form_holder
            .on('click', '.toggle', function(e) {
                e.preventDefault();

                var toggle = $(this).data('toggle');

                var was_choose_city = that.choose_city;

                that[toggle] = !that[toggle];

                if (!that.choose_city)
                {
                    that.city_select.val(null).trigger("change");
                    that.form_holder.find('.add-school-toggle').hide();
                    that.choose_school = false;

                    if (was_choose_city)
                    {
                        that.form_holder.find('[name=CityRaw]').val('');
                    }
                }

                that.form_holder.find('[name=SchoolStreet]').val('');
                that.form_holder.find('[name=SchoolRaw]').val('');

                that.render();
            })
            .on('submit', function(e) {
                e.preventDefault();

                that.storeForm();

                var invalid_fields = that.validateData();

                if (invalid_fields.length == 0)
                {
                    that.setFormAsSubmitting(that.form_holder);

                    //that.data.CityLat = null;
                    //that.data.CityLng = null;
                    //
                    //var city;
                    //
                    //if (that.choose_city)
                    //{
                    //    city = that.form_holder.find('[name=City] option[value=' + that.data.City + ']').text();
                    //}
                    //else
                    //{
                    //    city = that.data.CityRaw;
                    //}

                      that.submitData();

                    //that.geocodeCity(city, function(lat, lng) {
                    //    that.data.CityLat = lat;
                    //    that.data.CityLng = lng;
                    //});
                }
                else
                {
                    if (that.is_new)
                    {
                        window.location = '#registracia';
                    }
                    else
                    {
                        $(window).scrollTop(0);
                    }

                    that.render(invalid_fields);
                }
            });
    },

    submitData: function()
    {
        $.post('/data/submit', { data: this.data }, function(response) {
            window.location = '/';
        });
    },

    setFormAsSubmitting: function(form)
    {
        form.addClass('form-submitting');

        form.find('.toggle').remove();
        form.find('input[type=submit]').val('Čakajte. Odosiela sa...');
        form.find('input, select, textarea').prop('disabled', true);
    },

    requestUpdateEmail: function()
    {
        var form = $('.request-update-form');

        this.setFormAsSubmitting(form);

        $.post('/data/requestUpdate', { email: form.find('[name=Email]').val() }, function() {
            window.location = '/';
        });
    },

    validateData: function()
    {
        var that = this;
        var invalid_fields = [];

        $.each(this.required, function(i, fields) {
            var valid = false;

            $.each(fields, function(j, field) {
                if (that.data[field])
                {
                    valid |= true;
                }
            });

            if (!valid)
            {
                invalid_fields.push(fields);
            }
        });

        return invalid_fields;
    },

    initCityData: function()
    {
        var that = this;

        $('.school-strike-form select[name=City] option').each(function(){
            var option = $(this);
            var region_id = option.data('region');

            if (!that.cities_by_regions[region_id])
            {
                that.cities_by_regions[region_id] = [];
            }

            that.cities_by_regions[region_id].push({
                value: option.attr('value'),
                text: option.text()
            })
        });
    }//,

    //geocodeCity: function(city, callback)
    //{
    //    var geocoder = new google.maps.Geocoder();
    //    geocoder.geocode({'address': city + ', slovensko'}, function(results, status) {
    //        if (status == google.maps.GeocoderStatus.OK) {
    //            callback(results[0].geometry.location.lat(), results[0].geometry.location.lng());
    //        }
    //        else
    //        {
    //            callback(null, null);
    //        }
    //    });
    //}
};