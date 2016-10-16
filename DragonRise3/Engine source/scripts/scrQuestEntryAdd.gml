/// scrQuestEntryAdd(id, title, text, reward, prefix)

with(oQuest)
{
ds_list_add(questListID, argument[0]);
ds_list_add(questListTitle, argument[1]);
ds_list_add(questListText, scrWordwrap(argument[2], 400, fntPixelSmall));
ds_list_add(questListReward, argument[3]);
ds_list_add(questListPrefix, argument[4]);
ds_list_add(questListCompleted, false);
}

