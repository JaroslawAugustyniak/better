function getCookie(c_name)
{
    var i, x, y, ARRcookies = document.cookie.split(";");
    for (i = 0; i < ARRcookies.length; i++)
    {
        x = ARRcookies[i].substr(0, ARRcookies[i].indexOf("="));
        y = ARRcookies[i].substr(ARRcookies[i].indexOf("=") + 1);
        x = x.replace(/^\s+|\s+$/g, "");
        if (x == c_name)
        {
            return unescape(y);
        }
    }
}

function setCookie(c_name, value, exdays)
{
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    document.cookie = c_name + "=" + value + ";expires=" + exdate + ";path=/";
}

function closeInfoCookie()
{
    setCookie("infoCookie", '1', 365);
    $("#info_cookie").remove();
    $("body").css('padding-bottom', '0px');
}

function ustawCookie()
{
    //setCookie("infoCookie",'',365);

    var infoCookie = getCookie("infoCookie");

    if (!(infoCookie != null && infoCookie != ""))
    {
        $("body").append("<div id='info_cookie' class='fixed-bottom colorset--color-2'>" +
            "<div class='container'>" +
            "<div class='row'>" +
            "<div class='col-lg-10 col-sm-9 col-12'>" +
            lang_cookie_info +
            "</div>" +
            "<div class='col-lg-2 col-sm-3 col-12 text-sm-right'>" +
            "<a class='infocookie-close' href='javascript:void(0);'>" +
            lang_nie_pokazuj_wiecej +
            "</a>" +
            "</div>" +
            "</div>" +
            "</div>" +
            "</div>");

        ustawMarginesStrony();
    }
}

function ustawMarginesStrony()
{
    var infoCookie = getCookie("infoCookie");

    // if (!(infoCookie != null && infoCookie != ""))
    // {
    //     var wysokosc = $("#info_cookie").height() + 20;
    //     $("body").css('padding-bottom', wysokosc + 'px');
    // }
}


/*$(document).ready(function(){
 setCookie("infoCookie",'1',-1);
 });*/


$(function () {
    ustawCookie();

    $(document).on("click", ".infocookie-close", function () {
        closeInfoCookie();
    });
});
$(window).resize(function () {
    ustawMarginesStrony();
});