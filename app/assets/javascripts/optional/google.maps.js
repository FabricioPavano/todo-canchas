
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

        //if theres isnt a form input with the coords we look 
        //for a span with them
        dbCoords = typeof dbCoords !== 'undefined' ? a : $('input#coords').val();




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
    

    //// Listeners related to maps
   
    

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



    // This function places a marker on given location
    // Allowing only one marker
    // lastly sets coords on hidden field
    function markClubLocation(location) {
      
      // adds marker
      var marker = new google.maps.Marker({
          position: location,
          map: map
      });

      // sets center on location
      map.setCenter(location);

      // zooms map on location
      map.setZoom(15)

      // removes old marker if any
      markers.push(marker)

      if(markers.length > 1){
        markers.first().setMap(null)
        markers.shift()
      }
      

      // sets coordinates
      setCoords(location)
    }



    // recieves address and marks Club Location if possible
    function geocodeClubLocation(address){
      // Only mendoza's addresses for the moment
      address += ', Mendoza, Argentina'

      // Geocodes Address
      geocoder = new google.maps.Geocoder();
      geocoder.geocode({'address': address}, function(results, status) {
          if (status == google.maps.GeocoderStatus.OK){

               markClubLocation(results[0].geometry.location) 
               
               //shows alert message
               $('.found').removeClass('hidden')
          }

          else{
             map.setZoom(14)
             $('.not-found').removeClass('hidden')
          }   
        })
    }


    // Sets given coordinates to form hidden field
    function setCoords(latlng){
        $('input[name="club[coords]"]').val(latlng.lat() + ',' + latlng.lng()) 
    }

    // takes a string with the coords as saved in the database
    // and builds a LatLng object 
    function buildLatLng(latlngStr) {
      var latlngStr = latlngStr.split(",",2);
      var lat = parseFloat(latlngStr[0]);
      var lng = parseFloat(latlngStr[1]);
      return new google.maps.LatLng(lat, lng);
    };
  

