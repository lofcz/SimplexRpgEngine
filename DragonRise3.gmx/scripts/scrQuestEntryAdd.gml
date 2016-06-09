/// scrQuestEntryAdd(id, title, text, reward)

ds_list_add(oQuest.questListID, argument[0]);
ds_list_add(oQuest.questListTitle, argument[1]);
ds_list_add(oQuest.questListText, argument[2]);
ds_list_add(oQuest.questListReward, argument[3]);
ds_list_add(oQuest.questListCompleted, false);


