var OxO8464=["onload","contentWindow","idSource","innerHTML","body","document","","designMode","on","contentEditable","fontFamily","style","Tahoma","fontSize","11px","color","black","background","white","length","\x22","\x3C$1$3"," ","\x26nbsp;","$1","\x3Ch$1\x3E","\x3C$1\x3E$2\x3C/$1\x3E"];var editor=Window_GetDialogArguments(window);function cancel(){Window_CloseDialog(window);} ;window[OxO8464[0]]=function (){var iframe=document.getElementById(OxO8464[2])[OxO8464[1]];iframe[OxO8464[5]][OxO8464[4]][OxO8464[3]]=OxO8464[6];iframe[OxO8464[5]][OxO8464[7]]=OxO8464[8];iframe[OxO8464[5]][OxO8464[4]][OxO8464[9]]=true;iframe[OxO8464[5]][OxO8464[4]][OxO8464[11]][OxO8464[10]]=OxO8464[12];iframe[OxO8464[5]][OxO8464[4]][OxO8464[11]][OxO8464[13]]=OxO8464[14];iframe[OxO8464[5]][OxO8464[4]][OxO8464[11]][OxO8464[15]]=OxO8464[16];iframe[OxO8464[5]][OxO8464[4]][OxO8464[11]][OxO8464[17]]=OxO8464[18];iframe.focus();} ;function insertContent(){var iframe=document.getElementById(OxO8464[2])[OxO8464[1]];var Oxcd=iframe[OxO8464[5]][OxO8464[4]][OxO8464[3]];if(Oxcd&&Oxcd[OxO8464[19]]>0){editor.PasteHTML(_RemoveWord(Oxcd));Window_CloseDialog(window);} ;} ;function _RemoveWord(Ox2d){Ox2d=Ox2d.replace(/<[\/]?(base|meta|link|style|font|st1|shape|path|lock|imagedata|stroke|formulas|xml|del|ins|[ovwxp]:\w+)[^>]*?>/gi,OxO8464[6]);Ox2d=Ox2d.replace(/\s*mso-[^:]+:[^;"]+;?/gi,OxO8464[6]);Ox2d=Ox2d.replace(/<!--[\s\S]*?-->/gi,OxO8464[6]);Ox2d=Ox2d.replace(/\s*MARGIN: 0cm 0cm 0pt\s*;/gi,OxO8464[6]);Ox2d=Ox2d.replace(/\s*MARGIN: 0cm 0cm 0pt\s*"/gi,OxO8464[20]);Ox2d=Ox2d.replace(/\s*TEXT-INDENT: 0cm\s*;/gi,OxO8464[6]);Ox2d=Ox2d.replace(/\s*TEXT-INDENT: 0cm\s*"/gi,OxO8464[20]);Ox2d=Ox2d.replace(/\s*TEXT-ALIGN: [^\s;]+;?"/gi,OxO8464[20]);Ox2d=Ox2d.replace(/\s*PAGE-BREAK-BEFORE: [^\s;]+;?"/gi,OxO8464[20]);Ox2d=Ox2d.replace(/\s*FONT-VARIANT: [^\s;]+;?"/gi,OxO8464[20]);Ox2d=Ox2d.replace(/\s*tab-stops:[^;"]*;?/gi,OxO8464[6]);Ox2d=Ox2d.replace(/\s*tab-stops:[^"]*/gi,OxO8464[6]);Ox2d=Ox2d.replace(/<(\w[^>]*) class=([^ |>]*)([^>]*)/gi,OxO8464[21]);Ox2d=Ox2d.replace(/\s*style="\s*"/gi,OxO8464[6]);Ox2d=Ox2d.replace(/<SPAN\s*[^>]*>\s* \s*<\/SPAN>/gi,OxO8464[22]);Ox2d=Ox2d.replace(/<(\w+)[^>]*\sstyle="[^"]*DISPLAY\s?:\s?none(.*?)<\/\1>/ig,OxO8464[6]);Ox2d=Ox2d.replace(/<span\s*[^>]*>\s*&nbsp;\s*<\/span>/gi,OxO8464[23]);Ox2d=Ox2d.replace(/<SPAN\s*[^>]*><\/SPAN>/gi,OxO8464[6]);Ox2d=Ox2d.replace(/<(\w[^>]*) lang=([^ |>]*)([^>]*)/gi,OxO8464[21]);Ox2d=Ox2d.replace(/<SPAN\s*>(.*?)<\/SPAN>/gi,OxO8464[24]);Ox2d=Ox2d.replace(/<\/?\w+:[^>]*>/gi,OxO8464[6]);Ox2d=Ox2d.replace(/<\!--.*?-->/g,OxO8464[6]);Ox2d=Ox2d.replace(/<H\d>\s*<\/H\d>/gi,OxO8464[6]);Ox2d=Ox2d.replace(/<(\w[^>]*) language=([^ |>]*)([^>]*)/gi,OxO8464[21]);Ox2d=Ox2d.replace(/<(\w[^>]*) onmouseover="([^\"]*)"([^>]*)/gi,OxO8464[21]);Ox2d=Ox2d.replace(/<(\w[^>]*) onmouseout="([^\"]*)"([^>]*)/gi,OxO8464[21]);Ox2d=Ox2d.replace(/<H(\d)([^>]*)>/gi,OxO8464[25]);Ox2d=Ox2d.replace(/<(H\d)><FONT[^>]*>(.*?)<\/FONT><\/\1>/gi,OxO8464[26]);Ox2d=Ox2d.replace(/<(H\d)><EM>(.*?)<\/EM><\/\1>/gi,OxO8464[26]);Ox2d=Ox2d.replace(/<a name="?OLE_LINK\d+"?>((.|[\r\n])*?)<\/a>/gi,OxO8464[24]);Ox2d=Ox2d.replace(/<a name="?_Hlt\d+"?>((.|[\r\n])*?)<\/a>/gi,OxO8464[24]);Ox2d=Ox2d.replace(/<a name="?_Toc\d+"?>((.|[\r\n])*?)<\/a>/gi,OxO8464[24]);return Ox2d;} ;