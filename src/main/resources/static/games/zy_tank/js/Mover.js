//移动对象，继承自碰撞检测对象
		Mover=function()
		{
			this.Direction=EnumDirection.Up;
			this.Speed=1;
		}
		Mover.prototype=new HitTestObject();
		Mover.prototype.Move=function(battleField)
		{
			if(this.lock){
				return;}/* 停用或者尚在步进中,操作无效 */
			
			if((this instanceof EnimyTank)&&Math.random()*100>50)/* 敌机有4%的机率会中途变换方向  */
				 this.Direction=Math.max(0,Math.min(3,parseInt(Math.random()*5)-1));

			this.UI.style.backgroundPosition='0 -'+this.Direction*40+'px';
			if(this.HitTest(battleField))return this.OnHitTest(battleField);

			//如果方向是上和下，vp就是top；如果方向是上和左，val就是-1
			var vp=["top","left"][((this.Direction==EnumDirection.Up)||(this.Direction==EnumDirection.Down))?0:1];
			var val=((this.Direction==EnumDirection.Up)||(this.Direction==EnumDirection.Left))?-1:1;

			this.lock=true;/* 加锁 */
			var This=this;
			var startmoveP=parseInt(This.UI.style[vp]);
			var xp=This.XPosition,yp=This.YPosition;
			var nextPoint=this.GetNextAxes(xp,yp);

			var subMove=setInterval(function (){
				
				This.UI.style[vp]=parseInt(This.UI.style[vp])+ 5 *val+'px';
				battleField[nextPoint.y][nextPoint.x].occupier=This;//记录移动物即将占据的下一个在战场上的位置

				if( Math.abs(parseInt(This.UI.style[vp])-startmoveP)>=40)
				{
					clearInterval(subMove);
					This.lock=false;/* 解锁,允许再次步进 */

					This.XPosition=Math.round(This.UI.offsetLeft/40);/* 保存网格坐标 */
					This.YPosition=Math.round(This.UI.offsetTop/40);
					battleField[yp][xp].occupier=null;//清空当前战场占有物


					if(This instanceof Bomb)This.Move(battleField);
				}
				
				
			},80-This.Speed*10);/*60-This.Speed*10*/ /*50是最好的起始速度*/

		}