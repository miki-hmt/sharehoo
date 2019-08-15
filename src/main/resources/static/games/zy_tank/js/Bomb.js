//炸弹对象,这个对象需要放在TANK对象前面，有先后顺序
		Bomb=function(){
			this.Owner=null;
			this.Power=1;
			this.Speed=7;
		}
		Bomb.prototype=new Mover();
		Bomb.prototype.Load=function(x,y)
		{
			this.UI=document.getElementById("divMap").appendChild(document.createElement("div"));
			this.UI.className="bomb";
			this.SetPosition(x*40,y*40);
		}
	
		//重写OnHitTest方法
		Bomb.prototype.OnHitTest = function(battleField) {
		    var ex = new Explode();
		    ex.Play(this.XPosition, this.YPosition);
		    this.Owner.BombUsed -= 1;
		    battleField[this.YPosition][this.XPosition].occupier = null;
		    UtilityClass.RemoveE(this.UI, document.getElementById("divMap"));

		    var nextObj = this.GetNextBattleFieldCell(battleField);
		    if (nextObj == null)
		        return;
		    nextObj.occupier = null;


		    if (nextObj.obj instanceof Barrier) {
		        //如果可被攻击
		        if (nextObj.obj.CanBeAttacked) {
		            Debug.Trace("下一个障碍物可被攻击-----");
		            if (nextObj.obj instanceof Barrier) {
		                Debug.Trace("炸弹碰撞事件处理:是障碍物");
		                Debug.Trace(nextObj.obj.UI.className);
		            }

		            nextObj.obj.DefendVal -= this.Power;
		            if (nextObj.obj.DefendVal <= 0) {
		                var to = new EmptyB();
		                to.UI = nextObj.obj.UI;
		                to.XPosition = nextObj.obj.XPosition;
		                to.YPosition = nextObj.obj.YPosition;
		                nextObj.obj = to;
		                to.UI.className = "";
		                battleField[this.YPosition][this.XPosition].obj.UI.className = "";
		            }
		        }
		        //如果下一个是草或者空地
		        else if (nextObj.obj instanceof EmptyB || nextObj.obj instanceof TodB) {
		            Debug.Trace("炸弹炸到草和空地");
		            if (nextObj.occupier instanceof EnimyTank) {
		                Debug.Trace("打到了敌机");
		                //这里先不判断防御
		                GameLoad._alreadyKillEnimyNum += 1;
		                if (GameLoad._alreadyKillEnimyNum >= GameLoad._needKillEnimyNum) {
		                    alert("恭喜你过关！");
		                    clearInterval(GameLoad._gameListener);
		                    return;
		                }
		                //把本坦克去掉
		                UtilityClass.RemoveE(nextObj.occupier, document.getElementById("divMap"));


		                //重新生成敌机坦克
		                var enimyT1 = new EnimyTank();
		                enimyT1.XPosition = 0;
		                enimyT1.YPosition = 0;
		                enimyT1.UpdateUI(this._battleField);
		                GameLoad._enimyTanks.push(enimyT1);

		            }
		            if (nextObj.occupier instanceof SelfTank) {
		                //这里先不判断防御值，先测试一下
		                nextObj.occupier.LifeNum -= 1;
		                //如果没命了，就结束游戏
		                if (nextObj.occupier.LifeNum <= 0) {
		                    alert("游戏结束！");
		                    clearInterval(GameLoad._gameListener);
		                    return;
		                }
		            }
		            if (nextObj.occupier instanceof Bomb) {
		                Debug.Trace("打到了炸弹");

		                var ex1 = new Explode();
		                ex1.Play(nextObj.occupier.XPosition, nextObj.occupier.YPosition);
		                nextObj.occupier.Owner.BombUsed -= 1;
		                battleField[nextObj.occupier.YPosition][nextObj.occupier.XPosition].occupier = null;
		                UtilityClass.RemoveE(nextObj.occupier.UI, document.getElementById("divMap"));
		            }
		        }
		    }

		}
	
		//重写HitTest方法
		Bomb.prototype.HitTest = function(battleField) {
		    var nextObj = this.GetNextBattleFieldCell(battleField);
		    //Debug.Trace(nextObj instanceof Barrier);
		    //if(nextObj instanceof Bomb)
		    //Debug.Trace(this.XPosition+"--"+this.YPosition);
		    if (nextObj == null) {
		        return true;
		    }
		    //检测是否是障碍物
		    if (nextObj.obj instanceof Barrier) {
		        if (nextObj.obj instanceof EmptyB) {
		            //Debug.Trace("Empty");
		            if (nextObj.occupier instanceof Bomb) {

		                if (this.Owner instanceof SelfTank) {
		                    return nextObj.occupier.Owner instanceof EnimyTank;
		                }
		                else {
		                    return nextObj.occupier.Owner instanceof SelfTank;
		                }

		            }
		            if (nextObj.occupier instanceof Tank) {
		                if (this.Owner instanceof SelfTank) {
		                    Debug.Trace("炸弹碰撞检测：下一个占领物是坦克");
		                    Debug.Trace(nextObj.occupier instanceof EnimyTank);
		                    return nextObj.occupier instanceof EnimyTank;
		                }
		                else {

		                    return nextObj.occupier instanceof SelfTank;
		                }
		            }

		        }
		        //如果是炮弹碰到河流，就穿过
		        if (this instanceof Bomb && nextObj.obj instanceof RiverB)
		            return false;
		        //Debug.Trace(nextObj.occupier instanceof Mover);
		        return !nextObj.obj.CanAcross;
		    }

		}
		