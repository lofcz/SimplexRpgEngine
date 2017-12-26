/// @function cpCollectionIni()
/// @desc Initialises collection

v_collectionPerRow = 12;
v_collectionRows = 5;

for (var i = 0; i < v_collectionRows; i++)
{
	for (var j = 0; j < v_collectionPerRow; j++)
	{
		v_collectionUnlocked[i, j] = false;
		v_collectionIndex[i, j] = 0;
	}
}