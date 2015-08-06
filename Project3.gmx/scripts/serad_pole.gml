/// seraad_pole(pole,stopani)

var ascend = 1; // stoupající řazení

    var array = argument0;
    var list = ds_list_create();
    var count = array_length_1d(array);
    if (argument_count > 1) {ascend = argument[1];}
    

    
    for (var i=0; i<count; i++) list[| i] = array[i];
    ds_list_sort(list, ascend);
    for (i=0; i<count; i++) {array[i] = list[| i]}// show_message(array[i]);};
    ds_list_destroy(list);
    return array;