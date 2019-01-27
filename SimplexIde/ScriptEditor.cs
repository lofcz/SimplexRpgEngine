using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using DarkUI.Docking;
using DarkUI.Forms;
using ScintillaNET;

namespace SimplexIde
{
    public partial class ScriptEditor : DarkToolWindow
    {
        int lastCaretPos = 0;
        private int maxLineNumberCharLength;

        public ScriptEditor()
        {
            InitializeComponent();
        }

        private void ScriptEditor_Load(object sender, EventArgs e)
        {
            // Configuring the default style with properties
            scintilla.Styles[Style.Default].Font = "Consolas";
            scintilla.Styles[Style.Default].Size = 10;
            scintilla.Styles[Style.Default].BackColor = Color.FromArgb(30, 30, 30);
            scintilla.Styles[Style.Default].ForeColor = Color.FromArgb(241, 242, 243);
            scintilla.StyleClearAll();
            scintilla.CaretForeColor = Color.White;

            for (int i = 25; i <= 31; i++)
            {
                scintilla.Markers[i].SetForeColor(SystemColors.ControlLightLight);
                scintilla.Markers[i].SetBackColor(SystemColors.ControlDark);
            }

            scintilla.Styles[Style.LineNumber].ForeColor = Color.FromArgb(78, 156, 214);
            scintilla.Styles[Style.LineNumber].BackColor = Color.FromArgb(30, 30, 30);
            scintilla.Styles[Style.BraceLight].BackColor = Color.LightGray;
            scintilla.Styles[Style.BraceLight].ForeColor = Color.BlueViolet;
            scintilla.Styles[Style.BraceBad].ForeColor = Color.Red;

            scintilla.HScrollBar = false;
         

            // Configure the c# lexer styles
            scintilla.Styles[Style.Cpp.Default].BackColor = Color.FromArgb(30, 30, 30);
            scintilla.Styles[Style.Cpp.Preprocessor].ForeColor = Color.FromArgb(155, 155, 155);
            scintilla.Styles[Style.Cpp.Word].ForeColor = Color.FromArgb(78, 156, 214);
            scintilla.Styles[Style.Cpp.Word2].ForeColor = Color.FromArgb(78, 201, 176);

            scintilla.Styles[Style.Cpp.Number].ForeColor = Color.FromArgb(166, 206, 168);
            scintilla.Styles[Style.Cpp.String].ForeColor = Color.FromArgb(214, 157, 133);
            scintilla.Styles[Style.Cpp.Character].ForeColor = Color.FromArgb(214, 157, 133);
            scintilla.Styles[Style.Cpp.Operator].ForeColor = Color.FromArgb(155, 155, 155);
            scintilla.Styles[Style.Cpp.Verbatim].ForeColor = Color.FromArgb(181, 206, 168);
            scintilla.Styles[Style.Cpp.Regex].ForeColor = Color.FromArgb(214, 157, 133);
            scintilla.Styles[Style.Cpp.Comment].ForeColor = Color.FromArgb(87, 166, 74);
            scintilla.Styles[Style.Cpp.CommentLine].ForeColor = Color.FromArgb(87, 166, 74);
            scintilla.Styles[Style.Cpp.CommentLineDoc].ForeColor = Color.FromArgb(87, 166, 74);
            scintilla.Lexer = Lexer.Cpp;

            // Set the keywords
            scintilla.SetKeywords(0, "bool byte char class const decimal double enum float int long sbyte short static string struct uint ulong ushort var void abstract as base break case catch checked continue default delegate do else event explicit extern false finally fixed for foreach goto if implicit in interface internal is lock namespace new null object operator out override params private protected public readonly ref return sealed sizeof stackalloc switch this throw true try typeof unchecked unsafe using virtual while");
            scintilla.SetKeywords(1, "GameObject EvtCreate EvtStep EvtDraw");
        }

        private static bool IsBrace(int c)
        {
            switch (c)
            {
                case '(':
                case ')':
                case '[':
                case ']':
                case '{':
                case '}':
                    return true;
            }

            return false;
        }

