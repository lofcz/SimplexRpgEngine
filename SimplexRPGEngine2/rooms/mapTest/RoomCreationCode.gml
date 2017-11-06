/// Set up

#macro M_PATH_PREFAB_TILES "Prefabs/TileLayers/"

cpWorldCreate();
cpWorldRegisterLayer("Tiles_4", tresAnimated1, cpWorldLayerDataFile(M_PATH_PREFAB_TILES + "NonsolidLayerDynamic.prefab"));
cpWorldRegisterLayer("Tiles_8", tresOusideObjects1, cpWorldLayerDataFile(M_PATH_PREFAB_TILES + "NonsolidLayerDynamic.prefab"));
//cpWorldRegisterLayer("Tiles_9", sprite293, cpWorldLayerDataFile(M_PATH_PREFAB_TILES + "NonsolidLayerDynamic.prefab"));
cpWorldRegisterLayer("Water", tresWater, cpWorldLayerDataFile(M_PATH_PREFAB_TILES + "SolidLayerStatic.prefab"));

cpWorldRegisterFinish();