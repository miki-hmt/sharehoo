/*--------------------��������������Ʒ����Ⱥ������������-----------------------*/
		Goods=function()
		{
			this.CanAcross=true;
			this.Price=0;
			this.ValueStep=1;	//����
			this.IsUsed=false;	//�Ƿ���ʹ��
		}
		Goods.prototype=new TankObject();
		//owner:��Ʒ�������߶������ֻ����TANK
		Goods.prototype.UseGoods=function(owner)
		{
			if(owner instanceof Tank)
				throw new Error("�봫TANK����");
		}

		//ը��������Ʒ
		PowerG=function(){this.Price=2;}
		PowerG.prototype=new Goods();
		PowerG.prototype.UseGoods=function(owner)
		{
			//���ø��෽��
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
			//���ø��෽��
			Goods.prototype.UseGoods.call(this,owner);
			owner.Speed+=this.ValueStep;
		}

		LifG=function(){}
		LifG.prototype=new Goods();
		LifG.prototype.UseGoods=function(owner)
		{
			//���ø��෽��
			Goods.prototype.UseGoods.call(this,owner);
			owner.LifeNum+=this.ValueStep;
		}

		DefendG=function(){}
		DefendG.prototype=new Goods();
		DefendG.prototype.UseGoods=function(owner)
		{
			//���ø��෽��
			Goods.prototype.UseGoods.call(this,owner);
			owner.DefendVal+=this.ValueStep;
		}

		BombG=function(){}
		BombG.prototype=new Goods();
		BombG.prototype.UseGoods=function(owner)
		{
			//���ø��෽��
			Goods.prototype.UseGoods.call(this,owner);
			owner.BombNum+=this.ValueStep;
		}
		/*--------------------������������Ʒ����Ⱥ�����ߡ���������-----------------------*/ 