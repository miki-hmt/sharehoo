/*ϵͳ����*/
		
		//��ͼԪ������ö��
        /*
        0���յ�	
        1��ǽ	
        2����	
        3������		
        4����		
        5���ܲ�	
        */
        var EnumMapCellType = { 
			Empty:			'0'
			, Wall:			'1'
			, Steel:		'2'
			, Tod:			'3'
			, River:		'4'
			, Podium:		'5'
 
		};
		var EnumDirection={
			Up:				'0'
			,Right:			'1'
			,Down:			'2'
			,Left:			'3'
		};
		/*
			��ͼ��ÿһ��������ͣ�ŵ���Ʒ����
		
		var EnumCellParkType={
			Tank:			'0'
			,Bomb:			'1'
			,Goods:			'2'
			,Barrier:		'3'
		}
		*/
		var ArrayCss=['empty','wall','steel','tod','river','podium']

       
		/*�ؿ�*/
		var str=  '0000000000000';
			str+=',0011100111010';
			str+=',1000010000200';
			str+=',1200333310101';
			str+=',0000444400001';
			str+=',3313300001011';
			str+=',3011331022011';
			str+=',3311031011011';
			str+=',0101011102010';
			str+=',0101011010010';
			str+=',0100000000110';
			str+=',0100012101101';
			str+=',0010015100000';

		var Top_MapLevel = [str];

		
  /*ϵͳ����*/



		//ͨ�÷�������
		var UtilityClass={
			CreateE:function(type,id,className,parentNode)
			{
				var J=document.createElement(type);
				if(id)J.id=id;
				if(className)J.className=className;
				return parentNode.appendChild(J);
			}
			,RemoveE:function(obj,parentNode)
			{
				//Debug.Trace(parentNode);
				parentNode.removeChild(obj);
			}
			,GetFunctionName:function(context,argumentCallee)
			{
				for(var i in context)if(context[i]==argumentCallee)return i;
				return "";
			}
			,BindFunction:function(obj,func)
			{
				return function(){
					func.apply(obj,arguments);
				};
			}
		}