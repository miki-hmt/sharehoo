/* auther:qtGao201112 */

function subMenu(){
	try{
		var lies = document.getElementById("navMain").getElementsByTagName("li");
		for (var i=0; i< lies.length; i++){
			lies[i].onmouseover= function(){
				this.className="lion";
			}
			lies[i].onmouseout= function(){
				this.className="";
			}	
		}		
	}
	catch(e){}
}

function lineColor(){
	var nd = document.getElementById('tpRank'),
		elems = nd.getElementsByTagName('ul'); 
	for(i = 0;i < elems.length; i++){
		var lies = elems[i].getElementsByTagName('li');
		for(j = 0; j < lies.length; j++){
			if(j % 2 == 0){
				lies[j].style.backgroundColor = '#ffffff';
			}else{
				lies[j].style.backgroundColor = '#e8f2f9';
			}	
		}
	}
}
