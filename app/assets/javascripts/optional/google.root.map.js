// This is the code needed for the map in the app route map


$(document).ready(function(){

  
  function initialize_root_map() {
      var mapOptions = {
        center: new google.maps.LatLng(-32.890183, -68.8440498),
        zoom: 14,
        mapTypeId: google.maps.MapTypeId.ROADMAP
      };
      
      // array of markers in map
      markers = []  

      // this acctually initialices map
      map = new google.maps.Map(document.getElementById("root-map-canvas"),
          mapOptions);

  }

  initialize_root_map();


})
