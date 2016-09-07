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



#define scrSpellCreateDetails
/// scrSpellCreateDetails(n1, s1, n2, s2, n3, s3, n4, s4, n5, s5, spell)

var n1, s1, n2, s2, n3, s3, n4, s4, n5, s5, spell;
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

spellDetails[spell,0] = n1; //hlavní kouzlo
spellDetails[spell,1] = s1; 
spellDetails[spell,2] = n2; //č.1/1
spellDetails[spell,3] = s2;
spellDetails[spell,4] = n3; //č.2/1
spellDetails[spell,5] = s3;
spellDetails[spell,6] = n4; //č.1/2
spellDetails[spell,7] = s4;
spellDetails[spell,8] = n5; //č.2/2
spellDetails[spell,9] = s5;

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

