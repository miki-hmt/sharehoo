//̹�˴�ս�������
		TankObject=function()
		{
			this.AttackVal=0;
			this.DefendVal=0;
			this.CanBeAttacked=false;
			this.XPosition=0;
			this.YPosition=0;
			this.CanAcross=false;
			this.UI=null; //̹�˴�սһ�����Ӷ����UI
		}
		TankObject.prototype.UpdateUI=function(battlField){}
		//����λ�ã�������������1*40,6*40
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