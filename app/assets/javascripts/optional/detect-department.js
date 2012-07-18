//this file adds a functionality to the search form
//that auto-detects a department just before its submitted
//and changes the inputa name attr to department



$('.form-search').submit(function(){
    var value = $('.form-search input.search-query').val()
    if(check_if_department(value)){
        $('.form-search input.search-query').attr('name','department')
    }
})

