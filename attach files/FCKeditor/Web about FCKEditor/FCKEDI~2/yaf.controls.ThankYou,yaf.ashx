if(typeof yaf == "undefined") yaf={};
if(typeof yaf.controls == "undefined") yaf.controls={};
if(typeof yaf.controls.ThankYou == "undefined") yaf.controls.ThankYou={};
yaf.controls.ThankYou_class = function() {};
Object.extend(yaf.controls.ThankYou_class.prototype, Object.extend(new AjaxPro.AjaxClass(), {
	InsertThankYou: function(MessageID) {
		return this.invoke("InsertThankYou", {"MessageID":MessageID}, this.InsertThankYou.getArguments().slice(1));
	},
	Thank_Delete: function(sMessageId) {
		return this.invoke("Thank_Delete", {"sMessageId":sMessageId}, this.Thank_Delete.getArguments().slice(1));
	},
	GetString: function(strText) {
		return this.invoke("GetString", {"strText":strText}, this.GetString.getArguments().slice(1));
	},
	GetObject: function(strText) {
		return this.invoke("GetObject", {"strText":strText}, this.GetObject.getArguments().slice(1));
	},
	GetStatus: function(sMessageID) {
		return this.invoke("GetStatus", {"sMessageID":sMessageID}, this.GetStatus.getArguments().slice(1));
	},
	url: '/ajaxpro/yaf.controls.ThankYou,yaf.ashx'
}));
yaf.controls.ThankYou = new yaf.controls.ThankYou_class();

