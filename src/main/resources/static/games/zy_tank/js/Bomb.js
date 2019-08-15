//ը������,���������Ҫ����TANK����ǰ�棬���Ⱥ�˳��
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
	
		//��дOnHitTest����
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
		        //����ɱ�����
		        if (nextObj.obj.CanBeAttacked) {
		            Debug.Trace("��һ���ϰ���ɱ�����-----");
		            if (nextObj.obj instanceof Barrier) {
		                Debug.Trace("ը����ײ�¼�����:���ϰ���");
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
		        //�����һ���ǲݻ��߿յ�
		        else if (nextObj.obj instanceof EmptyB || nextObj.obj instanceof TodB) {
		            Debug.Trace("ը��ը���ݺͿյ�");
		            if (nextObj.occupier instanceof EnimyTank) {
		                Debug.Trace("���˵л�");
		                //�����Ȳ��жϷ���
		                GameLoad._alreadyKillEnimyNum += 1;
		                if (GameLoad._alreadyKillEnimyNum >= GameLoad._needKillEnimyNum) {
		                    alert("��ϲ����أ�");
		                    clearInterval(GameLoad._gameListener);
		                    return;
		                }
		                //�ѱ�̹��ȥ��
		                UtilityClass.RemoveE(nextObj.occupier, document.getElementById("divMap"));


		                //�������ɵл�̹��
		                var enimyT1 = new EnimyTank();
		                enimyT1.XPosition = 0;
		                enimyT1.YPosition = 0;
		                enimyT1.UpdateUI(this._battleField);
		                GameLoad._enimyTanks.push(enimyT1);

		            }
		            if (nextObj.occupier instanceof SelfTank) {
		                //�����Ȳ��жϷ���ֵ���Ȳ���һ��
		                nextObj.occupier.LifeNum -= 1;
		                //���û���ˣ��ͽ�����Ϸ
		                if (nextObj.occupier.LifeNum <= 0) {
		                    alert("��Ϸ������");
		                    clearInterval(GameLoad._gameListener);
		                    return;
		                }
		            }
		            if (nextObj.occupier instanceof Bomb) {
		                Debug.Trace("����ը��");

		                var ex1 = new Explode();
		                ex1.Play(nextObj.occupier.XPosition, nextObj.occupier.YPosition);
		                nextObj.occupier.Owner.BombUsed -= 1;
		                battleField[nextObj.occupier.YPosition][nextObj.occupier.XPosition].occupier = null;
		                UtilityClass.RemoveE(nextObj.occupier.UI, document.getElementById("divMap"));
		            }
		        }
		    }

		}
	
		//��дHitTest����
		Bomb.prototype.HitTest = function(battleField) {
		    var nextObj = this.GetNextBattleFieldCell(battleField);
		    //Debug.Trace(nextObj instanceof Barrier);
		    //if(nextObj instanceof Bomb)
		    //Debug.Trace(this.XPosition+"--"+this.YPosition);
		    if (nextObj == null) {
		        return true;
		    }
		    //����Ƿ����ϰ���
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
		                    Debug.Trace("ը����ײ��⣺��һ��ռ������̹��");
		                    Debug.Trace(nextObj.occupier instanceof EnimyTank);
		                    return nextObj.occupier instanceof EnimyTank;
		                }
		                else {

		                    return nextObj.occupier instanceof SelfTank;
		                }
		            }

		        }
		        //������ڵ������������ʹ���
		        if (this instanceof Bomb && nextObj.obj instanceof RiverB)
		            return false;
		        //Debug.Trace(nextObj.occupier instanceof Mover);
		        return !nextObj.obj.CanAcross;
		    }

		}
		