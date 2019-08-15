/*--------------------↓↓↓↓↓↓物品对象群↓↓↓↓↓↓-----------------------*/
		Goods=function()
		{
			this.CanAcross=true;
			this.Price=0;
			this.ValueStep=1;	//步进
			this.IsUsed=false;	//是否已使用
		}
		Goods.prototype=new TankObject();
		//owner:物品的所有者对象，这个只能是TANK
		Goods.prototype.UseGoods=function(owner)
		{
			if(owner instanceof Tank)
				throw new Error("请传TANK对象");
		}

		//炸弹威力物品
		PowerG=function(){this.Price=2;}
		PowerG.prototype=new Goods();
		PowerG.prototype.UseGoods=function(owner)
		{
			//调用父类方法
			Goods.prototype.UseGoods.call(this,owner);
			for(var i=0;i<owner.BombArray.length;i++)
			{
				owner.BombArray[i].Power+=this.ValueStep;				
			}
		}

		SpeedG=function(){}
		SpeedG.prototype=new Goods();
		SpeedG.prototype.UseGoods=function(owner)
		{
			//调用父类方法
			Goods.prototype.UseGoods.call(this,owner);
			owner.Speed+=this.ValueStep;
		}

		LifG=function(){}
		LifG.prototype=new Goods();
		LifG.prototype.UseGoods=function(owner)
		{
			//调用父类方法
			Goods.prototype.UseGoods.call(this,owner);
			owner.LifeNum+=this.ValueStep;
		}

		DefendG=function(){}
		DefendG.prototype=new Goods();
		DefendG.prototype.UseGoods=function(owner)
		{
			//调用父类方法
			Goods.prototype.UseGoods.call(this,owner);
			owner.DefendVal+=this.ValueStep;
		}

		BombG=function(){}
		BombG.prototype=new Goods();
		BombG.prototype.UseGoods=function(owner)
		{
			//调用父类方法
			Goods.prototype.UseGoods.call(this,owner);
			owner.BombNum+=this.ValueStep;
		}
		/*--------------------↑↑↑↑↑物品对象群结束线↑↑↑↑↑-----------------------*/ 