var tips = function(){
	
	/**
	 * loading
	 */
	var pageLoader = function($mode) {
		var $loadingEl = jQuery('#ftdms-loading');
		    $mode      = $mode || 'show';
		if ($mode === 'show') {
			if ($loadingEl.length) {
				$loadingEl.fadeIn(250);
			} else {
				jQuery('body').prepend('<div id="ftdms-loading"><div class="spinner-border text-primary" role="status"><span class="sr-only">Loading...</span></div></div>');
			}
		} else if ($mode === 'hide') {
			if ($loadingEl.length) {
				$loadingEl.fadeOut(250);
			}
		}
		return false;
	};
	
    var tips = function ($msg, $type, $delay, $icon, $from, $align) {
        $type  = $type || 'info';
        $delay = $delay || 1000;
        $from  = $from || 'top';
        $align = $align || 'center';
        $enter = $type == 'danger' ? 'animated shake' : 'animated fadeInUp';

        jQuery.notify({
            icon: $icon,
            message: $msg
        },
        {
            element: 'body',
            type: $type,
            allow_dismiss: true,
            newest_on_top: true,
            showProgressbar: false,
            placement: {
                from: $from,
                align: $align
            },
            offset: 20,
            spacing: 10,
            z_index: 10800,
            delay: $delay,
            animate: {
                enter: $enter,
                exit: 'animated fadeOutDown'
            }
        });
    };
	
	return {
        notify  : function ($msg, $type, $delay, $icon, $from, $align) {
            tips($msg, $type, $delay, $icon, $from, $align);
        },
		loading : function ($mode) {
		    pageLoader($mode);
		}
    };
}();