var OxO3541=["inp_width","inp_height","sel_align","sel_valign","inp_bgColor","inp_borderColor","inp_borderColorLight","inp_borderColorDark","inp_class","inp_id","inp_tooltip","sel_noWrap","sel_CellScope","value","bgColor","backgroundColor","style","id","borderColor","borderColorLight","borderColorDark","className","width","height","align","vAlign","title","noWrap","scope","[[ValidNumber]]","[[ValidID]]","","class","valign","onclick"];var inp_width=Window_GetElement(window,OxO3541[0],true);var inp_height=Window_GetElement(window,OxO3541[1],true);var sel_align=Window_GetElement(window,OxO3541[2],true);var sel_valign=Window_GetElement(window,OxO3541[3],true);var inp_bgColor=Window_GetElement(window,OxO3541[4],true);var inp_borderColor=Window_GetElement(window,OxO3541[5],true);var inp_borderColorLight=Window_GetElement(window,OxO3541[6],true);var inp_borderColorDark=Window_GetElement(window,OxO3541[7],true);var inp_class=Window_GetElement(window,OxO3541[8],true);var inp_id=Window_GetElement(window,OxO3541[9],true);var inp_tooltip=Window_GetElement(window,OxO3541[10],true);var sel_noWrap=Window_GetElement(window,OxO3541[11],true);var sel_CellScope=Window_GetElement(window,OxO3541[12],true);SyncToView=function SyncToView_Td(){inp_bgColor[OxO3541[13]]=element.getAttribute(OxO3541[14])||element[OxO3541[16]][OxO3541[15]];inp_id[OxO3541[13]]=element.getAttribute(OxO3541[17]);inp_bgColor[OxO3541[16]][OxO3541[15]]=inp_bgColor[OxO3541[13]];inp_borderColor[OxO3541[13]]=element.getAttribute(OxO3541[18]);inp_borderColor[OxO3541[16]][OxO3541[15]]=inp_borderColor[OxO3541[13]];inp_borderColorLight[OxO3541[13]]=element.getAttribute(OxO3541[19]);inp_borderColorLight[OxO3541[16]][OxO3541[15]]=inp_borderColorLight[OxO3541[13]];inp_borderColorDark[OxO3541[13]]=element.getAttribute(OxO3541[20]);inp_borderColorDark[OxO3541[16]][OxO3541[15]]=inp_borderColorDark[OxO3541[13]];inp_class[OxO3541[13]]=element[OxO3541[21]];inp_width[OxO3541[13]]=element.getAttribute(OxO3541[22])||element[OxO3541[16]][OxO3541[22]];inp_height[OxO3541[13]]=element.getAttribute(OxO3541[23])||element[OxO3541[16]][OxO3541[23]];sel_align[OxO3541[13]]=element.getAttribute(OxO3541[24]);sel_valign[OxO3541[13]]=element.getAttribute(OxO3541[25]);inp_tooltip[OxO3541[13]]=element.getAttribute(OxO3541[26]);sel_noWrap[OxO3541[13]]=element.getAttribute(OxO3541[27]);sel_CellScope[OxO3541[13]]=element.getAttribute(OxO3541[28]);} ;SyncTo=function SyncTo_Td(element){if(inp_bgColor[OxO3541[13]]){if(element[OxO3541[16]][OxO3541[15]]){element[OxO3541[16]][OxO3541[15]]=inp_bgColor[OxO3541[13]];} else {element[OxO3541[14]]=inp_bgColor[OxO3541[13]];} ;} else {element.removeAttribute(OxO3541[14]);} ;element[OxO3541[18]]=inp_borderColor[OxO3541[13]];element[OxO3541[19]]=inp_borderColorLight[OxO3541[13]];element[OxO3541[20]]=inp_borderColorDark[OxO3541[13]];element[OxO3541[21]]=inp_class[OxO3541[13]];if(element[OxO3541[16]][OxO3541[22]]||element[OxO3541[16]][OxO3541[23]]){try{element[OxO3541[16]][OxO3541[22]]=inp_width[OxO3541[13]];element[OxO3541[16]][OxO3541[23]]=inp_height[OxO3541[13]];} catch(er){alert(OxO3541[29]);} ;} else {try{element[OxO3541[22]]=inp_width[OxO3541[13]];element[OxO3541[23]]=inp_height[OxO3541[13]];} catch(er){alert(OxO3541[29]);} ;} ;var Ox374=/[^a-z\d]/i;if(Ox374.test(inp_id.value)){alert(OxO3541[30]);return ;} ;element[OxO3541[24]]=sel_align[OxO3541[13]];element[OxO3541[17]]=inp_id[OxO3541[13]];element[OxO3541[25]]=sel_valign[OxO3541[13]];element[OxO3541[27]]=sel_noWrap[OxO3541[13]];element[OxO3541[26]]=inp_tooltip[OxO3541[13]];element[OxO3541[28]]=sel_CellScope[OxO3541[13]];if(element[OxO3541[17]]==OxO3541[31]){element.removeAttribute(OxO3541[17]);} ;if(element[OxO3541[28]]==OxO3541[31]){element.removeAttribute(OxO3541[28]);} ;if(element[OxO3541[27]]==OxO3541[31]){element.removeAttribute(OxO3541[27]);} ;if(element[OxO3541[14]]==OxO3541[31]){element.removeAttribute(OxO3541[14]);} ;if(element[OxO3541[18]]==OxO3541[31]){element.removeAttribute(OxO3541[18]);} ;if(element[OxO3541[19]]==OxO3541[31]){element.removeAttribute(OxO3541[19]);} ;if(element[OxO3541[7]]==OxO3541[31]){element.removeAttribute(OxO3541[7]);} ;if(element[OxO3541[21]]==OxO3541[31]){element.removeAttribute(OxO3541[21]);} ;if(element[OxO3541[21]]==OxO3541[31]){element.removeAttribute(OxO3541[32]);} ;if(element[OxO3541[24]]==OxO3541[31]){element.removeAttribute(OxO3541[24]);} ;if(element[OxO3541[25]]==OxO3541[31]){element.removeAttribute(OxO3541[33]);} ;if(element[OxO3541[26]]==OxO3541[31]){element.removeAttribute(OxO3541[26]);} ;if(element[OxO3541[22]]==OxO3541[31]){element.removeAttribute(OxO3541[22]);} ;if(element[OxO3541[23]]==OxO3541[31]){element.removeAttribute(OxO3541[23]);} ;} ;inp_borderColor[OxO3541[34]]=function inp_borderColor_onclick(){SelectColor(inp_borderColor);} ;inp_bgColor[OxO3541[34]]=function inp_bgColor_onclick(){SelectColor(inp_bgColor);} ;inp_borderColorLight[OxO3541[34]]=function inp_borderColorLight_onclick(){SelectColor(inp_borderColorLight);} ;inp_borderColorDark[OxO3541[34]]=function inp_borderColorDark_onclick(){SelectColor(inp_borderColorDark);} ;