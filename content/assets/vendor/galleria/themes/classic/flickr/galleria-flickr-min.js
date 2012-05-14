/*
 Galleria Flickr Plugin 2011-06-07
 http://galleria.aino.se

 Copyright 2011, Aino
 Licensed under the MIT license.
*/
(function(e){var j=function(a){a=a.split("/");if(a.length==1)return"";a.pop();return a.join("/")+"/"}(e("script:last").attr("src"));Galleria.Flickr=function(a){this.api_key=a||"2a2ce06c15780ebeb0b706650fc890b2";this.options={max:30,imageSize:"medium",thumbSize:"thumb",sort:"interestingness-desc",description:!1,complete:function(){}}};Galleria.Flickr.prototype={constructor:Galleria.Flickr,search:function(a,b){return this._find({text:a},b)},tags:function(a,b){return this._find({tags:a},b)},user:function(a,
b){return this._call({method:"flickr.urls.lookupUser",url:"flickr.com/photos/"+a},function(a){this._find({user_id:a.user.id,method:"flickr.people.getPublicPhotos"},b)})},set:function(a,b){return this._find({photoset_id:a,method:"flickr.photosets.getPhotos"},b)},gallery:function(a,b){return this._find({gallery_id:a,method:"flickr.galleries.getPhotos"},b)},groupsearch:function(a,b){return this._call({text:a,method:"flickr.groups.search"},function(a){this.group(a.groups.group[0].nsid,b)})},group:function(a,
b){return this._find({group_id:a,method:"flickr.groups.pools.getPhotos"},b)},setOptions:function(a){e.extend(this.options,a);return this},_call:function(a,b){var c="http://api.flickr.com/services/rest/?",d=this,a=e.extend({format:"json",jsoncallback:"?",api_key:this.api_key},a);e.each(a,function(a,b){c+="&"+a+"="+b});e.getJSON(c,function(a){a.stat==="ok"?b.call(d,a):Galleria.raise(a.code.toString()+" "+a.stat+": "+a.message,!0)});return d},_getBig:function(a){if(a.url_l)return a.url_l;else if(parseInt(a.width_o,
10)>1280)return"http://farm"+a.farm+".static.flickr.com/"+a.server+"/"+a.id+"_"+a.secret+"_b.jpg";return a.url_o||a.url_z||a.url_m},_getSize:function(a,b){var c;switch(b){case "thumb":c=a.url_t;break;case "small":c=a.url_s;break;case "big":c=this._getBig(a);break;case "original":c=a.url_o?a.url_o:this._getBig(a);break;default:c=a.url_z||a.url_m}return c},_find:function(a,b){a=e.extend({method:"flickr.photos.search",extras:"url_t,url_m,url_o,url_s,url_l,url_z,description",sort:this.options.sort},a);
return this._call(a,function(a){var d=[],a=a.photos?a.photos.photo:a.photoset.photo,e=Math.min(this.options.max,a.length),f,g;for(g=0;g<e;g++)f=a[g],d.push({thumb:this._getSize(f,this.options.thumbSize),image:this._getSize(f,this.options.imageSize),big:this._getBig(f),title:a[g].title,description:this.options.description&&a[g].description?a[g].description._content:""});b.call(this,d)})}};var h=Galleria.prototype.load;Galleria.prototype.load=function(){if(arguments.length||typeof this._options.flickr!==
"string")h.apply(this,Galleria.utils.array(arguments));else{var a=this,b=Galleria.utils.array(arguments),c=this._options.flickr.split(":"),d,i=e.extend({},a._options.flickrOptions),f=typeof i.loader!=="undefined"?i.loader:e("<div>").css({width:48,height:48,opacity:0.7,background:"#000 url("+j+"loader.gif) no-repeat 50% 50%"});if(c.length){if(typeof Galleria.Flickr.prototype[c[0]]!=="function")return Galleria.raise(c[0]+" method not found in Flickr plugin"),h.apply(this,b);if(!c[1])return Galleria.raise("No flickr argument found"),
h.apply(this,b);window.setTimeout(function(){a.$("target").append(f)},100);d=new Galleria.Flickr;typeof a._options.flickrOptions==="object"&&d.setOptions(a._options.flickrOptions);d[c[0]](c[1],function(b){a._data=b;f.remove();a.trigger(Galleria.DATA);d.options.complete.call(d,b)})}else h.apply(this,b)}}})(jQuery);