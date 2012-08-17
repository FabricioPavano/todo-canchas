$(document).ready(function(){

  //CLUB SEARCH

  departments = [];

  $.getJSON('/departments/fetch', false, function(data){
     departments = data
  })

  //CLUB FORM

  //muestra/esconde campos con cantidad de canchas de
  //acuerdo a los checkboxes
  function mostrarCamposCantidadCanchas(){

    // console.log(1,$('#checkbox-tenis').is(':checked'))
    // console.log(2,$('#cantidad-tenis').hasClass('hidden'))



    if($('#checkbox-futbol').is(':checked') && $('#club_futbol_quantity').parents('.control-group').hasClass('hidden')){
        $('#club_futbol_quantity').parents('.control-group').removeClass('hidden')
        $('#club_futbol_quantity').prop('disabled', false)
    }

    if(!$('#checkbox-futbol').is(':checked') && !$('#club_futbol_quantity').parents('.control-group').hasClass('hidden')){
        $('#club_futbol_quantity').parents('.control-group').addClass('hidden')
        $('#club_futbol_quantity').prop('disabled', true)
    }

     if($('#checkbox-tenis').is(':checked') && $('#club_tenis_quantity').parents('.control-group').hasClass('hidden')){
        $('#club_tenis_quantity').parents('.control-group').removeClass('hidden')
        $('#club_tenis_quantity').prop('disabled', false)
    }

    if(!$('#checkbox-tenis').is(':checked') && !$('#club_tenis_quantity').parents('.control-group').hasClass('hidden')){
        $('#club_tenis_quantity').parents('.control-group').addClass('hidden')
        $('#club_tenis_quantity').prop('disabled', true)
    }

    if($('#checkbox-paddle').is(':checked') && $('#club_paddle_quantity').parents('.control-group').hasClass('hidden')){
        $('#club_paddle_quantity').parents('.control-group').removeClass('hidden')
        $('#club_paddle_quantity').prop('disabled', false)
    }

    if(!$('#checkbox-paddle').is(':checked') && !$('#club_paddle_quantity').parents('.control-group').hasClass('hidden')){
        $('#club_paddle_quantity').parents('.control-group').addClass('hidden')
        $('#club_paddle_quantity').prop('disabled', true)
    }


  }

  //asginamos el handler 
  $('#checkbox-futbol').click(mostrarCamposCantidadCanchas)
  $('#checkbox-tenis').click(mostrarCamposCantidadCanchas)
  $('#checkbox-paddle').click(mostrarCamposCantidadCanchas)



  //CLUB SHOW 

  $('.pics').cycle({
    fx: 'scrollDown',
    timeout: 4000
  });

  $('.dev').click(function(){

    alert('funcionalidad en desarrollo')

  })



  


    
})
