var search = (function(){

    var self;

    return {

        init: function(){

            self = this;
            self.search();
        },
        
        search: function() {
            $("input#term").keyup(function (){
                $.post('/home/search', $("#search-form").serialize(), null, "script");
                return false;
            });
        },
        
        
        
    };
})();

$(document).ready(function(){
    search.init();
});