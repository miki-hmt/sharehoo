//坦克大战顶层对象
		TankObject=function()
		{
			this.AttackVal=0;
			this.DefendVal=0;
			this.CanBeAttacked=false;
			this.XPosition=0;
			this.YPosition=0;
			this.CanAcross=false;
			this.UI=null; //坦克大战一个格子对象的UI
		}
		TankObject.prototype.UpdateUI=function(battlField){}
		//设置位置，参数是这样：1*40,6*40
		TankObject.prototype.SetPosition=function(leftPosition,topPosition)
		{
			
			this.XPosition=Math.round(leftPosition/40);
			this.YPosition=Math.round(topPosition/40);

			if(this.UI!=null && this.UI.style!=null)
			{

				this.UI.style.left=leftPosition+"px";
				this.UI.style.top=topPosition+"px";
			}
		}