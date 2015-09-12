var M = argument0;

var NormalMatrix;
    NormalMatrix[0] = (M[5] * M[10] - M[6] * M[9]);
    NormalMatrix[4] = (M[2] * M[9] - M[1] * M[10]);
    NormalMatrix[8] = (M[1] * M[6] - M[2] * M[5]);
    NormalMatrix[1] = (M[6] * M[8] - M[4] * M[10]);
    NormalMatrix[5] = (M[0] * M[10] - M[2] * M[8]);
    NormalMatrix[9] = (M[2] * M[4] - M[0] * M[6]);
    NormalMatrix[2] = (M[4] * M[9] - M[5] * M[8]);
    NormalMatrix[6] = (M[1] * M[8] - M[0] * M[9]);
    NormalMatrix[10] = (M[0] * M[5] - M[1] * M[4]);

    
    NormalMatrix[3] = M[0];
    NormalMatrix[7] = M[0];
    NormalMatrix[5] = M[0];
    NormalMatrix[11] = M[0];
    NormalMatrix[12] = M[0];
    NormalMatrix[13] = M[0];
    NormalMatrix[14] = M[0];
    NormalMatrix[15] = M[0];
    
return NormalMatrix;