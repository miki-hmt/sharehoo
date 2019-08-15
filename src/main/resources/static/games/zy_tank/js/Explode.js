//±¬Õ¨Ð§¹ûÀà
		Explode=function()
		{
			this.container=document.getElementById("divMap");
			this.UI=null;
			this.step=8;
			this.speed=50;
		}
		Explode.prototype.Play=function(x,y)
		{
			this.UI=UtilityClass.CreateE("div","","explode",this.container);
			this.MoveTo(x,y);

			var i=0;
			var This=this;
			var FxTimer=setInterval(function (){
				This.UI.style.backgroundPosition='0 -'+i++*60+'px';
				if(i==This.step){
					clearInterval(FxTimer);
					This.Stop();
				}
			},This.speed)
		}
		//x:1*40,...
		Explode.prototype.MoveTo=function(x,y)
		{
			if(this.UI!=null)
			{
				this.UI.style.left=x*40+(-10)+"px";
				this.UI.style.top=y*40+(-10)+"px";
			}
		}
		Explode.prototype.Stop=function()
		{
			UtilityClass.RemoveE(this.UI,this.container);
		}