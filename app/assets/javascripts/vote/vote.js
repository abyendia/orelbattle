var win= null;

var facebook_setting_obj = {
	url_set_share: 'http://www.facebook.com/sharer/sharer.php?',
	uid: "FB",
}

var twitter_setting_obj = {
	url_set_share: 'https://twitter.com/share?',
	uid: "TW",
}

var vkontakte_setting_obj = {
	url_set_share: 'http://vkontakte.ru/share.php?',
	url_get_share: 'http://vk.com/share.php?act=count&url=',
	uid: "VK",
}	
//Контейнеры социальных настроек
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

//=================================================================
//Костылек для Вконтакте
//=================================================================

var VK = {
	count_value: 666,
    Share: {
        count: function(value, count) {
            VK.count_value = count;
        }
    }
}
//Костылек для Вконтакте
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^



function extend(Child, Parent) {
	var F = function() { }
	F.prototype = Parent.prototype
	Child.prototype = new F()
	Child.prototype.constructor = Child
	Child.superclass = Parent.prototype
}


function new_share_constructor(){
	this.url_params = "";
	this.make_params = function(purl, ptitle, pimg, text){
		url = "";
		if (purl.length > 0) {
			url += 'url=' + encodeURIComponent(purl);
		}
		if (ptitle.length > 0) {
			url += '&title='       + encodeURIComponent(ptitle);
		}
		if (text.length > 0) {
			url += '&description=' + encodeURIComponent(text);
		}		
		if (pimg.length > 0) {
			url += '&image='       + encodeURIComponent(pimg);
		}
		this.url_params = url
	}
}

function Provider(){
	this.url_set_share= "default";
	this.url_get_share = "default";
	this.uid = "default";
	this.shares_url = "default";//example mysite.rus
	

	this.alert_par = function(){
		alert(this.uid);
	}
	this.share = function() {
        url = this.url_set_share+this.url_params
        popup_res=this.popup(url);
    }
  	this.popup = function(url) {
  		//timer;
        var w=window.open(url,'','toolbar=0,status=0,width=626,height=436');
        win = w;
    }
    this.count_share = "default nothing";
	this.elem_view = "default nothing"

    this.getCountShare = function (){

		var
		_this = this;
		switch (this.uid) {
			case "VK":
				$.getJSON(this.url_get_share+this.shares_url+"&callback=?", function(response){}).complete(function(  ) {
						//TODO Проверка на существование переданного элеемнта - alert('Установите DOM для вывода значения') 
						_this.elem_view.html(window.VK.count_value);			
  					});				
				break
			case "FB":
				fql = 'SELECT share_count FROM link_stat WHERE url="' + this.shares_url + '"';
				serviceURL = "https://api.facebook.com/method/fql.query?format=json&query="+fql;
				$.getJSON(resultURL,function(response){
					alert(response[0].share_count);
					_this.elem_view.html(response[0].share_count);

				});
				break
			case "TW":
				$.getJSON(this.url_get_share+this.shares_url,function(response){
					alert(response.count);
					_this.elem_view.html(response[0].share_count);

				});
				break
			default:
				alert('Других социальных сетей мы не знаем');									
		}
	}



}

//======================================================
//Секция инициализации
//======================================================
Provider.prototype =  new  new_share_constructor()//share_constructor()//Sharer

vkontakte_obj = new Provider()
vkontakte_obj.url_set_share= vkontakte_setting_obj.url_set_share;
vkontakte_obj.url_get_share = vkontakte_setting_obj.url_get_share;

vkontakte_obj.uid = vkontakte_setting_obj.uid;

facebook_obj = new Provider()
facebook_obj.url_set_share= facebook_setting_obj.url_set_share;
facebook_obj.url_get_share = facebook_setting_obj.url_get_share;

facebook_obj.uid = facebook_setting_obj.uid;

twitter_obj = new Provider()
twitter_obj.url_set_share= twitter_setting_obj.url_set_share;
twitter_obj.url_get_share = twitter_setting_obj.url_get_share;

twitter_obj.uid = twitter_setting_obj.uid;
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
