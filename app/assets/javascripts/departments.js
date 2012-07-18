//Detects if the strin passed is a department
function check_if_department(value){
   return departments.some(function(dep){
      return dep.name.toLowerCase() == value.toLowerCase()
  })
}