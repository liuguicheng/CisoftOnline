/**
 * @author Yaohaixiao
 */
(function(){
	var relatedRoot = $('#related-posts'),
	    relatedTab = null;
		
	if(!relatedRoot[0]){
		return false;
	}	
	
	relatedTab = $(relatedRoot.find('h2')[0]);
	
	relatedTab.click(function(){
		if(!relatedRoot.hasClass('show')){
			relatedRoot.addClass('show').animate({
				'margin-left': '-683px'
			});
			
		} 
		else{
			relatedRoot.removeClass('show').animate({
				'margin-left': '-513px'
			});
		}
	});
})();