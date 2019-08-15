var aryNew = new Array();
var weiAd=new Array(
'<li><a href="http://wx.9ku.com/ceshi/55/?500shou"><div class="t-i"><img src="55.jpg"/*tpa=http://wx.9ku.com/ceshi/i/iconSmall/100/55.jpg*/ /></div><h3 style="color:#f00;">测测你是一夜几次郎</h3><i class="iconYouxi">游戏</i><p>郎君，你是我见过最棒的男人，你击败了99%的男人，​奥巴马和金正恩都惊呆了！</p></a></li>',

'<li><a href="http://wx.9ku.com/ceshi/ceshi/57/?500shou"><div class="t-i"><img src="57.jpg"/*tpa=http://wx.9ku.com/ceshi/i/iconSmall/100/57.jpg*/ /></div><h3 style="color:#00f;">高智商手机魔术，读心术敢挑战吗？</h3><i class="iconYouxi">超火</i><p>微信爆红手机魔术“读心术”，瞬间猜出你所想！</p></a></li>',

'<li><a href="http://wx.9ku.com/ceshi/1/?500shou"><div class="t-i"><img src="1.jpg"/*tpa=http://wx.9ku.com/ceshi/i/iconSmall/100/1.jpg*/></div><i class="iconCeshi">测试</i><h3 style="color:#f00;">测测你的人品值多少钱？</h3><p>我的人品竟然价值值5000块、小四的人品人品才值3块5！</p></a></li>',

'<li><a href="http://wx.9ku.com/ceshi/3/?500shou"><div class="t-i"><img src="3.jpg"/*tpa=http://wx.9ku.com/ceshi/i/iconSmall/100/3.jpg*/></div><h3 style="color:#00f;">测测你五年后会开什么样的车？</h3><i class="iconTuijian">热门</i>  <p>王小二五年后会开保时捷911，尼玛的我竟然才开捷达王！</p></a></li>',

'<li><a href="http://wx.9ku.com/ceshi/52/?500shou"><div class="t-i"><img src="52.jpg"/*tpa=http://wx.9ku.com/ceshi/i/iconSmall/100/52.jpg*/></div><h3 style="color:#00f;">3D版熊出没，倒着跑！</h3><i class="iconYouxi">游戏</i><p>超华丽跑酷《3D熊出没》，你能跑多远？</p></a></li>',

'<li><a href="http://wx.9ku.com/ceshi/21/?500shou"><div class="t-i"><img src="21.jpg"/*tpa=http://wx.9ku.com/ceshi/i/iconSmall/100/21.jpg*/></div><h3 style="color:#00f;">2014年微信最火小青蛙过河游戏</h3><i class="iconYouxi">游戏</i><p>智商大挑战啊！！！我仅用了10秒，快来挑战我的巅峰吧！</p></a></li>',

'<li><a href="-500shou.htm"/*tpa=http://wx.9ku.com/ceshi/22/?500shou*/><div class="t-i"><img src="22-1.jpg"/*tpa=http://wx.9ku.com/ceshi/i/iconSmall/100/22.jpg*/></div><h3 style="color:#00f;">最新IQ智商测试，挑战一下？</h3><i class="iconYouxi">游戏</i><p>经过测试我的智商是50分，你也来测一下，比比看谁高！</p></a></li>',
	   
'<li><a href="http://wx.9ku.com/ceshi/ceshi/55/?500shou"><div class="t-i"><img src="55.jpg"/*tpa=http://wx.9ku.com/ceshi/i/iconSmall/100/55.jpg*/ /></div><h3 style="color:#f00;">测测你是一夜几次郎</h3><i class="iconYouxi">游戏</i><p>郎君，你是我见过最棒的男人，你击败了99%的男人，​奥巴马和金正恩都惊呆了！</p></a></li>',	   
	   
'<li><a href="http://wx.9ku.com/ceshi/6/?500shou"><div class="t-i"><img src="6.jpg"/*tpa=http://wx.9ku.com/ceshi/i/iconSmall/100/6.jpg*/></div><h3 style="color:#00f;">测一测你未来的身价是多少？</h3><i class="iconTuijian">热门</i><p>经鉴定我未来的身价是2套北京8环别墅，8环在哪里？难道是河北小村庄？</p></a></li>',

'<li><a href="http://wx.9ku.com/ceshi/10/?500shou"><div class="t-i"><img src="10.jpg"/*tpa=http://wx.9ku.com/ceshi/i/iconSmall/100/10.jpg*/></div><h3 style="color:#f00;">测测你前世是什么人？</h3><i class="iconCeshi">测试</i><p>我的前世是居然是将军，隔壁小妹的前世居然是老鸨。。。</p></a></li>',
	   
'<li><a href="http://wx.9ku.com/ceshi/19/?500shou"><div class="t-i"><img src="19.jpg"/*tpa=http://wx.9ku.com/ceshi/i/iconSmall/100/19.jpg*/></div><h3 style="color:#090;">测你这辈子注定靠什么吃饭？</h3><i class="iconCeshi">测试</i><p>我这辈子竟然靠异性吃饭，我长得像小白脸吗我。。。</p></a></li>',
	   
'<li><a href="http://wx.9ku.com/ceshi/24/?500shou"><div class="t-i"><img src="24.jpg"/*tpa=http://wx.9ku.com/ceshi/i/iconSmall/100/24.jpg*/></div><h3 style="color:#f00;">2048，停不下来的智商游戏挑战！</h3><i class="iconYouxi">游戏</i><p>我在挑战2048中获得了第一名，你能超越我吗？快来挑战吧！</p></a></li>',
	   
'<li><a href="http://wx.9ku.com/ceshi/25/?500shou"><div class="t-i"><img src="25.jpg"/*tpa=http://wx.9ku.com/ceshi/i/iconSmall/100/25.jpg*/></div><h3 style="color:#00f;">测测你未来的小孩什么样！</h3><i class="iconCeshi">测试</i><p>原来你未来的小孩是这个样子的呀，快来揭开面纱！摸一摸有惊喜！</p></a></li>',
	   
'<li><a href="http://wx.9ku.com/ceshi/30/?500shou"><div class="t-i"><img src="30.jpg"/*tpa=http://wx.9ku.com/ceshi/i/iconSmall/100/30.jpg*/></div><h3 style="color:#090;">世界上最准的心理年龄测试？</h3><i class="iconCeshi">测试</i><p>我的您的心理年龄34岁，与我的实际年龄差10岁！原来我早老了！</p></a></li>',

'<li><a href="http://wx.9ku.com/ceshi/34/?500shou"><div class="t-i"><img src="34.jpg"/*tpa=http://wx.9ku.com/ceshi/i/iconSmall/100/34.jpg*/></div><h3 style="color:#00f;">测你的微信值多少钱？</h3><i class="iconCeshi">测试</i><p>我的微信竟然值1000元！太厉害了！</p></a></li>',

'<li><a href="http://wx.9ku.com/ceshi/46?formlist"><div class="t-i"><img src="46.jpg"/*tpa=http://wx.9ku.com/ceshi/i/iconSmall/100/46.jpg*/></div><h3 style="color:#f00;">测测穿越回古代你会是谁？</h3><i class="iconCeshi">测试</i><p>我穿越到了明朝，变成了唐伯虎，才华出众，有理想抱负，是位天才画家。</p></a></li>',	   
	   
'<li><a href="http://wx.9ku.com/ceshi/47?formlist"><div class="t-i"><img src="47.jpg"/*tpa=http://wx.9ku.com/ceshi/i/iconSmall/100/47.jpg*/></div><h3 style="color:#f00;">测一测你最像哪位明星？</h3><i class="iconCeshi">测试</i><p>原来我与范冰冰最像，性格豪爽，乐观开朗，工作认真，有爱心。</p></a></li>',   	   
	   
'<li><a href="http://wx.9ku.com/ceshi/49/?500shou"><div class="t-i"><img src="49.jpg"/*tpa=http://wx.9ku.com/ceshi/i/iconSmall/100/49.jpg*/></div><h3 style="color:#f00;">我跳跳跳，是男人就来跳下！</h3><i class="iconYouxi">游戏</i><p>创意跳高游戏，快来一起跳。</p></a></li>',

'<li><a href="http://wx.9ku.com/ceshi/50/?500shou"><div class="t-i"><img src="50.jpg"/*tpa=http://wx.9ku.com/ceshi/i/iconSmall/100/50.jpg*/></div><h3 style="color:#f00;">最强眼力，眼瞎了！</h3><i class="iconYouxi">游戏</i><p>不玩《最强眼力》怎么知道自己的眼力原来那么好？</p></a></li>',

'<li><a href="http://wx.9ku.com/ceshi/51/?500shou"><div class="t-i"><img src="51.jpg"/*tpa=http://wx.9ku.com/ceshi/i/iconSmall/100/51.jpg*/></div><h3 style="color:#00f;">密室逃脱，测测你的反应能力！</h3><i class="iconYouxi">游戏</i><p>变态考反应游戏《密室逃脱》能通关你就能闪子弹了！</p></a></li>',

'<li><a href="http://wx.9ku.com/ceshi/53/?500shou"><div class="t-i"><img src="53.jpg"/*tpa=http://wx.9ku.com/ceshi/i/iconSmall/100/53.jpg*/></div><h3 style="color:#00f;">Flappy 2048</h3><i class="iconYouxi">游戏</i><p>比2048和Flappy Bird还要虐心的游戏我已经玩到29933分啦！速度来挑战我！</p></a></li>',
	   
'<li><a href="http://wx.9ku.com/ceshi/48/?500shou"><div class="t-i"><img src="48.jpg"/*tpa=http://wx.9ku.com/ceshi/i/iconSmall/100/48.jpg*/></div><h3 style="color:#090;">经典小游戏，别踩白块儿！</h3><i class="iconYouxi">游戏</i><p>玩了一下就停不下来了，可以练习你左右脑的灵活性。</p></a></li>'

	);
var s01=weiAd.length
while(aryNew.length < 8)
{
 var tmp =weiAd[parseInt(Math.random()*s01)]
 var b = false;
 for (var i=0; i<aryNew.length; i++)
 {
  if (aryNew[i] == tmp)
  {
   b = true;
   break;
  }
 }
 if (!b)
  aryNew[aryNew.length] = tmp;
}


document.write('<link rel="stylesheet" type="text/css" href="weiList.css"/*tpa=http://wx.9ku.com/ceshi/css/weiList.css*//>');
document.write('<div class="zzwrapper" id="zzwrapper">');
document.write('<div class="zzheader"><h1>五千万人玩过的微信小游戏↓↓</h1></div>');
document.write('<div class="weiList" id="weiList">');
document.write('<ul>');
document.write(aryNew[0]);
document.write(aryNew[1]);
document.write(aryNew[2]);
document.write('</ul>');
document.write('</div>');
document.write('</div>');