var category = {
    OBJ: $("#_ALLSORT"),
    FN_Init: function() {
        if (this.OBJ.length) {
        	$("#categorys .item").Jdropdown({
                delay: 200
            });
        }
    }
};