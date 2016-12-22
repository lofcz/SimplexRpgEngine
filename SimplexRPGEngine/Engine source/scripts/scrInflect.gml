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
if (word == "bod")
    {
     if (n <= 0) {return "bodů";}
     else if (n < 2) {return "bod";}
     else if (n < 5) {return "body";}
     else {return "bodů";}
    }
if (word == "duše")
    {
     if (n <= 0) {return "duše";}
     else if (n < 2) {return "spoutanou duši";}
     else if (n < 5) {return "spoutané duše";}
     else {return "spoutaných duší";}
    }    
if (word == "zlatka")
    {
     if (n <= 0) {return "zlatek";}
     else if (n < 2) {return "zlatka";}
     else if (n < 5) {return "zlatky";}
     else {return "zlatek";}
    }    
if (word == "esence")
    {
     if (n < 5) {return "esence";}
     else {return "esencí";}
    }      
