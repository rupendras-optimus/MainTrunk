var OxO6596=["Verdana","innerHTML","Unicode","innerText","\x3Cspan style=\x27font-family:","\x27\x3E","\x3C/span\x3E","selfont","length","checked","value","charstable1","charstable2","fontFamily","style","display","block","none"];var editor=Window_GetDialogArguments(window);function getchar(obj){var Ox2d;var Ox2e=getFontValue()||OxO6596[0];if(!obj[OxO6596[1]]){return ;} ;Ox2d=obj[OxO6596[1]];if(Ox2e==OxO6596[2]){Ox2d=obj[OxO6596[3]];} else {if(Ox2e!=OxO6596[0]){Ox2d=OxO6596[4]+Ox2e+OxO6596[5]+obj[OxO6596[1]]+OxO6596[6];} ;} ;editor.PasteHTML(Ox2d);Window_CloseDialog(window);} ;function cancel(){Window_CloseDialog(window);} ;function getFontValue(){var Ox31=document.getElementsByName(OxO6596[7]);for(var i=0;i<Ox31[OxO6596[8]];i++){if(Ox31.item(i)[OxO6596[9]]){return Ox31.item(i)[OxO6596[10]];} ;} ;} ;function sel_font_change(){var Ox33=getFontValue()||OxO6596[0];var Ox37b=Window_GetElement(window,OxO6596[11],true);var Ox37c=Window_GetElement(window,OxO6596[12],true);Ox37b[OxO6596[14]][OxO6596[13]]=Ox33;Ox37b[OxO6596[14]][OxO6596[15]]=(Ox33!=OxO6596[2]?OxO6596[16]:OxO6596[17]);Ox37c[OxO6596[14]][OxO6596[15]]=(Ox33==OxO6596[2]?OxO6596[16]:OxO6596[17]);} ;