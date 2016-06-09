/// scrQuestEntryAdd(id, title, text, reward)

with(oQuest)
{
ds_list_add(questListID, argument[0]);
ds_list_add(questListTitle, argument[1]);
ds_list_add(questListText, argument[2]);
ds_list_add(questListReward, argument[3]);
ds_list_add(questListCompleted, false);
}

