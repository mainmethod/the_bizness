var admin = (function(){

    var self;

    return {

        init: function(){

            self = this;

            self.fadeOutFlash();
            
        },

       
        
        fadeOutFlash: function(){
            if($('.flash').length > 0){
                setTimeout(function(){ $('.flash').fadeOut('slow')}, 5000);
            }
        }


    };

})();
$(document).ready(function(){
    admin.init();
});