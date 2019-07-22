


var is_iPad = navigator.userAgent.match(/iPad/i) != null;
if (is_iPad)
{
    $(document).ready(function () {
        $('input[list]').each(function () {
            var availableTags = $('#' + $(this).attr("list")).find('option').map(function () {
                return this.value;
            }).get();
            $(this).autocomplete({source: availableTags});
        });
    });
}

//if (screen.width <= 1366)
//{
//    $(document).ready(function () {
//        $('input[list]').each(function () {
//            var availableTags = $('#' + $(this).attr("list")).find('option').map(function () {
//                return this.value;
//            }).get();
//            $(this).autocomplete({source: availableTags});
//        });
//    });
//}