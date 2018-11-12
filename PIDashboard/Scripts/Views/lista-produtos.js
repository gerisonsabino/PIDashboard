$(function () {
    $("#MainContent_grdProdutos").prepend("<thead>");
    
    $("#MainContent_grdProdutos thead").append($("#MainContent_grdProdutos tbody tr:first-child"));

    $("#MainContent_grdProdutos tbody tr").each(function () {
        var td = $(this).find("td")[4];
        $(td).html("<a href='/Produto.aspx?id=" + $(td).text() + "'><span class='fa fa-angle-right'></span> <span>Abrir</span></a>");
    }); 
});

$(document).ready(function () { dataTable("#MainContent_grdProdutos"); });