$(function () {
    $("#participant_organization_type_id").change(function(){
      var orgn_type = $(this).val();
        $.ajax({
          url: '/participants/load_directorates',
          data: { organization_type: orgn_type},
          cache: true,
          async: false,

            success: function(response){
              $('#directorates_display').html(response);
            }
        });
    });
});