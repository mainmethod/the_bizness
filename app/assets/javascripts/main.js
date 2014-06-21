var main = (function(){

    var self;

    return {

        init: function(){

            self = this;

            self.fadeOutFlash();
            self.userNav();
            self.profileNav();
            self.viewPortfolioVideo();
            self.meForm();
            
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
            
        },
        
        viewPortfolioVideo: function(){
            $('.portfolio-item').each(function(){
                var wrap = $(this);
                wrap.find('.view-video').on('click', function(){
                    wrap.find('.embed').modal();
                })
            });
        },
        
        meForm: function(){
            $('.editable').on('click', function(){
                var part = $(this).data('form-class'),
                    clicked = $(this);
                clicked.hide();
                $('.me-form-group' + '.' + part).show();
                $('.me-form-group' + '.' + part).find('input').eq(0).focus();
                
                var close = true;
                
                $('.me-form-group' + '.' + part + ' .cancel').on('click', function(){
                    clicked.show();
                    $('.me-form-group' + '.' + part).hide();
                });
            });
            
            $('#user_image_path').change(function(){
                $('.edit_user').submit();
            });
        }
        
    };
})();

$(document).ready(function(){
    main.init();
});