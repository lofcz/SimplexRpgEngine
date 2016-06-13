/// scrInflect(word, count)

var word, n;
word = argument[0];
n    = argument[1];

if (word == "úkol")
    {
     if (n == 1) {return "úkol";}
     else if (n < 5) {return "úkoly";}
     else {return "úkolů";}
    }
if (word == "aktivní")
    {
     if (n < 5) {return "aktivní";}
     else {return "aktivních";}
    }
