function loadXMLDoc(dname) 
{
var xmlDoc;
// code for IE
if (window.ActiveXObject)
  {
  xmlDoc=new ActiveXObject("Microsoft.XMLDOM");
  }
// code for Mozilla, Firefox, Opera, etc.
else if (document.implementation && document.implementation.createDocument)
  {
  xmlDoc=document.implementation.createDocument("","",null);
  }
else
  {
  alert('Your browser cannot handle this script');
  }
xmlDoc.async=false;
xmlDoc.load(dname);
return(xmlDoc);
}
