/// scrQuestEntrySetReward(id, reward, addAsNote)

var completed, ID;
ID        = 0;
add       = true;
text      = oQuest.questListReward[| ID];

if (argument_count > 0) {ID        = argument[0];}
if (argument_count > 1) {text      = argument[1];}
if (argument_count > 2) {add       = argument[2];}

if (add) {text = oQuest.questListReward[| ID] + text;}            
oQuest.questListReward[| ID] = text;

