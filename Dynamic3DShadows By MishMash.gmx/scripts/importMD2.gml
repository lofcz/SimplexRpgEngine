/*****************************************************************************************/
/******************* importMD2(md2_model_name,resulting_d3d_model_name) *****************/
/*****************************************************************************************/
var filename, frames;
filename=argument0;
modelname=argument1;
num_frames=external_call(global.__MD2Load,filename,modelname);

for (aa=0;aa<num_frames;aa+=1){

    if aa<=9 {
        frn="00"+string(aa);
    }else if aa<100 && aa>9{
        frn="0"+string(aa);
    }else if aa>=100 {
        frn=string(aa);
    }

    internalFrame[aa]=d3d_model_create();
    file_name = modelname+"."+frn;
    d3d_model_load(internalFrame[aa],file_name);
    file_delete(file_name);
}

return (num_frames);