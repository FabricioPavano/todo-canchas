$(document).ready(function(){

  //muestra/esconde campos con cantidad de canchas de
  //acuerdo a los checkboxes
  function mostrarCamposCantidadCanchas(){
    
    if($('#checkbox-futbol').is(':checked') == $('#cantidad-futbol').hasClass('hidden'))
      $('#cantidad-futbol').toggleClass('hidden')    
    
    if($('#checkbox-tenis').is(':checked') == $('#cantidad-tenis').hasClass('hidden'))
      $('#cantidad-tenis').toggleClass('hidden')    

    if($('#checkbox-paddle').is(':checked') == $('#cantidad-paddle').hasClass('hidden'))
      $('#cantidad-paddle').toggleClass('hidden')    

  }

  //asginamos el handler 
  $('.checkbox-canchas').click(mostrarCamposCantidadCanchas)



})
