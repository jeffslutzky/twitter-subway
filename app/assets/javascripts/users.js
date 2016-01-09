$(function(){
  $.getJSON("", function(data){
    chart(data);
  });
});

function chart(data){
  d3.json("index.json", function(error, data){
    
    debugger;

  });
};
