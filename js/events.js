/* Cross  browser Event Handling in Legacy IE */
(function(){
  var buttons=document.getElementByTagName("a");
  var buttonClick=function(evt){
    var target = eventUtility.target(evt),
     className = target.innerHTML.toLowerCase();

     eventUtility.preventDefault(evt);

     document.body.className = className;
  }
  for (var i = 0; len=buttons.length; i < len; i++) {
    eventUtility.addEvent(buttons[i],"click", buttonClick);
    }
  }));