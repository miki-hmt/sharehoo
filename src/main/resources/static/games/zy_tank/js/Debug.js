//����
		var Debug={
			Trace:function(str)
			{
				var d=document.createElement("div");
				//d.innerHTML=str + "---time:" + (new Date()).getTime();
				d.innerHTML=str ;//+ "---time:" + (new Date()).getTime();
				document.getElementById("debugInfo").appendChild(d);
			}
			//��ȡ������������
			,GetFuncName:function(func)
			{
				if(typeof(func)!='function')
				{
					throw new Error("�봫function����"); 
				}
				else
				{
					var constFunctionLength=9;
					return func.toString().slice(constFunctionLength,func.toString().indexOf('('));
				}
			}
		}