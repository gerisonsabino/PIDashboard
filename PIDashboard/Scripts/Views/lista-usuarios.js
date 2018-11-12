$(function () {
    var i = 0;
    $("#MainContent_grdUsuarios tbody tr").each(function () {
        if (i == 0) {
            $("#MainContent_grdUsuarios").prepend("<thead>");
            $("#MainContent_grdUsuarios thead").append($(this));
        }
        var id = $($(this).find("td")[0]).text();
        var td = $(this).find("td")[3];

        $(td).html("<a href='/Usuario.aspx?id=" + id + "'><span class='fa fa-angle-right'></span> <span>Abrir</span></a>");

        i++;
    });

    dataTable("#MainContent_grdUsuarios");
});