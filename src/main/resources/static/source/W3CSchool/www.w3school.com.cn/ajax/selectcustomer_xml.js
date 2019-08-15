var xmlHttp

function showCustomer(str)
{ 
xmlHttp=GetXmlHttpObject();
if (xmlHttp==null)
  {
  alert ("Your browser does not support AJAX!");
  return;
  }        
var url="getcustomer_xml.asp";
url=url+"?q="+str;
url=url+"&sid="+Math.random();
xmlHttp.onreadystatechange=stateChanged;
xmlHttp.open("GET",url,true);
xmlHttp.send(null);
}

function stateChanged() 
{ 
if (xmlHttp.readyState==4)
  { 
  var xmlDoc=xmlHttp.responseXML.documentElement;
  document.getElementById("companyname").innerHTML=xmlDoc.getElementsByTagName("compname")[0].childNodes[0].nodeValue;
  document.getElementById("contactname").innerHTML=xmlDoc.getElementsByTagName("contname")[0].childNodes[0].nodeValue;
  document.getElementById("address").innerHTML=xmlDoc.getElementsByTagName("address")[0].childNodes[0].nodeValue;
  document.getElementById("city").innerHTML=xmlDoc.getElementsByTagName("city")[0].childNodes[0].nodeValue;
  document.getElementById("country").innerHTML=xmlDoc.getElementsByTagName("country")[0].childNodes[0].nodeValue;
  }
}

function GetXmlHttpObject()
{
var xmlHttp=null;
try
  {
  // Firefox, Opera 8.0+, Safari
  xmlHttp=new XMLHttpRequest();
  }
catch (e)
  {
  // Internet Explorer
  try
    {
    xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
    }
  catch (e)
    {
    xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
    }
  }
return xmlHttp;
}