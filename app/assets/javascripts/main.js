var main = (function(){

    var self;

    return {

        init: function(){

            self = this;

            self.fadeOutFlash();
            self.userNav();
            self.profileNav();
            
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
        },
        
        profileNav: function() {
            
            $('.profile-sub-nav li').on('click', function(){
                
                var show = $(this).data('show');
                $('.profile-sub-nav li').removeClass('active');
                $(this).addClass('active');
                
                $('.profile-info-item').hide();
                $('.profile-info-item.' + show).fadeIn();
            });
            
        }
    };
})();

$(document).ready(function(){
    main.init();
});