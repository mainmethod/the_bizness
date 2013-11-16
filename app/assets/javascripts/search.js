var search = (function(){

    var self,
        input,
        count,
        active;

    return {

        init: function(){

            self       = this;
            input      = $("input#term");
            results_el = $('.search-select');
            count      = 0;
            active     = 0;
            
            input.keyup(function(e){
                self.search(e.keyCode);
            });
            
            input.blur(function(){
                var afterBlur = setTimeout(function(){
                    input.val('');
                    self.search('');
                    clearTimeout(afterBlur);
                }, 200);
                
                return false;
            });
            
        },
        
        search: function(keycode) {
            console.log(keycode);
            term = input.val();
            
            if(keycode == 40) { //down
                active = active == count ? 1 : (active + 1);
                self.setActive();
                return false;
            }
            
            if(keycode == 38) { //up
                active = active == 1 ? count : (active - 1);
                self.setActive();
                return false;
            }
            
            if(keycode == 13) { //up
                href = results_el.find('.active').attr('href');
                window.location.href = href;
                return false;
            }
            
            if(term == ''){
                results_el.html('');
                return false;
            }
            
            $.post('/home/search', {term : term}, function(){
                count = results_el.find('.item').length;
            }, "script");
            return false;
        },
        
        setActive: function(){
            
            console.log('count: ' + count);
            console.log('active: ' + active);
            
            results_el.find('.item').removeClass('active');
            results_el.find('.item').eq(active -1).addClass('active');
            
        }
         
    };
})();

$(document).ready(function(){
    search.init();
});