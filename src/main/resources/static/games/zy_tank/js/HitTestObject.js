//碰撞检测对象
		HitTestObject=function()
		{
		}
		HitTestObject.prototype=new TankObject();
		
		//此处碰撞检测主要是以tank为当前被检测对象
		HitTestObject.prototype.HitTest=function(battleField)
		{
			//to be implemented
			//throw new Error("请实现"+UtilityClass.GetFunctionName(this,arguments.callee)+"方法");

			var nextObj=this.GetNextBattleFieldCell(battleField);
			//Debug.Trace(nextObj instanceof Barrier);
			//if(nextObj instanceof Bomb)
				//Debug.Trace(this.XPosition+"--"+this.YPosition);
			
			if(nextObj==null)
			{
				return true;//场景越界
			}
			//检测是否是障碍物
			if(nextObj.obj instanceof Barrier)
			{
				 if(nextObj.obj instanceof EmptyB)
				 {
					 
					 if(nextObj.occupier instanceof Bomb)
					 {
						
						if(this instanceof SelfTank)
						 {
							return nextObj.occupier.Owner instanceof EnimyTank;
						 }
						else
							return nextObj.occupier.Owner instanceof SelfTank;
					 }

					 return nextObj.occupier instanceof Mover;
				 }
				 //如果是炮弹碰到河流，就穿过
				 //zyong36
				 //if(this instanceof Bomb && nextObj.obj instanceof RiverB)
				 //	 return false;
				 //Debug.Trace(nextObj.occupier instanceof Mover);
				 return !nextObj.obj.CanAcross;
			}
		}

		HitTestObject.prototype.GetNextBattleFieldCell=function(battleField)
		{
			
			if(this.Direction==EnumDirection.Up&&this.YPosition==0||
				this.Direction==EnumDirection.Right&&this.XPosition==12||
				this.Direction==EnumDirection.Down&&this.YPosition==12||
				this.Direction==EnumDirection.Left&&this.XPosition==0
			)
			return null;/* 场景越界 */

			var y=this.YPosition;
			var x=this.XPosition;
			var nextAxes=this.GetNextAxes(x,y);

				//Debug.Trace("next-y:"+nextAxes.y+"next---x:"+nextAxes.x);
	
			return battleField[nextAxes.y][nextAxes.x];
		}
		//获取下一个坐标
		HitTestObject.prototype.GetNextAxes=function(x,y)
		{
			var point={x:x,y:y};
			switch(this.Direction+""){//这个地方如果不加“”，就不是字符串类型，不等于字符串类型
				case EnumDirection.Up:
					point={x:x,y:y-1};
					break;
				case EnumDirection.Right:
					point={x:x+1,y:y};
					break;
				case EnumDirection.Down:
					point={x:x,y:y+1};
					break;
				case EnumDirection.Left:
					point={x:x-1,y:y};
					break;
			}
			return point;
		}
		HitTestObject.prototype.OnHitTest=function(battleField)
		{
			//to be implemented
			//throw new Error("请实现"+UtilityClass.GetFunctionName(this,arguments.callee)+"方法");
		}