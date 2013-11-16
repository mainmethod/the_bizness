var main = (function(){

    var self;

    return {

        init: function(){

            self = this;

            self.fadeOutFlash();
            self.userNav();
            
        },
        
        fadeOutFlash: function() {
            if($('.flash').length > 0){
                setTimeout(function(){ $('.flash').fadeOut('slow')}, 5000);
            }
        },
        
        userNav: function() {
            
            $('.user-info').on('mouseover', function(){
                $(this).addClass('on');
            });
                
            $('.right-buttons').hover(false, function(){
                $('.user-info').removeClass('on');
            });
        }
    };
})();

$(document).ready(function(){
    main.init();
});