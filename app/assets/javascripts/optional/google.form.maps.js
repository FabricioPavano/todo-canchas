
  // Javascript used for club maps

  $(document).ready(function(){

    
    function initialize_map() {
        var mapOptions = {
          center: new google.maps.LatLng(-32.890183, -68.8440498),
          zoom: 14,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        
        // array of markers in map
        markers = []  

        // this acctually initialices map
        map = new google.maps.Map(document.getElementById("map_canvas"),
            mapOptions);

        // marks map if club already has coords (i.e on club edit)
        // we assume that if coords field value is not an empty string
        // the value it has is a string with the coords (this assumption
        // might be wrong)
        var dbCoords = $('input[name="club[coords]"]').val()

        // we check if the coords are in the $('input#coords'), wich is the case
        // of show action
        if (typeof dbCoords == 'undefined')
          dbCoords = $('input#coords').val();

        if ( dbCoords != '' && dbCoords != undefined){
           var location = buildLatLng(dbCoords)
           markClubLocation(location)
        }

    }

    initialize_map();


    // Geocoder Object instance
    geocoder = new google.maps.Geocoder();
    
    // This flag is created to prevent blur on address input 
    // to mark the map if it has already been marked manually
    markedManually = false 

    //// Listeners related to maps in forms

    // Marks address on map on  address input blur event
    $("input#club_address").blur(function(){
      if(markedManually == false){
        geocodeClubLocation(this.value)
      }  

    })

    // we call placeMarker on click event
    google.maps.event.addListener(map, 'click', function(event) {
        markedManually = true;
        markClubLocation(event.latLng);
    });


  })



   //// Utilities


