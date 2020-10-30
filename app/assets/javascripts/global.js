$(function () {
    $('.wysihtml5').wysihtml5({'toolbar': {'blockquote': false, 'html': true}})

    $('.colorpicker').minicolors({theme: 'bootstrap'});

    $('.date_picker').calendarsPicker({
        dateFormat: 'dd/mm/yyyy',
    });


    //Exportable table
    $('.dataTable').DataTable({
        retrieve: true,
        destroy: true,
        dom: '<"html5buttons"B>lTfgtip',
        responsive: true,
        lengthMenu: [[10, 25, 50, 100, -1], [10, 25, 50, 100, "All"]],
        buttons: [
            'copy', 'csv'
        ]
    });

})