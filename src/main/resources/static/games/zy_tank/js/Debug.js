//调试
		var Debug={
			Trace:function(str)
			{
				var d=document.createElement("div");
				//d.innerHTML=str + "---time:" + (new Date()).getTime();
				d.innerHTML=str ;//+ "---time:" + (new Date()).getTime();
				document.getElementById("debugInfo").appendChild(d);
			}
			//获取函数（对象）名
			,GetFuncName:function(func)
			{
				if(typeof(func)!='function')
				{
					throw new Error("请传function对象"); 
				}
				else
				{
					var constFunctionLength=9;
					return func.toString().slice(constFunctionLength,func.toString().indexOf('('));
				}
			}
		}