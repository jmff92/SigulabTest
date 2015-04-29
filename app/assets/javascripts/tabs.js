$(function() {
    var tabs = $( "#tabs" ).tabs();
    tabs.find( ".ui-tabs-nav" ).sortable({
      axis: "x",
      stop: function() {
        tabs.tabs( "refresh" );
      }
    });
	$("#tabs").tabs();
	$(".show").click(function() {
    	$(".hidden_option").fadeIn('fast');
	});    
	$(".hidex").click(function() {
    	$(".hidden_option").fadeOut('fast');
	});   	
  });