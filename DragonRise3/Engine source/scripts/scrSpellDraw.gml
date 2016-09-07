#define scrSpellDraw
/// scrSpellDraw(spell, x, y);

var spell, xx, yy;
spell = SpellEnum.spellFlash;
xx    = x;
yy    = y; 

if (argument_count > 0) {spell = argument[0];}
if (argument_count > 1) {xx    = argument[1];}
if (argument_count > 1) {yy    = argument[2];}

draw_sprite(sSpells, spellDetails[spell,1], xx, yy);

if (mouse_in(xx, xx+32, yy, yy+32))
    {
     if (mouse_check_button_pressed(mb_left))
        {
         // Bindování kouzla
         if (oPlayer.spell_cd[fromSpell] <= 0)
            {
              scrSpellConvertEnumToString(spell);
              oPlayer.spell[fromSpell]        = returnArray[0];
              oPlayer.spell_sprite[fromSpell] = returnArray[1];
            }
        }
    }

#define scrSpellConvertEnumToString
/// scrSpellConvertEnumToString(spell)

var spell;
spell = SpellEnum.spellFlash;

if (argument_count > 0) {spell = argument[0];}

if (spell == SpellEnum.spellFlash) 
    {
     returnArray[0] = "flash";
     returnArray[1] = sSpellFlash;
    }

