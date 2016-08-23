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
        ['ContactEmail'],
        ['ContactPhone']
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

                    that.data.CityLat = null;
                    that.data.CityLng = null;

                    var city;

                    if (that.choose_city)
                    {
                        city = that.form_holder.find('[name=City] option[value=' + that.data.City + ']').text();
                    }
                    else
                    {
                        city = that.data.CityRaw;
                    }

                    if (that.is_new)
                    {
                        that.geocodeAddress(that.data.SchoolStreet, city, function(lat, lng) {
                            that.data.Lat = lat;
                            that.data.Lng = lng;

                            that.submitData();
                        });
                    }
                    else
                    {
                        that.submitData();
                    }
                }
                else
                {
                    if (that.is_new)
                    {
                        window.location = '#registracia';
                        // $(window).scrollTop(0);
                    }
                    else
                    {
                        window.location = '#registracia';
                        // $(window).scrollTop(0);
                    }

                    that.render(invalid_fields);
                }
            });
    },

    submitData: function()
    {
        $.post('/data/submit', { data: this.data }, function(response) {
            window.location = '/home/message';
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
            window.location = '/home/message';
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
    },

    geocodeAddress: function(street, city, callback)
    {
        var geocoder = new google.maps.Geocoder();
        geocoder.geocode({'address': (street + ', ' + city + ', slovensko')}, function(results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                callback(results[0].geometry.location.lat(), results[0].geometry.location.lng());
            }
            else
            {
                callback(null, null);
            }
        });
    }
};