using System;
using System.Drawing;

namespace SimplexDialog
{
    public class Dialog
    {
        public enum state
        {
            message, branch, condition, action
        }

        public Point Position { get; set; }
        public Size Size { get; set; }
        public Dialog nextDialog { get; set; }
        public string Caption { get; set; }
        public int Id { get; set; }
        public string Text { get; set; }
        public int Depth { get; set; }
        public bool DialogueStart { get; set; }
        public int nextDialogID { get; set; }
        public state Type { get; set; }
        public Dialog nextDialogBranch { get; set; }
        public int nextDialogBranchId { get; set; }
        public Dialog nextConditionDialog { get; set; }
        public int messageAttachedWire { get; set; }
        public Point startPosition { get; set; }
        public Point startPositionUnzoomed { get; set; }
        public int Rotation { get; set; }
        public Dialog nextActionDialog { get; set; }

        public Dialog(Point Position, Size Size, string Caption = "", string Text = "", int Depth = 0, state Type = state.message, Form1 f = null)
        {
            this.Position = Position;
            this.Size = Size;
            this.Caption = Caption;
            this.Text = Text;
            this.Depth = Depth;
            this.Type = Type;

            nextDialog = null;
            Id = Globalization.setId();
            DialogueStart = false;
            nextDialogID = -1;
            Rotation = 0;
            nextDialogBranch = null;
            nextDialogBranchId = -1;
            nextConditionDialog = null;
            nextActionDialog = null;
            messageAttachedWire = -1;
            startPosition = Position;
            startPositionUnzoomed = Position;
            Rotation = 0;

            Update(f);
        }

        public Dialog()
        {
            nextDialog = null;
            Id = Globalization.setId();
            DialogueStart = false;
            nextDialogID = -1;
            Type = state.message;
            Rotation = 0;
            nextDialogBranch = null;
            nextDialogBranchId = -1;
            nextConditionDialog = null;
            messageAttachedWire = -1;
            Rotation = 0;
        }

        public void Update(Form1 f)
        {
            Position = new Point(startPosition.X + f.cameraPosition.X, startPosition.Y + f.cameraPosition.Y);
        }
    }
}