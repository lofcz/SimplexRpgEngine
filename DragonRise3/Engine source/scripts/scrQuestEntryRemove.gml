/// scrQuestEntryRemove(id)

with(oQuest)
{
ds_list_delete(questListID, argument[0]);
ds_list_delete(questListTitle, argument[0]);
ds_list_delete(questListText, argument[0]);
ds_list_delete(questListReward, argument[0]);
ds_list_delete(questListCompleted, argument[0]);
ds_list_delete(questListPrefix, argument[0]);
}

