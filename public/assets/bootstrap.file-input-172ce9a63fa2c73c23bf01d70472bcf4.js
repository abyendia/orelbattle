$(function(){$("input[type=file]").each(function(e,t){if("undefined"==typeof $(this).attr("data-bfi-disabled")){var i="Прикрепить файл";"undefined"!=typeof $(this).attr("title")&&(i=$(this).attr("title"));var p=$("<div>").append($(t).eq(0).clone()).html();$(t).replaceWith('<a class="file-input-wrapper btn">'+i+p+"</a>")}}).promise().done(function(){$(".file-input-wrapper").mousemove(function(e){var t,i,p,n,a,f,r,l;i=$(this),t=i.find("input"),p=i.offset().left,n=i.offset().top,a=t.width(),f=t.height(),r=e.pageX,l=e.pageY,moveInputX=r-p-a+20,moveInputY=l-n-f/2,t.css({left:moveInputX,top:moveInputY})}),$(".file-input-wrapper input[type=file]").change(function(){$(this).parent().next().has("file-input-name").remove(),$(this).parent().after('<span class="file-input-name">'+$(this).val()+"</span>")})});var e="<style>.file-input-wrapper { overflow: hidden; position: relative; cursor: pointer; z-index: 1; }.file-input-wrapper input[type=file], .file-input-wrapper input[type=file]:focus, .file-input-wrapper input[type=file]:hover { position: absolute; top: 0; left: 0; cursor: pointer; opacity: 0; filter: alpha(opacity=0); z-index: 99; outline: 0; }.file-input-name { margin-left: 8px; }</style>";$("link[rel=stylesheet]").eq(0).before(e)});