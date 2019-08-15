//tank对象
		Tank=function(){
			this.BombNum=2;
			this.BombUsed=0;
			this.LifeNum=1;
			this.BombArray=[];
			//this.SetBombArray();
		}
		Tank.prototype=new Mover();
		Tank.prototype.SetBombArray=function()
		{
			this.BombArray=[];
			for(var i=0;i<this.BombNum;i++)
			{
				var b=new Bomb();
				this.BombArray.push(b);
			}
		}
		Tank.prototype.Shot=function(battleField){
			if(this.BombUsed>=this.BombNum)return;
			var bomb=new Bomb();
			bomb.Load(this.XPosition,this.YPosition);
			this.BombUsed+=1;
			bomb.Owner=this;
			bomb.Direction=this.Direction;
			bomb.Move(battleField);
		}

		EnimyTank=function(){
			this.BombNum=1;
			this.UI=document.getElementById("divMap").appendChild(document.createElement("div"));
			this.UI.className="etank";
		}
		EnimyTank.prototype=new Tank();
		EnimyTank.prototype.UpdateUI=function(battleField)
		{
			Tank.prototype.constructor();

			this.UI.className="etank";
			battleField[this.YPosition][this.XPosition].occupier=this;
			this.SetPosition(this.XPosition*40,this.YPosition*40);
		}


		SelfTank=function(){
			this.UI=document.getElementById("divMap").appendChild(document.createElement("div"));
			this.UI.className="itank";
			//坦克是否处于移动状态，通过这个来判断按键是否持续按住
			this.MovingState=false;
			this.Speed=4;

		}
		SelfTank.prototype=new Tank();
		SelfTank.prototype.UpdateUI=function(battleField)
		{
			this.UI.className="itank";
			battleField[this.YPosition][this.XPosition].occupier=this;
			this.SetPosition(this.XPosition*40,this.YPosition*40);
		}