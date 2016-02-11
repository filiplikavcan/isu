var UniversityStrikeForm = function() {
    this.form_holder = $('.university-strike-form');
    this.data = {
        UpdateHash: null,
        ContactName: '',
        ContactSurname: '',
        ContactEmail: '',
        ContactPhone: '',
        FacultyName: '',
        University: ''
    };

    this.required = [
        ['ContactName'],
        ['ContactSurname'],
        ['ContactEmail'],
        ['ContactPhone'],
        ['FacultyName'],
        ['University']
    ];
};

UniversityStrikeForm.prototype = {
    init: function() {
        var that = this;

        $('.university-strike-form select[name=University]').select2();

        this.initEvents();
        this.render();
    },

    render: function(invalid_fields)
    {
        var that = this;

        this.storeForm();

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

        this.form_holder
            .on('submit', function(e) {
                e.preventDefault();

                that.storeForm();

                var invalid_fields = that.validateData();

                if (invalid_fields.length == 0)
                {
                    that.setFormAsSubmitting(that.form_holder);

                    that.submitData();
                }
                else
                {
                    window.location = '#registracia';

                    that.render(invalid_fields);
                }
            });
    },

    submitData: function()
    {
        $.post('/data/universitySubmit', { data: this.data }, function(response) {
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
    }
};