re=file_bin_open(argument0,0);
size=file_bin_size(re);
ident=readInt();

version=readInt();
skinwidth=readInt();
skinheight=readInt();
framesize=readInt();
num_skins=readInt();
num_vertices=readInt();
num_st=readInt();
num_tris=readInt();
num_glcmds=readInt();
num_frames=readInt();
offset_skins=readInt();
offset_st=readInt();
offset_tris=readInt();
offset_frames=readInt();
offset_glcmds=readInt();
offset_end=readInt();

file_bin_seek(re,offset_st);
for(a=0;a<num_st;a+=1) {
    tc[nTC,0]=readShort()/skinwidth;
    tc[nTC,1]=readShort()/skinheight;
    nTC+=1;
}
file_bin_seek(re,offset_tris);
for(a=0;a<num_tris;a+=1) {
    tri[nTris,0]=readShort();
    tri[nTris,1]=readShort();
    tri[nTris,2]=readShort();

    tri[nTris,3]=readShort();
    tri[nTris,4]=readShort();
    tri[nTris,5]=readShort();
    nTris+=1;
}
file_bin_seek(re,offset_frames);
for(aa=0;aa<num_frames;aa+=1) {
    internalFrame[aa]=d3d_model_create();
    d3d_model_primitive_begin(internalFrame[aa],pr_trianglelist);
    sFactX=readFloat();
    sFactY=readFloat();
    sFactZ=readFloat();
    tFactX=readFloat();
    tFactY=readFloat();
    tFactZ=readFloat();
    for(b=0;b<16;b+=1) {
        discard=readChar();
    }
    for(b=0;b<num_vertices;b+=1) {
        vX[b]=readChar()*sFactX+tFactX;
        vY[b]=readChar()*sFactY+tFactY;
        vZ[b]=readChar()*sFactZ+tFactZ;
        nI[b]=readChar();
    }
    for(b=0;b<num_tris;b+=1) {
        vx=vX[tri[b,0]];
        vy=vY[tri[b,0]];
        vz=vZ[tri[b,0]];
        nx=global.n[nI[tri[b,0]],0];
        ny=global.n[nI[tri[b,0]],1];
        nz=global.n[nI[tri[b,0]],2];
        xtex=tc[tri[b,3],0];
        ytex=tc[tri[b,3],1];
        d3d_model_vertex_normal_texture(internalFrame[aa],vx,vy,vz,nx,ny,nz,xtex,ytex);
        vx=vX[tri[b,1]];
        vy=vY[tri[b,1]];
        vz=vZ[tri[b,1]];
        nx=global.n[nI[tri[b,1]],0];
        ny=global.n[nI[tri[b,1]],1];
        nz=global.n[nI[tri[b,1]],2];
        xtex=tc[tri[b,4],0];
        ytex=tc[tri[b,4],1];
        d3d_model_vertex_normal_texture(internalFrame[aa],vx,vy,vz,nx,ny,nz,xtex,ytex);
        vx=vX[tri[b,2]];
        vy=vY[tri[b,2]];
        vz=vZ[tri[b,2]];
        nx=global.n[nI[tri[b,2]],0];
        ny=global.n[nI[tri[b,2]],1];
        nz=global.n[nI[tri[b,2]],2];
        xtex=tc[tri[b,5],0];
        ytex=tc[tri[b,5],1];
        d3d_model_vertex_normal_texture(internalFrame[aa],vx,vy,vz,nx,ny,nz,xtex,ytex);
    }
    d3d_model_primitive_end(internalFrame[aa]);
}
file_text_close(re);