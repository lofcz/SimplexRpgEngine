/// scrAdvancedCollisionSetText(text, index)

var t, index;
t     = "Sample text";
index = -1;

if (argument_count > 0) {t     = argument[0];}
if (argument_count > 1) {index = argument[1];}
  
if (index == -1)
    {
     text[indexer] = t;
     indexer++;
    }
else
    {
     text[index] = t;
    }
