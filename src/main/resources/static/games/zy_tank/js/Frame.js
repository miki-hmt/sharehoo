		//游戏载入对象（全局用）
		GameLoader = function() {
			this._this=this;
            this._level = 1;
			this._rowCount=13;
			this._colCount=13;
            this._needKillEnimyNum = 20;
            this._alreadyKillEnimyNum = 0;
            this._battleField = [];
            this._mapContainer = document.getElementById("divMap");
			this._selfTank=null;
			this._enimyTanks=[];
			this._explodeEffect=null;
			this._gameListener=null;
        }
        GameLoader.prototype = {
			Begin:function() {
				//载入地图
				this.Load();
				
				//载入坦克
				var selfT=new SelfTank();
				selfT.XPosition=4;
				selfT.YPosition=12;
				selfT.UpdateUI(this._battleField);
				this._selfTank=selfT;
				
				var enimyT1=new EnimyTank();
				enimyT1.XPosition=0;
				enimyT1.YPosition=0;
				enimyT1.UpdateUI(this._battleField);
				this._enimyTanks.push(enimyT1);
				
				var enimyT2=new EnimyTank();
				enimyT2.XPosition=6;
				enimyT2.YPosition=0;
				enimyT2.UpdateUI(this._battleField);
				this._enimyTanks.push(enimyT2);

				var enimyT3=new EnimyTank();
				enimyT3.XPosition=12;
				enimyT3.YPosition=0;
				enimyT3.UpdateUI(this._battleField);
				this._enimyTanks.push(enimyT3);

/**/
				var warpper=UtilityClass.BindFunction(this,this.OnKeyDown);
				//按键检测，添加事件
				window.onkeydown=document.body.onkeydown=warpper;					
				
				warpper=UtilityClass.BindFunction(this,this.OnKeyUp);				
				/*按键弹起*/
				window.onkeyup=document.body.onkeyup=warpper;
				
				warpper=UtilityClass.BindFunction(this,this.Run);
				/*长定时器监听控制键*/
				this._gameListener=setInterval(warpper,20);
			}
			,OnKeyDown:function(e)
			{
				switch ((window.event||e).keyCode){
					case 37:
						this._selfTank.Direction=EnumDirection.Left;
						this._selfTank.MovingState=true;
						break;		//左
					case 38:					
						this._selfTank.Direction=EnumDirection.Up;	
						this._selfTank.MovingState=true;
						break;		//上
					case 39:
						this._selfTank.Direction=EnumDirection.Right;
						this._selfTank.MovingState=true;
						break;		//右
					case 40:
						this._selfTank.Direction=EnumDirection.Down;
						this._selfTank.MovingState=true;
						break;		//下
					case 32:
						this._selfTank.Shot(this._battleField);

						break;		//空格
				}
				
			}
			,OnKeyUp:function(e)
			{
				switch ((window.event||e).keyCode){
						case 37:
						case 38:				
						case 39:
						case 40:
							this._selfTank.MovingState=false;
							break;		
					}
			}
			,EnimyAutoMove:function()
			{
				for(var i=0;i<this._enimyTanks.length;i++)
				{
					if(this._enimyTanks[i] instanceof Mover)
					{
						//Debug.Trace(this._enimyTanks[i]);
						this._enimyTanks[i].Move(this._battleField);

						if(Math.random()*100<10)
							this._enimyTanks[i].Shot(this._battleField);/* 0.5%的机率射击 */

					}
				}
			}
			/*游戏主循环运行函数，游戏的心脏，枢纽*/
			,Run:function()
			{
				this.EnimyAutoMove();
				
				if(this._selfTank.MovingState)
				{
					this._selfTank.Move(this._battleField);
				}
			}
			,GetTdFromBattlField:function(x,y){
				//此处应该是y作为行，row ;  x作为列，col
				return this._battleField[y][x].UI;
			}
			,Load:function(){

				var map=Top_MapLevel[this._level-1].split(',');
				var mapBorder=UtilityClass.CreateE("div","","mapBorder",this._mapContainer);
				for(var i=0;i<this._rowCount;i++)
				{
					this._battleField[i]=[];
					var divRow=UtilityClass.CreateE("div","","",mapBorder);
					for(var j=0;j<this._colCount;j++)
					{
						var v=map[i]&&map[i].charAt(j)||0;/* 逐字符读取贴图数据 */
						var spanCol=UtilityClass.CreateE("span","","",divRow);	
						spanCol.className=ArrayCss[v];
						
						var to=null;
						switch(v)
						{
							case EnumMapCellType.Empty:
								to=new EmptyB();
								break;
							case EnumMapCellType.Wall:
								to=new WallB();
								break;								
							case EnumMapCellType.Steel:
								to=new SteelB();
								break;
							case EnumMapCellType.Tod:
								to=new TodB();
								break;
							case EnumMapCellType.River:
								to=new RiverB();
								break;
							case EnumMapCellType.Podium:
								to=new PodiumB();
								break;
							default:
								throw new Error("地图数字越界！");
								break;
						}
						to.UI=spanCol;
						//这里的j就是X，因为内部循环是横向的，x是横坐标
						to.XPosition=j;
						to.YPosition=i;

						this._battleField[i][j]={obj:to,occupier:null,lock:false};
						//Debug.Trace("create:"+this._battleField[i][j].obj);
					}
				}
				window.BattleField=this._battleField;
			}
		}