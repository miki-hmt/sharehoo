//�ƶ����󣬼̳�����ײ������
		Mover=function()
		{
			this.Direction=EnumDirection.Up;
			this.Speed=1;
		}
		Mover.prototype=new HitTestObject();
		Mover.prototype.Move=function(battleField)
		{
			if(this.lock){
				return;}/* ͣ�û������ڲ�����,������Ч */
			
			if((this instanceof EnimyTank)&&Math.random()*100>50)/* �л���4%�Ļ��ʻ���;�任����  */
				 this.Direction=Math.max(0,Math.min(3,parseInt(Math.random()*5)-1));

			this.UI.style.backgroundPosition='0 -'+this.Direction*40+'px';
			if(this.HitTest(battleField))return this.OnHitTest(battleField);

			//����������Ϻ��£�vp����top������������Ϻ���val����-1
			var vp=["top","left"][((this.Direction==EnumDirection.Up)||(this.Direction==EnumDirection.Down))?0:1];
			var val=((this.Direction==EnumDirection.Up)||(this.Direction==EnumDirection.Left))?-1:1;

			this.lock=true;/* ���� */
			var This=this;
			var startmoveP=parseInt(This.UI.style[vp]);
			var xp=This.XPosition,yp=This.YPosition;
			var nextPoint=this.GetNextAxes(xp,yp);

			var subMove=setInterval(function (){
				
				This.UI.style[vp]=parseInt(This.UI.style[vp])+ 5 *val+'px';
				battleField[nextPoint.y][nextPoint.x].occupier=This;//��¼�ƶ��Ｔ��ռ�ݵ���һ����ս���ϵ�λ��

				if( Math.abs(parseInt(This.UI.style[vp])-startmoveP)>=40)
				{
					clearInterval(subMove);
					This.lock=false;/* ����,�����ٴβ��� */

					This.XPosition=Math.round(This.UI.offsetLeft/40);/* ������������ */
					This.YPosition=Math.round(This.UI.offsetTop/40);
					battleField[yp][xp].occupier=null;//��յ�ǰս��ռ����


					if(This instanceof Bomb)This.Move(battleField);
				}
				
				
			},80-This.Speed*10);/*60-This.Speed*10*/ /*50����õ���ʼ�ٶ�*/

		}