/// scrQuestEntrySetCompleted(id, completed)

var completed, ID;
completed = true;
ID        = 0;

if (argument_count > 0) {ID        = argument[0];}
if (argument_count > 1) {completed = argument[1];}

global.temp = completed;

with(oQuest)
{               
questListCompleted[| ID] = global.temp;
}
