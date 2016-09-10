#define scrSpellCreate
/// scrSpellCreate(spell, level, name, x, y, upgrade1, upgrade1Lvl, upgrade2, upgrade2Lvl)

var spell, level, name, xx, yy, u1, u1Lvl, u2, u2Lvl;
spell    = SpellEnum.spellFlash;
level    = 0;
name     = "spell name text [UNSET]";
xx       = x;
yy       = y;
u1       = -1;
u1Lvl    = -1;
u2       = -1;
u2Lvl    = -1;

if (argument_count > 0) {spell     = argument[0];} 
if (argument_count > 1) {level     = argument[1];} 
if (argument_count > 2) {name      = argument[2];} 
if (argument_count > 3) {xx        = argument[3];} 
if (argument_count > 4) {yy        = argument[4];} 
if (argument_count > 5) {u1        = argument[5];} 
if (argument_count > 6) {u1Lvl     = argument[6];} 
if (argument_count > 7) {u2        = argument[7];}
if (argument_count > 8) {u2Lvl     = argument[8];}

spellLevel[spell,0] = 0;    //level upgradu kouzla č.1/2 = 0
spellLevel[spell,1] = 0;    //level upgradu kouzla č.2/2 = 0
spellBranch[spell,0] = -1;  //žádný upgrade není vybrán
spellBranch[spell,1] = -1;  // ...
ds_list_add(spellList, name);
ds_list_add(spellListAlpha, 0);


#define scrSpellCreateDetails
/// scrSpellCreateDetails(n1, s1, n2, s2, n3, s3, n4, s4, n5, s5, spell, name1, name2, name3, name4, name5)

var n1, s1, n2, s2, n3, s3, n4, s4, n5, s5, spell, na1, na2, na3, na4, na5;
n1 = "";
s1 = "";
n2 = "";
s2 = "";
n3 = "";
s3 = "";
n4 = "";
s4 = "";
n5 = "";
s5 = "";
na1 = "";
na2 = "";
na3 = "";
na4 = "";
na5 = "";
spell = SpellEnum.spellFlash;

if (argument_count > 0) {n1         = argument[0];} 
if (argument_count > 1) {s1         = argument[1];} 
if (argument_count > 2) {n2         = argument[2];} 
if (argument_count > 3) {s2         = argument[3];} 
if (argument_count > 4) {n3         = argument[4];} 
if (argument_count > 5) {s3         = argument[5];} 
if (argument_count > 6) {n4         = argument[6];} 
if (argument_count > 7) {s4         = argument[7];}
if (argument_count > 8) {n5         = argument[8];}
if (argument_count > 9) {s5         = argument[9];} 
if (argument_count > 10){spell      = argument[10];}
if (argument_count > 11){na1        = argument[11];}
if (argument_count > 12){na2        = argument[12];}
if (argument_count > 13){na3        = argument[13];}
if (argument_count > 14){na4        = argument[14];}
if (argument_count > 15){na5        = argument[15];}

spellDetails[spell,0] = n1; // Main spell; verticle pair format: (text, sprite)
spellDetails[spell,1] = s1; 
spellDetails[spell,2] = n2; //č.1/1
spellDetails[spell,3] = s2;
spellDetails[spell,4] = n3; //č.2/1
spellDetails[spell,5] = s3;
spellDetails[spell,6] = n4; //č.1/2
spellDetails[spell,7] = s4;
spellDetails[spell,8] = n5; //č.2/2
spellDetails[spell,9] = s5;

spellDetails[spell,10] = na1;
spellDetails[spell,11] = na2;
spellDetails[spell,12] = na3;
spellDetails[spell,13] = na4;
spellDetails[spell,14] = na5;


#define scrSpellCreateUpgradeDetails1
///scrSpellCreateUpgradeDetails1(spell, t1...t10)

var spell;

if (argument_count > 0) {spell = argument[0];}
for (i = 1; i < 11; i++)
    {
     if (argument_count > i)
        {
         spellUpgradeDetails[spell,i-1] = argument[i];
        }
    }


#define scrSpellCreateUpgradeDetails2
///scrSpellCreateUpgradeDetails2(spell, t1...t10)

var spell;

if (argument_count > 0) {spell = argument[0];}
for (i = 1; i < 11; i++)
    {
     if (argument_count > i)
        {
         spellUpgradeDetails[spell,i+9] = argument[i];
        }
    }