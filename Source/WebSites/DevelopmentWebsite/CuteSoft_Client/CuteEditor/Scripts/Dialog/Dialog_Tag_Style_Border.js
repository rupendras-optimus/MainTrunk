var OxOb530=["SetStyle","length","","GetStyle","GetText",":",";","cssText","div_selector_event","div_selector","sel_part","tb_margin","sel_margin_unit","tb_padding","sel_padding_unit","tb_border","sel_border_unit","sel_border","sel_style","inp_color","inp_color_Preview","outer","div_demo","offsetWidth","offsetHeight","Top","Left","Bottom","Right","onmousemove","runtimeStyle","border","4px solid red","style","onmouseout","onclick","value","onchange","disabled","selectedIndex","4px solid blue","-","Color"," ","#7f7c75","backgroundColor","Style","Width","options","margin","padding"];function pause(Ox4a0){var Oxa7= new Date();var Ox4a1=Oxa7.getTime()+Ox4a0;while(true){Oxa7= new Date();if(Oxa7.getTime()>Ox4a1){return ;} ;} ;} ;function StyleClass(Ox200){var Ox4a3=[];var Ox4a4={};if(Ox200){Ox4a9();} ;this[OxOb530[0]]=function SetStyle(name,Ox4f,Ox4a6){name=name.toLowerCase();for(var i=0;i<Ox4a3[OxOb530[1]];i++){if(Ox4a3[i]==name){break ;} ;} ;Ox4a3[i]=name;Ox4a4[name]=Ox4f?(Ox4f+(Ox4a6||OxOb530[2])):OxOb530[2];} ;this[OxOb530[3]]=function GetStyle(name){name=name.toLowerCase();return Ox4a4[name]||OxOb530[2];} ;this[OxOb530[4]]=function Ox4a8(){var Ox200=OxOb530[2];for(var i=0;i<Ox4a3[OxOb530[1]];i++){var Ox27=Ox4a3[i];var p=Ox4a4[Ox27];if(p){Ox200+=Ox27+OxOb530[5]+p+OxOb530[6];} ;} ;return Ox200;} ;function Ox4a9(){var arr=Ox200.split(OxOb530[6]);for(var i=0;i<arr[OxOb530[1]];i++){var p=arr[i].split(OxOb530[5]);var Ox27=p[0].replace(/^\s+/g,OxOb530[2]).replace(/\s+$/g,OxOb530[2]).toLowerCase();Ox4a3[Ox4a3[OxOb530[1]]]=Ox27;Ox4a4[Ox27]=p[1];} ;} ;} ;function GetStyle(Ox136,name){return  new StyleClass(Ox136.cssText).GetStyle(name);} ;function SetStyle(Ox136,name,Ox4f,Ox4aa){var Ox4ab= new StyleClass(Ox136.cssText);Ox4ab.SetStyle(name,Ox4f,Ox4aa);Ox136[OxOb530[7]]=Ox4ab.GetText();} ;function ParseFloatToString(Ox24){var Ox8=parseFloat(Ox24);if(isNaN(Ox8)){return OxOb530[2];} ;return Ox8+OxOb530[2];} ;var div_selector_event=Window_GetElement(window,OxOb530[8],true);var div_selector=Window_GetElement(window,OxOb530[9],true);var sel_part=Window_GetElement(window,OxOb530[10],true);var tb_margin=Window_GetElement(window,OxOb530[11],true);var sel_margin_unit=Window_GetElement(window,OxOb530[12],true);var tb_padding=Window_GetElement(window,OxOb530[13],true);var sel_padding_unit=Window_GetElement(window,OxOb530[14],true);var tb_border=Window_GetElement(window,OxOb530[15],true);var sel_border_unit=Window_GetElement(window,OxOb530[16],true);var sel_border=Window_GetElement(window,OxOb530[17],true);var sel_style=Window_GetElement(window,OxOb530[18],true);var inp_color=Window_GetElement(window,OxOb530[19],true);var inp_color_Preview=Window_GetElement(window,OxOb530[20],true);var outer=Window_GetElement(window,OxOb530[21],true);var div_demo=Window_GetElement(window,OxOb530[22],true);function GetPartFromEvent(){var src=Event_GetSrcElement();var x=Event_GetOffsetX();var y=Event_GetOffsetY();if(src==div_selector){x+=10;y+=10;} ;var Ox11=15-x;var Oxa=x-(div_selector_event[OxOb530[23]]-15);var Ox12=15-y;var b=y-(div_selector_event[OxOb530[24]]-15);if(Ox11>0){if(Ox12>0){return Ox11>Ox12?OxOb530[25]:OxOb530[26];} ;if(b>0){return Ox11>b?OxOb530[27]:OxOb530[26];} ;return OxOb530[26];} ;if(Oxa>0){if(Ox12>0){return Oxa>Ox12?OxOb530[25]:OxOb530[28];} ;if(b>0){return Oxa>b?OxOb530[27]:OxOb530[28];} ;return OxOb530[28];} ;if(Ox12>0){return OxOb530[25];} ;if(b>0){return OxOb530[27];} ;return OxOb530[2];} ;div_selector_event[OxOb530[29]]=function div_selector_event_onmousemove(){var Ox4c3=GetPartFromEvent();if(Browser_IsWinIE()){div_selector[OxOb530[30]][OxOb530[7]]=OxOb530[2];div_selector[OxOb530[30]][OxOb530[31]+Ox4c3]=OxOb530[32];} else {div_selector[OxOb530[33]][OxOb530[7]]=OxOb530[2];div_selector[OxOb530[33]][OxOb530[31]+Ox4c3]=OxOb530[32];} ;} ;div_selector_event[OxOb530[34]]=function div_selector_event_onmouseout(){if(Browser_IsWinIE()){div_selector[OxOb530[30]][OxOb530[7]]=OxOb530[2];} else {div_selector[OxOb530[33]][OxOb530[7]]=OxOb530[2];} ;} ;div_selector_event[OxOb530[35]]=function div_selector_event_onclick(){sel_part[OxOb530[36]]=GetPartFromEvent();SyncToViewInternal();UpdateState();} ;sel_part[OxOb530[37]]=function sel_part_onchange(){SyncToViewInternal();UpdateState();} ;UpdateState=function UpdateState_Border(){tb_border[OxOb530[38]]=sel_border_unit[OxOb530[38]]=(sel_border[OxOb530[39]]>0);div_demo[OxOb530[33]][OxOb530[7]]=element[OxOb530[33]][OxOb530[7]];div_selector[OxOb530[33]][OxOb530[7]]=OxOb530[2];div_selector[OxOb530[33]][OxOb530[31]+(sel_part[OxOb530[36]]||OxOb530[2])]=OxOb530[40];} ;SyncToView=function SyncToView_Border(){var Ox4c3=sel_part[OxOb530[36]];var Ox4c4=Ox4c3?OxOb530[41]+Ox4c3:Ox4c3;if(Browser_IsWinIE()){inp_color[OxOb530[36]]=element[OxOb530[33]][OxOb530[31]+Ox4c3+OxOb530[42]];} else {var arr=revertColor(element[OxOb530[33]][OxOb530[31]+Ox4c3+OxOb530[42]]).split(OxOb530[43]);if(arr[0]!=OxOb530[44]){inp_color[OxOb530[36]]=arr[0];} ;} ;inp_color[OxOb530[33]][OxOb530[45]]=inp_color[OxOb530[36]];sel_style[OxOb530[36]]=element[OxOb530[33]][OxOb530[31]+Ox4c3+OxOb530[46]];sel_border[OxOb530[36]]=element[OxOb530[33]][OxOb530[31]+Ox4c3+OxOb530[47]];var Ox5cd=element[OxOb530[33]][OxOb530[31]+Ox4c3+OxOb530[47]];tb_border[OxOb530[36]]=ParseFloatToString(Ox5cd);if(tb_border[OxOb530[36]]){for(var i=0;i<sel_border_unit[OxOb530[48]][OxOb530[1]];i++){var Ox141=sel_border_unit[OxOb530[48]][i][OxOb530[36]];if(Ox141&&Ox5cd.indexOf(Ox141)!=-1){sel_border_unit[OxOb530[39]]=i;break ;} ;} ;} ;var Ox5ce=element[OxOb530[33]][OxOb530[49]+Ox4c3];tb_margin[OxOb530[36]]=ParseFloatToString(Ox5ce);if(tb_margin[OxOb530[36]]){for(var i=0;i<sel_margin_unit[OxOb530[48]][OxOb530[1]];i++){var Ox141=sel_margin_unit[OxOb530[48]][i][OxOb530[36]];if(Ox141&&Ox5ce.indexOf(Ox141)!=-1){sel_margin_unit[OxOb530[39]]=i;break ;} ;} ;} ;var Ox5cf=element[OxOb530[33]][OxOb530[50]+Ox4c3];tb_padding[OxOb530[36]]=ParseFloatToString(Ox5cf);if(tb_padding[OxOb530[36]]){for(var i=0;i<sel_padding_unit[OxOb530[48]][OxOb530[1]];i++){var Ox141=sel_padding_unit[OxOb530[48]][i][OxOb530[36]];if(Ox141&&Ox5cf.indexOf(Ox141)!=-1){sel_padding_unit[OxOb530[39]]=i;break ;} ;} ;} ;} ;SyncTo=function SyncTo_Border(element){var Ox4c3=sel_part[OxOb530[36]];var Ox4c4=Ox4c3?OxOb530[41]+Ox4c3:Ox4c3;var Ox4c5=OxOb530[2];if(sel_border[OxOb530[39]]>0){Ox4c5=sel_border[OxOb530[36]];} else {if(ParseFloatToString(tb_border.value)){Ox4c5=ParseFloatToString(tb_border.value)+sel_border_unit[OxOb530[36]];} else {Ox4c5=OxOb530[2];} ;} ;var Oxdb=inp_color[OxOb530[36]]||OxOb530[2];var Ox136=sel_style[OxOb530[36]]||OxOb530[2];if(Ox4c5||Ox136){SetStyle(element.style,OxOb530[31]+Ox4c4,Ox4c5+OxOb530[43]+Ox136+OxOb530[43]+Oxdb);} else {SetStyle(element.style,OxOb530[31]+Ox4c4,OxOb530[2]);} ;SetStyle(element.style,OxOb530[49]+Ox4c4,ParseFloatToString(tb_margin.value),sel_margin_unit.value);SetStyle(element.style,OxOb530[50]+Ox4c4,ParseFloatToString(tb_padding.value),sel_padding_unit.value);} ;inp_color[OxOb530[35]]=inp_color_Preview[OxOb530[35]]=function inp_color_onclick(){SelectColor(inp_color,inp_color_Preview);} ;