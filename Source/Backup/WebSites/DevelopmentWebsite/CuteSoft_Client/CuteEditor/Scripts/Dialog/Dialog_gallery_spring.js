var OxOa650=["is_spring_image","1","gid","zIndex","style","srcImg","documentElement","body","getBoundingClientRect","left","top","getBoxObjectFor","x","y","offsetWidth","offsetHeight","offsetLeft","offsetTop","offsetParent","R","width","px","height","M","spring_expand(\x27","id","\x27)","lastActiveElement","spring_collapse(\x27","display","none","parentNode","block","hidetip","src","url","className","spring_image_popup","void(0)","expand","collapse","onmouseout","onmouseover","onclick","tooltip","click","prototype","MouseEvents","ownerDocument","addEventListener","scroll","attachEvent","onscroll"];function hidetip(){} ;function render_spring_image(Ox29){var Ox322;if(Ox29.getAttribute(OxOa650[0])==OxOa650[1]){return ;} ;Ox29.setAttribute(OxOa650[0],OxOa650[1]);render_spring_image[OxOa650[2]]=render_spring_image[OxOa650[2]]||1;render_spring_image[OxOa650[2]]++;function Ox323(){clearTimeout(this.M);render_spring_image[OxOa650[2]]++;this[OxOa650[4]][OxOa650[3]]=1000000+render_spring_image[OxOa650[2]];var Ox324=this[OxOa650[5]];var Ox325,Ox326,Ox327,Ox328;Ox327=Math.max(document[OxOa650[6]].scrollTop,document[OxOa650[7]].scrollTop);Ox328=Math.max(document[OxOa650[6]].scrollLeft,document[OxOa650[7]].scrollLeft);if(Ox324[OxOa650[8]]){Ox325=Ox324.getBoundingClientRect()[OxOa650[9]];Ox326=Ox324.getBoundingClientRect()[OxOa650[10]];} else {if(document[OxOa650[11]]){Ox325=document.getBoxObjectFor(Ox324)[OxOa650[12]]-Ox328;Ox326=document.getBoxObjectFor(Ox324)[OxOa650[13]]-Ox327;} else {var Ox329=Ox32a(Ox324);Ox325=Ox329[OxOa650[12]]-Ox328;Ox326=Ox329[OxOa650[13]]-Ox327;} ;} ;function Ox32a(element){var Ox329={x:0,y:0,width:element[OxOa650[14]],height:element[OxOa650[15]]};while(element){Ox329[OxOa650[12]]+=element[OxOa650[16]];Ox329[OxOa650[13]]+=element[OxOa650[17]];element=element[OxOa650[18]];} ;return Ox329;} ;if(this[OxOa650[19]]<1.35){this[OxOa650[19]]+=0.1;this[OxOa650[4]][OxOa650[20]]=Math.floor(Ox324[OxOa650[14]]*this[OxOa650[19]])+OxOa650[21];this[OxOa650[4]][OxOa650[22]]=Math.floor(Ox324[OxOa650[15]]*this[OxOa650[19]])+OxOa650[21];Ox326=Math.floor(Ox326+Ox327-(this[OxOa650[14]]-Ox324[OxOa650[14]])/2)+OxOa650[21];;;Ox325=Math.floor(Ox325+Ox328-(this[OxOa650[15]]-Ox324[OxOa650[15]])/2)+OxOa650[21];this[OxOa650[4]][OxOa650[10]]=Ox326;this[OxOa650[4]][OxOa650[9]]=Ox325;this[OxOa650[23]]=setTimeout(OxOa650[24]+this[OxOa650[25]]+OxOa650[26],20);} else {if(render_spring_image[OxOa650[27]]!=this){this[OxOa650[23]]=setTimeout(OxOa650[28]+this[OxOa650[25]]+OxOa650[26],20);} ;} ;} ;function Ox32b(){clearTimeout(this.M);var Ox324=this[OxOa650[5]];var Ox325,Ox326,Ox327,Ox328;Ox327=Math.max(document[OxOa650[6]].scrollTop,document[OxOa650[7]].scrollTop);Ox328=Math.max(document[OxOa650[6]].scrollLeft,document[OxOa650[7]].scrollLeft);if(Ox324[OxOa650[8]]){Ox325=Ox324.getBoundingClientRect()[OxOa650[9]];Ox326=Ox324.getBoundingClientRect()[OxOa650[10]];} else {if(document[OxOa650[11]]){Ox325=document.getBoxObjectFor(Ox324)[OxOa650[12]]-Ox328;Ox326=document.getBoxObjectFor(Ox324)[OxOa650[13]]-Ox327;} ;} ;if(this[OxOa650[19]]>1){this[OxOa650[19]]-=0.1;this[OxOa650[4]][OxOa650[20]]=Math.ceil(Ox324[OxOa650[14]]*this[OxOa650[19]])+OxOa650[21];this[OxOa650[4]][OxOa650[22]]=Math.ceil(Ox324[OxOa650[15]]*this[OxOa650[19]])+OxOa650[21];Ox326=Math.ceil(Ox326+Ox327-(this[OxOa650[14]]-Ox324[OxOa650[14]])/2)+OxOa650[21];;;Ox325=Math.ceil(Ox325+Ox328-(this[OxOa650[15]]-Ox324[OxOa650[15]])/2)+OxOa650[21];this[OxOa650[4]][OxOa650[10]]=Ox326;this[OxOa650[4]][OxOa650[9]]=Ox325;this[OxOa650[23]]=setTimeout(OxOa650[28]+this[OxOa650[25]]+OxOa650[26],0);} else {this[OxOa650[4]][OxOa650[29]]=OxOa650[30];} ;} ;function Ox32c(){var Ox32d=Ox322;if(Ox32d[OxOa650[31]]==null){document[OxOa650[7]].appendChild(Ox32d);} ;if((render_spring_image[OxOa650[27]]!=null)&&(render_spring_image[OxOa650[27]]!=this)){render_spring_image[OxOa650[27]][OxOa650[23]]=setTimeout(OxOa650[28]+render_spring_image[OxOa650[27]][OxOa650[25]]+OxOa650[26],0);} ;render_spring_image[OxOa650[27]]=Ox32d;Ox32d[OxOa650[4]][OxOa650[29]]=OxOa650[32];Ox32d.expand();} ;function Ox32e(){try{if(window[OxOa650[33]]){hidetip();} ;this.collapse();} catch(x){} ;} ;Ox322= new Image();Ox322[OxOa650[34]]=Ox29.getAttribute(OxOa650[35])||Ox29[OxOa650[34]];Ox322[OxOa650[36]]=OxOa650[37];Ox322[OxOa650[25]]=OxOa650[37]+render_spring_image[OxOa650[2]];Ox322[OxOa650[23]]=setTimeout(OxOa650[38],0);Ox322[OxOa650[19]]=1;Ox322[OxOa650[5]]=Ox29;Ox322[OxOa650[39]]=Ox323;Ox322[OxOa650[40]]=Ox32b;Ox322[OxOa650[41]]=Ox32e;Ox322[OxOa650[42]]=Ox32f;Ox322[OxOa650[43]]=function (){insert(Ox29.getAttribute(OxOa650[35]));} ;function Ox32f(){var Ox330=Ox29.getAttribute(OxOa650[44]);showTooltip(Ox330,this);} ;try{Ox29[OxOa650[42]]=Ox32c;} catch(x){} ;} ;if(document[OxOa650[11]]!=null){HTMLElement[OxOa650[46]][OxOa650[45]]=function (){var Ox331=this[OxOa650[48]].createEvent(OxOa650[47]);Ox331.initMouseEvent(OxOa650[45],true,true,this[OxOa650[48]].defaultView,1,0,0,0,0,false,false,false,false,0,null);this.dispatchEvent(Ox331);} ;} ;function spring_image_scrcoll(){render_spring_image[OxOa650[27]]=null;} ;if(window[OxOa650[49]]){window.addEventListener(OxOa650[50],spring_image_scrcoll,true);} else {if(window[OxOa650[51]]){window.attachEvent(OxOa650[52],spring_image_scrcoll);} ;} ;function spring_expand(Ox99){var Ox29=document.getElementById(Ox99);if(Ox29){Ox29.expand();} ;} ;function spring_collapse(Ox99){var Ox29=document.getElementById(Ox99);if(Ox29){Ox29.collapse();} ;} ;