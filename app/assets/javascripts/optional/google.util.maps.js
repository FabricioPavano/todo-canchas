// Utilities used in maps



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

  // sets coordinates on hidden field
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


//marks every club of a given department

// marks on the map all clubs of a given department
function markDepartmentClubs(department){

  // sets mendoza as default department
  var department = typeof department !== 'undefined' ? department : 'mendoza';
  
  
  //fetches department clubs
  $.getJSON('clubs/fetchByDepartment', {'department':department}, function(clubs){
    
    

    //we mark each one individually
    $.each(clubs,function(index,club){

      var location = buildLatLng(club.coords);

      // adds marker
      var marker = new google.maps.Marker({
         position: location,
         map: map
      });

      var infowindow = new google.maps.InfoWindow({
          content: 'probando'
      });

      google.maps.event.addListener(marker, 'click', function() {
        infowindow.open(map, marker);
      });

    })

  })

}





