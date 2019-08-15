dim cardno
dim cardcounter
dim cardid(100)
dim cardtitle(100)
dim cardnumber(100)
dim dspl(100)
dim dotype(100)
dim dolabel(100)
dim txt(100)
dim ontimerfile(100)
dim timervalue(100)
dim gohref(100)
dim wmlfile
dim sourcecode
dim optname
dim optvalue
dim scrolltext
dim goOK
dim backOK
dim nextOK
dim variableOK
dim selecttext
dim prevwmlfile

cardno=1
backOK=false
nextOK=false
variableOK=false

function traverse(this)
if this.id="backbtn" then
	if cardcounter="" then
		exit function
	end if
	if cardno=1 then
		exit function
	end if
	backOK=true
	cardno=cardno-1
	call resetcardat()
	call displaycards()
end if
if this.id="acceptbtn" then
	if cardcounter="" then
		exit function
	end if
	if carddisplay.childnodes(0).nodename="FORM" then
		call getvariable()
	end if
	if cardno="" then
		exit function
	end if
	if cardno=cardcounter then
		exit function
	end if
	if gohref(cardno)<>"" then
		goOK=gohref(cardno)
		if mid(goOK,1,1)="#" then
			goOK=mid(goOK,2,len(goOK))
		end if
		call readcards()
	else
		nextOK=true
		cardno=cardno+1
	end if
	call resetcardat()
	call displaycards()
end if
end function

function fileselect(this)
goOK=""
if this.id="wmlfile" then
	if this.value="caption" then
		exit function
	end if
	prevwmlfile=wmlfile
	wmlfile=this.value
	call resetcardat()
	call readcards()
	cardno=1
	call displaycards()
else
	call resetcardat()
	call readcards()
	cardno=1
	call displaycards()
end if
end function

function readcards()
cardcounter=0
set xmlDoc=CreateObject("Microsoft.XMLDOM")
xmlDoc.async="false"
xmlDoc.load(wmlfile)
if xmlDoc.parseError.errorCode <> 0 then
	alert xmlDoc.parseError.reason
end if
sourcecode=xmlDoc.xml
wml=xmlDoc.childnodes(1).nodename
if wml="wml" then
	for each x in xmlDoc.documentElement.childnodes
		if x.nodename="card" then
			cardcounter=cardcounter+1
			for i=1 to cardcounter
				txt(cardcounter)=""
				cardid(cardcounter)=""
				cardtitle(cardcounter)=""
				dotype(cardcounter)=""
				dolabel(cardcounter)=""
				gohref(cardcounter)=""
				cardnumber(cardcounter)=cardcounter
				if x.getattribute("id")<>"" then
					cardid(cardcounter)=x.getattribute("id")
				end if
				if x.getattribute("title")<>"" then
					cardtitle(cardcounter)=x.getattribute("title")
				end if
				if x.getattribute("ontimer")<>"" then
					ontimerfile(cardcounter)=x.getattribute("ontimer")
					for each y in x.childnodes
						if y.nodename="timer" then
							if y.getattribute("value")<>"" then
								timervalue(cardcounter)=y.getattribute("value")
							end if
						end if
					next
				end if
				set dspl(cardcounter)=x
				for each z in dspl(cardcounter).childnodes
					if z.nodename="do" then
						if z.getattribute("label")<>"" then
							dolabel(cardcounter)=z.getattribute("label")
						else
							dolabel(cardcounter)=""
						end if
						if z.getattribute("type")<>"" then
							dotype(cardcounter)=z.getattribute("type")
						else
							dotype(cardcounter)=""
						end if
						for each y in z.childnodes
							if y.nodename="go" then
								gohref(cardcounter)=y.getattribute("href")
							end if
						next
					end if
					if z.nodename="p" then
						call findnodes(z)
					end if
				next
			next
		end if
	next
end if				
end function
		
