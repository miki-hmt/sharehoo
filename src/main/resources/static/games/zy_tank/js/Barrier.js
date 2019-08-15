/*------------------↓↓↓↓↓障碍物对象群↓↓↓↓↓------------------------*/
		//障碍物基类对象
		Barrier=function(){
			this.DefendVal=1;
			this.CanBeAttacked=true;
		}
		Barrier.prototype=new TankObject();

		WallB=function(){}
		WallB.prototype=new Barrier();
		
		EmptyB=function(){
			this.CanAcross=true;
		}
		EmptyB.prototype=new Barrier();

		RiverB=function(){
			this.DefendVal=0;
			this.CanBeAttacked=false;
		}
		RiverB.prototype=new Barrier();

		SteelB=function()
		{
			this.DefendVal=3;
		}
		SteelB.prototype=new Barrier();

		TodB=function(){
			this.CanBeAttacked=false;
			this.DefendVal=0;
			this.CanAcross=true;
		}
		TodB.prototype=new Barrier();

		PodiumB=function()
		{
			this.DefendVal=5;
		}
		PodiumB.prototype=new Barrier();

		/*------------------↑↑↑↑↑障碍物对象群结束线↑↑↑↑↑------------------------*/