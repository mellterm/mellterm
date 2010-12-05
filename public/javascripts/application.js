// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function toggleCheckbox(checkbox_id){
  var checkbox = document.getElementById(checkbox_id)
  if (checkbox.checked == 0) {
    checkbox.checked = true;
  }
  else {
    checkbox.checked = false;
	}
};

// $(document).ready(function () {
//   $('.tooltip *').tooltip();
// 
//   $('.pretty *').tooltip({ 
//       track: true, 
//       delay: 0, 
//       showURL: false, 
//       showBody: " - ", 
//       extraClass: "pretty", 
//       fixPNG: true, 
//       opacity: 0.90, 
//       top: -50,
//       left: -80 
//   });
// });