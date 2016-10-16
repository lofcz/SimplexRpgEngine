/// scrQuestEntrySetText(id, text, addAsNote)

var completed, ID, text, add;
ID        = 0;
add       = true;
text      = oQuest.questListText[| ID];

date = "";
date += string(date_get_hour(date_current_datetime())) + ":";

minute = date_get_minute(date_current_datetime());
if (minute < 10) {date += "0" + string(date_get_minute(date_current_datetime()))}
else {date += string(date_get_minute(date_current_datetime()))}

if (argument_count > 0) {ID        = argument[0];}
if (argument_count > 1) {text      = argument[1];}
if (argument_count > 2) {add       = argument[2];}

if (add) {text = "#" + scrColorflag(c_silver) + "(" +  date + ") " + scrEndColorflag() + text;}

if (ds_list_find_index(oQuest.questListText, ID) != -1)
{
if (add)
{              
oQuest.questListText[| ID] = oQuest.questListText[| ID] + string(text);
}
else
{
oQuest.questListText[| ID] = text;
}
}