        private void HighlightWord(string text)
        {
            if (string.IsNullOrEmpty(text))
                return;

            // Indicators 0-7 could be in use by a lexer
            // so we'll use indicator 8 to highlight words.
            const int NUM = 8;

            // Remove all uses of our indicator
            scintilla.IndicatorCurrent = NUM;
            scintilla.IndicatorClearRange(0, scintilla.TextLength);

            // Update indicator appearance
            scintilla.Indicators[NUM].Style = IndicatorStyle.TextFore;
            scintilla.Indicators[NUM].Under = false;
            scintilla.Indicators[NUM].ForeColor = Color.FromArgb(255, 184, 113);
            scintilla.Indicators[NUM].OutlineAlpha = 255;
            scintilla.Indicators[NUM].Alpha = 255;



            // Search the document
            scintilla.TargetStart = 0;
            scintilla.TargetEnd = scintilla.TextLength;
            scintilla.SearchFlags = SearchFlags.None;
            while (scintilla.SearchInTarget(text) != -1)
            {
                // Mark the search results with the current indicator
                scintilla.IndicatorFillRange(scintilla.TargetStart, scintilla.TargetEnd - scintilla.TargetStart);

                // Search the remainder of the document
                scintilla.TargetStart = scintilla.TargetEnd;
                scintilla.TargetEnd = scintilla.TextLength;
            }
        }

        private void scintilla_Click(object sender, EventArgs e)
        {

        }

        private void ScriptEditor_Leave(object sender, EventArgs e)
        {

        }

        private void scintilla_CharAdded(object sender, CharAddedEventArgs e)
        {
            // Find the word start
            var currentPos = scintilla.CurrentPosition;
            var wordStartPos = scintilla.WordStartPosition(currentPos, true);

            // Display the autocompletion list
            var lenEntered = currentPos - wordStartPos;
            if (lenEntered > 0)
            {
                if (!scintilla.AutoCActive)
                {
                    scintilla.AutoCShow(lenEntered,
                        "abstract as base break case catch checked continue default delegate do else event explicit extern false finally fixed for foreach goto if implicit in interface internal is lock namespace new null object operator out override params private protected public readonly ref return sealed sizeof stackalloc switch this throw true try typeof unchecked unsafe using var virtual while");
                }
            }
        }

        private void scintilla_UpdateUI(object sender, UpdateUIEventArgs e)
        {
            // Has the caret changed position?
            var caretPos = scintilla.CurrentPosition;
            if (lastCaretPos != caretPos)
            {
                lastCaretPos = caretPos;
                var bracePos1 = -1;
                var bracePos2 = -1;

                // Is there a brace to the left or right?
                if (caretPos > 0 && IsBrace(scintilla.GetCharAt(caretPos - 1)))
                    bracePos1 = (caretPos - 1);
                else if (IsBrace(scintilla.GetCharAt(caretPos)))
                    bracePos1 = caretPos;

                if (bracePos1 >= 0)
                {
                    // Find the matching brace
                    bracePos2 = scintilla.BraceMatch(bracePos1);
                    if (bracePos2 == Scintilla.InvalidPosition)
                        scintilla.BraceBadLight(bracePos1);
                    else
                        scintilla.BraceHighlight(bracePos1, bracePos2);
                }
                else
                {
                    // Turn off brace matching
                    scintilla.BraceHighlight(Scintilla.InvalidPosition, Scintilla.InvalidPosition);
                }
            }


            HighlightWord("draw_self");
        }

        private void scintilla_TextChanged(object sender, EventArgs e)
        {
            // Did the number of characters in the line number display change?
            // i.e. nnn VS nn, or nnnn VS nn, etc...
            var maxLineNumberCharLength = scintilla.Lines.Count.ToString().Length;
            if (maxLineNumberCharLength == this.maxLineNumberCharLength)
                return;

            // Calculate the width required to display the last line number
            // and include some padding for good measure.
            const int padding = 2;
            scintilla.Margins[0].Width = scintilla.TextWidth(Style.LineNumber, new string('9', maxLineNumberCharLength + 1)) + padding;
            this.maxLineNumberCharLength = maxLineNumberCharLength;

        }
    }
}
