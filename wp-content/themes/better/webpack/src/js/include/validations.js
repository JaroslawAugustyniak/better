// Zmienne lang_*  ustalane są w widoku footer.php w szablonie
require('jquery-validation');
// Formularz "Kontakt"
$("#contact-form").validate({
    messages: {

        email: {
            required: lang_email_rq,
            email: lang_email_err
        },
        message: {
            required: lang_message_rq
        },
        agreement: {
            required: lang_agreement_rq
        }
    },

    submitHandler: function(form) {
        $('#send_contact_form').val('1');
        form.submit();
    }
});

// Formularz "W stopce"
$("#footer-form").validate({
    messages: {

        email: {
            required: lang_email_rq,
            email: lang_email_err
        },
        message: {
            required: lang_message_rq
        },
        agreement: {
            required: lang_agreement_rq
        }
    },

    submitHandler: function(form) {
        $('#send_footer_form').val('1');
        form.submit();
    }
});

// Formularz "Newsletter"
$("#newsletter-form").validate({
    messages: {
        email: {
            required: lang_email_rq,
            email: lang_email_err
        },
        agreement: {
            required: lang_agreement_rq
        }
    },

    submitHandler: function(form) {
        $('#send_newsletter_form').val('1');
        form.submit();
    }
});

// Sprawdzenie kodu pocztowego
jQuery.validator.addMethod("sprawdz_kodpocztowy", function(value, element) {
    return this.optional(element) || /^\d{2}-\d{3}$/.test(value);
}, lang_post_code_err);