function findnodes(z)
radiocount=1
for each y in z.childnodes
	txt(cardcounter)=txt(cardcounter) & y.nodevalue
	if y.nodename="b" then
		txt(cardcounter)=txt(cardcounter) & "<b>" & y.childnodes(0).nodevalue & "</b>"
	end if
	if y.nodename="em" then
		txt(cardcounter)=txt(cardcounter) & "<em>" & y.childnodes(0).nodevalue & "</em>"
	end if
	if y.nodename="strong" then
		txt(cardcounter)=txt(cardcounter) & "<strong>" & y.childnodes(0).nodevalue & "</strong>"
	end if
	if y.nodename="i" then
		txt(cardcounter)=txt(cardcounter) & "<i>" & y.childnodes(0).nodevalue & "</i>"
	end if
	if y.nodename="u" then
		txt(cardcounter)=txt(cardcounter) & "<u>" & y.childnodes(0).nodevalue & "</u>"
	end if
	if y.nodename="big" then
		txt(cardcounter)=txt(cardcounter) & "<big>" & y.childnodes(0).nodevalue & "</big>"
	end if
	if y.nodename="small" then
		txt(cardcounter)=txt(cardcounter) & "<small>" & y.childnodes(0).nodevalue & "</small>"
	end if
	if y.nodename="br" then
		txt(cardcounter)=txt(cardcounter) & "<br/>"
	end if
	if y.nodename="select" then
		txt(cardcounter)=txt(cardcounter) & "<form name='formname'>"
		optname=y.getattribute("name")
		multiple=y.getattribute("multiple")
		if multiple="true" then
			for each w in y.childnodes
				if w.nodename="option" then
					optvalue=w.getattribute("value")
					txt(cardcounter)=txt(cardcounter) & "<input value='" & optvalue & "' type='checkbox' name='" & optname & "'>" & w.childnodes(0).nodevalue & "<br/>"
				end if
			next
		else
			for each w in y.childnodes
				if w.nodename="option" then
					optvalue=w.getattribute("value")
					if radiocount=1 then
						txt(cardcounter)=txt(cardcounter) & "<input checked value='" & optvalue & "' type='radio' name='" & optname & "'>" & w.childnodes(0).nodevalue & "<br/>"
					else
						txt(cardcounter)=txt(cardcounter) & "<input value='" & optvalue & "' type='radio' name='" & optname & "'>" & w.childnodes(0).nodevalue & "<br/>"
					end if
					radiocount=radiocount+1
				end if
			next
		end if
		txt(cardcounter)=txt(cardcounter) & "</form>"
	end if
	if y.nodename="table" then
		txt(cardcounter)=txt(cardcounter) & "<table>"
		for each w in y.childnodes
			if w.nodename="tr" then
				txt(cardcounter)=txt(cardcounter) & "<tr>"
				for each v in w.childnodes
					txt(cardcounter)=txt(cardcounter) & "<td>" & v.childnodes(0).nodevalue & "</td>"
				next
			end if
		next
		txt(cardcounter)=txt(cardcounter) & "</tr></table>"
	end if
	if y.nodename="input" then
		inputname=y.getattribute("name")
		inputsize=y.getattribute("size")
		txt(cardcounter)=txt(cardcounter) & "<input class='wapdemo' type='text' size='" & inputsize & "' name='" & inputname & "'>" & y.nodevalue & "<br/>"
	end if
	if y.nodename="fieldset" then
		fldtitle=y.getattribute("title")
		txt(cardcounter)=txt(cardcounter) & "<fieldset><legend>" & fldtitle & "</legend>" & y.nodevalue & "<br/>"
		call findnodes(y)
		txt(cardcounter)=txt(cardcounter) & "</fieldset>"
	end if
	if y.nodename="a" then
		wmlfile=y.getattribute("href")
		txt(cardcounter)=txt(cardcounter) & "<u><a onclick='fileselect(this)' onmouseover='cursorhand(this)'>" & y.childnodes(0).nodevalue & "</a></u>"
	end if
	if y.nodename="anchor" then
		for each w in y.childnodes
			if w.nodename="go" then
				wmlfile=w.getattribute("href")
			end if
			if w.nodename="prev" then
				if prevwmlfile<>"" then
					wmlfile=prevwmlfile
				end if
			end if
			if w.nodename="refresh" then
				wmlfile=wmlfile
			end if
		next
	txt(cardcounter)=txt(cardcounter) & "<u><a onclick='fileselect(this)' onmouseover='cursorhand(this)'>" & y.childnodes(0).nodevalue & "</a></u>"
	end if
	if y.nodename="img" then
		imgsrc=y.getattribute("src")
		imgalt=y.getattribute("alt")
	txt(cardcounter)=txt(cardcounter) & "<img src='" & imgsrc & "' alt='" & imgalt & "'/>"
	end if
next
end function

Function displaycards()
if myform.myinput.value<>"" then
	variableOK=true
	selecttext=myform.myinput.value
end if
source.innerText=sourcecode
if goOK<>"" and backOK=false and nextOK=false then
	for i = 1 to cardcounter
		if goOK=cardid(i) then
			cardno=cardnumber(i)
			if cardtitle(i)<>"" then
				titledisplay.innerHTML="<b>" & cardtitle(i) & "</b>"
			else
				titledisplay.innerHTML="&nbsp;"
			end if
			if txt(i)<>"" then
				if variableOK=true then
					for k=1 to len(txt(i))
						pxp=mid(txt(i),k,1)
						if pxp="$" then
							pxp=selecttext
							k=k+(len(txt(i))-k)
						end if
						text=text & pxp
					next
					carddisplay.innerHTML=text
				else
					carddisplay.innerHTML=txt(i)
				end if
			else
				carddisplay.innerHTML="&nbsp;"
			end if
			if dolabel(i)<>"" then
				acceptdisplay.innerHTML="<b>" & dolabel(i) & "</b>"
			else
				if cardcounter>1 and i<cardcounter then
					acceptdisplay.innerHTML="<b>Next</b>"
				else
					acceptdisplay.innerHTML="&nbsp;"
				end if
			end if
			if i>1 then
				backdisplay.innerHTML="<b>Back</b>"
			else
				backdisplay.innerHTML="&nbsp;"
			end if
			if ontimerfile(i)<>"" and timervalue(i)<>"" then
				call cardtimer(ontimerfile(i),timervalue(i))
				ontimerfile(i)=""
				timervalue(i)=""
			end if
		end if
	next
	backOK=false
	nextOK=false
else
	if cardtitle(cardno)<>"" then
		titledisplay.innerHTML="<b>" & cardtitle(cardno) & "</b>"
	else
		titledisplay.innerHTML="&nbsp;"
	end if
	if txt(cardno)<>"" then
		carddisplay.innerHTML=txt(cardno)
	else
		carddisplay.innerHTML="&nbsp;"
	end if
	if dolabel(cardno)<>"" then
		acceptdisplay.innerHTML="<b>" & dolabel(cardno) & "</b>"
	else
		if cardcounter>1 and cardno<cardcounter then
			acceptdisplay.innerHTML="<b>Next</b>"
		else
			acceptdisplay.innerHTML="&nbsp;"
		end if
	end if
	if cardno>1 then
		backdisplay.innerHTML="<b>Back</b>"
	else
		backdisplay.innerHTML="&nbsp;"
	end if
	if ontimerfile(cardno)<>"" and timervalue(cardno)<>"" then
		call cardtimer(ontimerfile(cardno),timervalue(cardno))
		ontimerfile(cardno)=""
		timervalue(cardno)=""
	end if
	backOK=false
	nextOK=false
end if	
end function
