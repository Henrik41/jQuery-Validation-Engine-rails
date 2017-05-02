/*
 * jQuery Video Popup Plugin Stylesheet
 * Version: 1.0
 *
 * Author: Nick Rivers
 * http://nrivers.com
 *
 *
 * Changelog: 
 * Version: 1.0
 *
 */

jQuery.fn.videopopup = function (options) {

	var settings = { // Defaults
		'videoid' : '',
		'videoplayer' : 'youtube',
		'width' : '500px',
		'height' : '300px',
		'autoplay' : 'false'
    };

	return this.each(function() {        
	   // If options exist, lets merge them
      // with our default settings
      if ( options ) { 
        $.extend(settings, options);
      }
	
	function centerS(cur) {
		
		var cur = cur;
		
	    cur.css("position","absolute");
	    cur.css("top", ( $(window).height() - cur.height() ) / 2+$(window).scrollTop() + "px");
	    cur.css("left", ( $(window).width() - cur.width() ) / 2+$(window).scrollLeft() + "px");
	    return this;
	}
	
	$(this).click(function(){
		var a=$(document).height();
	    var b=$(window).width();
		var popuphtml = '<div id="dvGlobalMask"></div><div id="videopopup"><div class="modalnav"></div><div id="videocontent"></div></div>';
		$('body').append(popuphtml);
	    $("#dvGlobalMask").css({width:b,height:a});
	    $("#dvGlobalMask").fadeTo("fast",0.4);
		
		$('#videopopup').css('width' , settings.width);
		$('#videopopup').css('height' , settings.height);
		centerS($("#videopopup"));
		
		var autoplay = 0;
		if (settings.autoplay == 'true') {
			autoplay = 1;
		} else {
			autoplay = 0;
		}
		// Checks for the type of video that is being pulled.
		youtubestr = '<iframe width="' + settings.width + '" height="' + settings.height + '" src="http://www.youtube.com/embed/' + settings.videoid + '?autoplay=' + autoplay + '&amp;showinfo=0" frameborder="0" allowfullscreen></iframe>';
		vimeostr = '<iframe src="http://player.vimeo.com/video/' + settings.videoid + '?color=00adef&amp;show_title=0&amp;show_portrait=0&amp;autoplay=' + autoplay + '" width="' + settings.width + '" height="' + settings.height + '" frameborder="0"></iframe>';
		
		switch (settings.videoplayer) {
			case 'youtube' :
				$("#videocontent").html($(youtubestr));
			break;
			case 'vimeo' :
				$("#videocontent").html($(vimeostr));
			break;
		}
		
		$("#videopopup").show();
		$('.modalnav').show();
		//$(settings.videoid).show();
		});	
		
		$('.modalnav').live('click', function(){
			$('#dvGlobalMask').hide();
			$('#videopopup').hide();
			$('.modalnav').hide();
			$('#videocontent').html('');
			$(settings.videoid).hide();
		});
    });
	
    return this;
}