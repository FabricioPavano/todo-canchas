$(document).ready(function(){

  departments = [];

  $.getJSON('/departments/fetch', false, function(data){
     departments = data
  })




$('.form-search').submit(function(){
    var value = $('.form-search input.search-query').val()
    if(check_if_department(value)){
        $('.form-search input.search-query').attr('name','department')
    }
})






  //muestra/esconde campos con cantidad de canchas de
  //acuerdo a los checkboxes
  function mostrarCamposCantidadCanchas(){

    if($('#club_courts_types_futbol').is(':checked') == $('#club_futbol_quantity').parents('.control-group').hasClass('hidden'))
      $('#club_futbol_quantity').parents('.control-group').toggleClass('hidden')    
    
    if($('#club_courts_types_tenis').is(':checked') == $('#club_tenis_quantity').parents('.control-group').hasClass('hidden'))
      $('#club_tenis_quantity').parents('.control-group').toggleClass('hidden')    

    if($('#club_courts_types_paddle').is(':checked') == $('#club_paddle_quantity').parents('.control-group').hasClass('hidden'))
      $('#club_paddle_quantity').parents('.control-group').toggleClass('hidden')   

  }

  //asginamos el handler 
  $('div.check_boxes').click(mostrarCamposCantidadCanchas)



})
