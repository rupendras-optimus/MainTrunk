var OxO4c8d=["inp_src","btnbrowse","AlternateText","inp_id","longDesc","Align","optNotSet","optLeft","optRight","optTexttop","optAbsMiddle","optBaseline","optAbsBottom","optBottom","optMiddle","optTop","Border","bordercolor","bordercolor_Preview","inp_width","imgLock","inp_height","constrain_prop","HSpace","VSpace","outer","img_demo","onclick","IMG","src","width","height","value","cssText","style","","src_cetemp","id","vspace","hspace","border","borderColor"," ","backgroundColor","align","alt","[[ValidNumber]]","[[ValidID]]","longdesc","checked","Load.ashx?type=image\x26file=locked.gif","Load.ashx?type=image\x26file=1x1.gif","length"];var inp_src=Window_GetElement(window,OxO4c8d[0],true);var btnbrowse=Window_GetElement(window,OxO4c8d[1],true);var AlternateText=Window_GetElement(window,OxO4c8d[2],true);var inp_id=Window_GetElement(window,OxO4c8d[3],true);var longDesc=Window_GetElement(window,OxO4c8d[4],true);var Align=Window_GetElement(window,OxO4c8d[5],true);var optNotSet=Window_GetElement(window,OxO4c8d[6],true);var optLeft=Window_GetElement(window,OxO4c8d[7],true);var optRight=Window_GetElement(window,OxO4c8d[8],true);var optTexttop=Window_GetElement(window,OxO4c8d[9],true);var optAbsMiddle=Window_GetElement(window,OxO4c8d[10],true);var optBaseline=Window_GetElement(window,OxO4c8d[11],true);var optAbsBottom=Window_GetElement(window,OxO4c8d[12],true);var optBottom=Window_GetElement(window,OxO4c8d[13],true);var optMiddle=Window_GetElement(window,OxO4c8d[14],true);var optTop=Window_GetElement(window,OxO4c8d[15],true);var Border=Window_GetElement(window,OxO4c8d[16],true);var bordercolor=Window_GetElement(window,OxO4c8d[17],true);var bordercolor_Preview=Window_GetElement(window,OxO4c8d[18],true);var inp_width=Window_GetElement(window,OxO4c8d[19],true);var imgLock=Window_GetElement(window,OxO4c8d[20],true);var inp_height=Window_GetElement(window,OxO4c8d[21],true);var constrain_prop=Window_GetElement(window,OxO4c8d[22],true);var HSpace=Window_GetElement(window,OxO4c8d[23],true);var VSpace=Window_GetElement(window,OxO4c8d[24],true);var outer=Window_GetElement(window,OxO4c8d[25],true);var img_demo=Window_GetElement(window,OxO4c8d[26],true);btnbrowse[OxO4c8d[27]]=function btnbrowse_onclick(){function Ox35b(Ox13d){if(Ox13d){function Actualsize(){var Ox7c=document.createElement(OxO4c8d[28]);Ox7c[OxO4c8d[29]]=Ox13d;if(Ox7c[OxO4c8d[30]]>0&&Ox7c[OxO4c8d[31]]>0){inp_width[OxO4c8d[32]]=Ox7c[OxO4c8d[30]];inp_height[OxO4c8d[32]]=Ox7c[OxO4c8d[31]];FireUIChanged();} else {setTimeout(Actualsize,400);} ;} ;inp_src[OxO4c8d[32]]=Ox13d;setTimeout(Actualsize,400);} ;} ;editor.SetNextDialogWindow(window);if(Browser_IsSafari()){editor.ShowSelectImageDialog(Ox35b,inp_src.value,inp_src);} else {editor.ShowSelectImageDialog(Ox35b,inp_src.value);} ;} ;UpdateState=function UpdateState_Image(){img_demo[OxO4c8d[34]][OxO4c8d[33]]=element[OxO4c8d[34]][OxO4c8d[33]];if(Browser_IsWinIE()){img_demo.mergeAttributes(element);} ;if(element[OxO4c8d[29]]){img_demo[OxO4c8d[29]]=element[OxO4c8d[29]];} else {img_demo.removeAttribute(OxO4c8d[29]);} ;} ;SyncToView=function SyncToView_Image(){var src;src=element.getAttribute(OxO4c8d[29])+OxO4c8d[35];if(element.getAttribute(OxO4c8d[36])){src=element.getAttribute(OxO4c8d[36])+OxO4c8d[35];} ;inp_src[OxO4c8d[32]]=src;inp_width[OxO4c8d[32]]=element[OxO4c8d[30]];inp_height[OxO4c8d[32]]=element[OxO4c8d[31]];inp_id[OxO4c8d[32]]=element[OxO4c8d[37]];if(element[OxO4c8d[38]]<=0){VSpace[OxO4c8d[32]]=OxO4c8d[35];} else {VSpace[OxO4c8d[32]]=element[OxO4c8d[38]];} ;if(element[OxO4c8d[39]]<=0){HSpace[OxO4c8d[32]]=OxO4c8d[35];} else {HSpace[OxO4c8d[32]]=element[OxO4c8d[39]];} ;Border[OxO4c8d[32]]=element[OxO4c8d[40]];if(Browser_IsWinIE()){bordercolor[OxO4c8d[32]]=element[OxO4c8d[34]][OxO4c8d[41]];} else {var arr=revertColor(element[OxO4c8d[34]].borderColor).split(OxO4c8d[42]);bordercolor[OxO4c8d[32]]=arr[0];} ;bordercolor[OxO4c8d[34]][OxO4c8d[43]]=bordercolor[OxO4c8d[32]]||OxO4c8d[35];bordercolor[OxO4c8d[34]][OxO4c8d[43]]=bordercolor[OxO4c8d[32]];bordercolor_Preview[OxO4c8d[34]][OxO4c8d[43]]=bordercolor[OxO4c8d[32]];Align[OxO4c8d[32]]=element[OxO4c8d[44]];AlternateText[OxO4c8d[32]]=element[OxO4c8d[45]];longDesc[OxO4c8d[32]]=element[OxO4c8d[4]];} ;SyncTo=function SyncTo_Image(element){element[OxO4c8d[29]]=inp_src[OxO4c8d[32]];element.setAttribute(OxO4c8d[36],inp_src.value);element[OxO4c8d[40]]=Border[OxO4c8d[32]];element[OxO4c8d[39]]=HSpace[OxO4c8d[32]];element[OxO4c8d[38]]=VSpace[OxO4c8d[32]];try{element[OxO4c8d[30]]=inp_width[OxO4c8d[32]];element[OxO4c8d[31]]=inp_height[OxO4c8d[32]];} catch(er){alert(OxO4c8d[46]);return false;} ;if(element[OxO4c8d[34]][OxO4c8d[30]]||element[OxO4c8d[34]][OxO4c8d[31]]){try{element[OxO4c8d[34]][OxO4c8d[30]]=inp_width[OxO4c8d[32]];element[OxO4c8d[34]][OxO4c8d[31]]=inp_height[OxO4c8d[32]];} catch(er){alert(OxO4c8d[46]);return false;} ;} ;var Ox374=/[^a-z\d]/i;if(Ox374.test(inp_id.value)){alert(OxO4c8d[47]);return ;} ;element[OxO4c8d[37]]=inp_id[OxO4c8d[32]];element[OxO4c8d[44]]=Align[OxO4c8d[32]];element[OxO4c8d[45]]=AlternateText[OxO4c8d[32]];element[OxO4c8d[4]]=longDesc[OxO4c8d[32]];element[OxO4c8d[34]][OxO4c8d[41]]=bordercolor[OxO4c8d[32]];if(element[OxO4c8d[48]]==OxO4c8d[35]||element[OxO4c8d[48]]==null){element.removeAttribute(OxO4c8d[48]);} ;if(element[OxO4c8d[4]]==OxO4c8d[35]||element[OxO4c8d[4]]==null){element.removeAttribute(OxO4c8d[4]);} ;if(element[OxO4c8d[30]]==0){element.removeAttribute(OxO4c8d[30]);} ;if(element[OxO4c8d[31]]==0){element.removeAttribute(OxO4c8d[31]);} ;if(element[OxO4c8d[39]]==OxO4c8d[35]){element.removeAttribute(OxO4c8d[39]);} ;if(element[OxO4c8d[38]]==OxO4c8d[35]){element.removeAttribute(OxO4c8d[38]);} ;if(element[OxO4c8d[37]]==OxO4c8d[35]){element.removeAttribute(OxO4c8d[37]);} ;if(element[OxO4c8d[44]]==OxO4c8d[35]){element.removeAttribute(OxO4c8d[44]);} ;if(element[OxO4c8d[40]]==OxO4c8d[35]){element.removeAttribute(OxO4c8d[40]);} ;} ;function toggleConstrains(){if(constrain_prop[OxO4c8d[49]]){imgLock[OxO4c8d[29]]=OxO4c8d[50];checkConstrains(OxO4c8d[30]);} else {imgLock[OxO4c8d[29]]=OxO4c8d[51];} ;} ;var checkingConstrains=false;function checkConstrains(Ox79){if(checkingConstrains){return ;} ;checkingConstrains=true;try{var Ox8,Ox2d;if(constrain_prop[OxO4c8d[49]]){var Ox7c=document.createElement(OxO4c8d[28]);Ox7c[OxO4c8d[29]]=inp_src[OxO4c8d[32]];var Ox426=Ox7c[OxO4c8d[30]];var Ox427=Ox7c[OxO4c8d[31]];if((Ox426>0)&&(Ox427>0)){var Ox73=inp_width[OxO4c8d[32]];var Ox72=inp_height[OxO4c8d[32]];if(Ox79==OxO4c8d[30]){if(Ox73[OxO4c8d[52]]==0||isNaN(Ox73)){inp_width[OxO4c8d[32]]=OxO4c8d[35];inp_height[OxO4c8d[32]]=OxO4c8d[35];} else {Ox72=parseInt(Ox73*Ox427/Ox426);inp_height[OxO4c8d[32]]=Ox72;} ;} ;if(Ox79==OxO4c8d[31]){if(Ox72[OxO4c8d[52]]==0||isNaN(Ox72)){inp_width[OxO4c8d[32]]=OxO4c8d[35];inp_height[OxO4c8d[32]]=OxO4c8d[35];} else {Ox73=parseInt(Ox72*Ox426/Ox427);inp_width[OxO4c8d[32]]=Ox73;} ;} ;} ;} ;} finally{checkingConstrains=false;} ;} ;bordercolor[OxO4c8d[27]]=bordercolor_Preview[OxO4c8d[27]]=function bordercolor_onclick(){SelectColor(bordercolor,bordercolor_Preview);} ;