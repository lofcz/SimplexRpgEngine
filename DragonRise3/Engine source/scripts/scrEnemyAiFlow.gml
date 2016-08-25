/// scrEnemyAiFlow()

// Base setup
scrTimerUpdate();

scrTimerEndStep();

// Set vars for this step
currentStepAggression = 0;

// If in peace mode and marked as aggressive creature, check for territory invade
if (behaviour == "peace" && behaviourType == "aggressive")
    {
     if (distance_to_point(oPlayer.x, oPlayer.y) < territoryArea)
        {
         behaviour = "attack";
        }
    }
    
// If aggressive
if (behaviour == "attack")
    {
     // If wounded from previous step reduce aggression and focus on survival
     if (hp < lastHp) {currentStepAggression--; survivalCurve--;}
     
     // Decide action based on aggression value and only if queue is free
     if (!performingAction)
        {
         // Foe wasn't wounded in this turn
         if (currentStepAggression == 0)
            {
             script_execute(ds_priority_find_max(priorities));
             performingAction = true;
            }
        }
        
    }
    
// If enemy can move, reposition him to next point
if (canMove)
    {
      
     // If enemy position reached checkpoint compute new
     if (distance_to_point(tempX, tempY) == 0 || !place_free(tempX, tempY))
        {
          // Compute new point
          possibleMove[3] = false;
          xdif            = abs(x - oPlayer.x);
          ydif            = abs(y - oPlayer.y);
          
          if (place_free(x + 48, y) && (x < oPlayer.x)) {possibleMove[0] = true;} 
          if (place_free(x - 48, y) && (x > oPlayer.x)) {possibleMove[1] = true;}
          if (place_free(x, y + 48) && (y > oPlayer.y)) {possibleMove[2] = true;}
          if (place_free(x, y - 48) && (y < oPlayer.y)) {possibleMove[3] = true;}
          
          // Choose one of available points
          index = scrChooseFromArray(possibleMove);
          
          // Set target point
          if (index == 0) {tempX = x + 48; tempY = y;}
          if (index == 1) {tempX = x - 48; tempY = y;}
          if (index == 2) {tempY = y - 48; tempX = x;}
          if (index == 3) {tempY = y + 48; tempX = x;}
        }
        
     // Move to target point
//     move_towards_point(tempX, tempY, 0.5);
    }

// Set vars for next step
lastHp = hp;        
    
// Debug
draw_text(x, y + 30, "Behaviour: " + behaviour);
draw_circle(tempX, tempY, 8, false);
draw_circle(targetX, targetY, 16, false);
