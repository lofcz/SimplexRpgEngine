/*
P3DC (Precise 3D Collisions)
V6.00
----
CREDITS:

**Credit is required to the following people if used

Brett Binnersley (Brett14): Making P3DC.dll
Samuel Hanson (Hanson): Making ModModCollisions.dll
Snake_PL: Creating GMAPI, P3DC uses this to make calling all the functions faster
Thomas Moller: Some of ModMod Collisions Code was based off of his code (the math)

*/
n="P3DC.dll";

//**Model Creation
global.p3dc_bdm = external_define(n,"bdm",dll_cdecl,ty_real,0);
global.p3dc_edm = external_define(n,"edm",dll_cdecl,ty_real,0);
global.p3dc_apm = external_define(n,"apm",dll_cdecl,ty_real,4,ty_string,ty_real,ty_real,ty_real);
global.p3dc_stm = external_define(n,"stm",dll_cdecl,ty_real,1,ty_real);
global.p3dc_brm = external_define(n,"brm",dll_cdecl,ty_real,1,ty_real);
global.p3dc_erm = external_define(n,"erm",dll_cdecl,ty_real,0);
global.p3dc_bs3 = external_define(n,"bs3",dll_cdecl,ty_real,6,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);
global.p3dc_mat = external_define(n,"mat_exported",dll_cdecl,ty_real,9,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);
global.p3dc_apw = external_define(n,"apw",dll_cdecl,ty_real,6,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);
global.p3dc_apf = external_define(n,"apf",dll_cdecl,ty_real,6,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);
global.p3dc_apb = external_define(n,"apb",dll_cdecl,ty_real,6,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);
global.p3dc_apc = external_define(n,"apc",dll_cdecl,ty_real,8,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);
global.p3dc_apo = external_define(n,"apo",dll_cdecl,ty_real,8,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);

//Overwrite
global.p3dc_obd = external_define(n,"obd",dll_cdecl,ty_real,2,ty_real,ty_real);
global.p3dc_oed = external_define(n,"oed",dll_cdecl,ty_real,0);
global.p3dc_opt = external_define(n,"opt",dll_cdecl,ty_real,9,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);
global.p3dc_opw = external_define(n,"opw",dll_cdecl,ty_real,6,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);
global.p3dc_opf = external_define(n,"opf",dll_cdecl,ty_real,6,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);
global.p3dc_opb = external_define(n,"opb",dll_cdecl,ty_real,6,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);
global.p3dc_opc = external_define(n,"opc",dll_cdecl,ty_real,8,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);
global.p3dc_opo = external_define(n,"opo",dll_cdecl,ty_real,8,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);

//**Return Values
global.p3dc_gmn = external_define(n,"gmn",dll_cdecl,ty_real,0);
global.p3dc_gmt = external_define(n,"gmt",dll_cdecl,ty_real,1,ty_real);
global.p3dc_gms = external_define(n,"gms",dll_cdecl,ty_real,2,ty_real,ty_real);
global.p3dc_gtr = external_define(n,"gtr",dll_cdecl,ty_real,1,ty_real);
global.p3dc_gtm = external_define(n,"gtm",dll_cdecl,ty_real,0);

//**Collision Detection
global.p3dc_mcs = external_define(n,"mcs",dll_cdecl,ty_real,8,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);
global.p3dc_mcr = external_define(n,"mcr",dll_cdecl,ty_real,11,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);
global.p3dc_mc3 = external_define(n,"mc3",dll_cdecl,ty_real,4,ty_real,ty_real,ty_real,ty_real);
global.p3dc_mrs = external_define(n,"mrs",dll_cdecl,ty_real,10,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);
global.p3dc_mrf = external_define(n,"mrf",dll_cdecl,ty_real,7,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);             
global.p3dc_mr3 = external_define(n,"mr3",dll_cdecl,ty_real,6,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);           
global.p3dc_mrr = external_define(n,"mrr",dll_cdecl,ty_real,10,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);
global.p3dc_smr = external_define(n,"smr",dll_cdecl,ty_real,3,ty_real,ty_real,ty_real);               
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
