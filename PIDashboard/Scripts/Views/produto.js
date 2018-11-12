$(function () {
    total();

    $("#MainContent_txtImagemURL").change(function () {
        $("#MainContent_imgCapa").attr("src", $(this).val());
    });

    $("#MainContent_txtLancamento").datepicker({ language: "pt-BR" });

    $("#MainContent_txtPreco").change(total);
    $("#MainContent_txtPreco").focus(function () {
        if ($("#MainContent_txtPreco").val() == "0,00") {
            $("#MainContent_txtPreco").val("");
        }
    });

    $("#MainContent_txtPreco").blur(function () {
        if ($("#MainContent_txtPreco").val() == "") {
            $("#MainContent_txtPreco").val("0,00");
        }
    });
});

function total() {
    var v = 0;

    $("#MainContent_txtPreco").val(function () {
        v = parseFloat($(this).val().replace(",", ".")).toFixed(2);

        if (v > 0) {
            return v.replace(".", ",");
        }
        else {
            return "0,00";
        }
    });
}