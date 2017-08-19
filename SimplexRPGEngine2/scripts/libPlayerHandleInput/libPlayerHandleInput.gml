/// @function libPlayerHandleInput()
/// @desc Handles basic input

if (v_lastDir == e_dirs.valW) {if (image_index < 0  || image_index > v_animationFrames[v_currentAnimation] - 0.1)  {image_index = 0; libPlayerEventAnimationEnd();}}
else if (v_lastDir == e_dirs.valS) {if (image_index < v_animationFrames[v_currentAnimation] * 2 || image_index > v_animationFrames[v_currentAnimation] * 3 - 0.1) {image_index = v_animationFrames[v_currentAnimation] * 2; libPlayerEventAnimationEnd();}}    
else if (v_lastDir == e_dirs.valA) {if (image_index < v_animationFrames[v_currentAnimation]  || image_index > v_animationFrames[v_currentAnimation] * 2 -0.1) {image_index = v_animationFrames[v_currentAnimation]; libPlayerEventAnimationEnd();}}    
else if (v_lastDir == e_dirs.valD) {if (image_index <  v_animationFrames[v_currentAnimation] * 3 || image_index > v_animationFrames[v_currentAnimation] * 4 - 0.1) {image_index = v_animationFrames[v_currentAnimation] * 3; libPlayerEventAnimationEnd();}}        
