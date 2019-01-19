using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Text;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Input;
using MonoGame.Extended;
using SimplexCore;
using static SimplexCore.Sgml;

namespace SimplexResources.Objects
{
    public class oCryoSample : GameObject
    {
        public oCryoSample()
        {
            EditorPath = "Actors";
        }

        public override void EvtCreate()
        {
            alarm_set(0, 120, this);
            alarm_set(1, 60, this);
        }

        public override void EvtStep()
        {
            UpdateState();
        }

        public override void EvtDraw()
        {
            draw_circle(Position, 20, true, 0);
        }

        public override void EvtAlarm0()
        {
            Position.X += 100;
        }

        public override void EvtAlarm1()
        {
            Debug.WriteLine("Alarm 0 pauznut.. žádný pohyb");
            alarm_pause(0, this);
        }
    }
}