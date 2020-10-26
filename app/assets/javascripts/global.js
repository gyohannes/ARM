$(function () {
    $('.wysihtml5').wysihtml5({'toolbar': {'blockquote': false, 'html': true}})

    $('.colorpicker').minicolors({theme: 'bootstrap'});

    $('.dataTable').DataTable({
        responsive: true
    });

    $('.date_picker').calendarsPicker({
        dateFormat: 'dd/mm/yyyy',
    });

    //Exportable table
    $('.js-exportable').DataTable({
        retrieve: true,
        destroy: true,
        dom: 'lrBfrtip',
        responsive: true,
        lengthMenu: [[10, 25, 50, 100, -1], [10, 25, 50, 100, "All"]],
        buttons: [
            'copy', 'csv', 'excel', 'pdf', 'print'
        ],
        columnDefs: [
            {
                targets: [0],
                orderable: false,
            }
        ]
    });

})