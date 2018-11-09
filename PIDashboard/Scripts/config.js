function dataTable(tbId) {
    try {
        $(tbId).dataTable({
            "language": {
                "url": "//cdn.datatables.net/plug-ins/1.10.19/i18n/Portuguese-Brasil.json"
            },
            "pageLength": 10
        });
    }
    catch (e) {
        console.log(e);
    }
}