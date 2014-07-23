/* Recsively traverse the HTML DOM using the passed node as starting point */
  function traverse(obj){
       var strNode=ancestor(obj) + obj.nodeName.toString()+"\n";
          for(var i=0;i<obj.childNodes.length;i++)
                strNode+=traverse(obj.childNodes.item(i));
             return(strNode);
       function ancestor(obj){
        if(obj.parentNode != null) 
         return('>'+ ancestor(obj.parentNode));
        else
         return('');
        }
  }
