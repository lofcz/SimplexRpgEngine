using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Drawing2D;

namespace SimplexDialog
{
    internal class MathF
    {
        public static float pointDirection(Point p1, Point p2)
        {
            float xDiff = p2.X - p1.X;
            float yDiff = p2.Y - p1.Y;
            return (float)(Math.Atan2(yDiff, xDiff) * 180.0 / Math.PI);
        }

        public static bool placeFree(Form1 form, Point p1, int Depth)
        {
            foreach (Dialog d in form.dialogList)
            {
                if (Depth == d.Depth)
                {
                    if (d.Position.X + 256 > p1.X && d.Position.Y + 128 > p1.Y && d.Position.X + 256 < p1.X + 256 && d.Position.Y + 128 < p1.Y + 128)
                    {
                        return false;
                    }
                }
            }
            return true;
        }

        public static Dialog instancePosition(Form1 form, Point p1)
        {
            foreach (Dialog d in form.dialogList)
            {
                if (d.Position.X + 256 > p1.X && d.Position.Y + 128 > p1.Y && d.Position.X + 256 < p1.X + 256 && d.Position.Y + 128 < p1.Y + 128)
                {
                    return d;
                }
            }
            return null;
        }

        public static Point[] getVerticles(int sides, int radius, int startingAngle, Point center)
        {
            List<Point> points = new List<Point>();
            float step = 360.0f / sides;

            float angle = startingAngle;
            for (double i = startingAngle; i < startingAngle + 360.0; i += step)
            {
                points.Add(DegreesToXY(angle, radius, center));
                angle += step;
            }

            return points.ToArray();
        }

        private static Point DegreesToXY(float degrees, float radius, Point origin)
        {
            Point xy = new Point();
            double radians = degrees * Math.PI / 180.0;

            xy.X = (int)(Math.Cos(radians) * radius + origin.X);
            xy.Y = (int)(Math.Sin(-radians) * radius + origin.Y);

            return xy;
        }

        private static float XYToDegrees(Point xy, Point origin)
        {
            int deltaX = origin.X - xy.X;
            int deltaY = origin.Y - xy.Y;

            double radAngle = Math.Atan2(deltaY, deltaX);
            double degreeAngle = radAngle * 180.0 / Math.PI;

            return (float)(180.0 - degreeAngle);
        }

        public static Point moveTowardsPoint(Point a, Point b, int distance)
        {
            var vector = new Point(b.X - a.X, b.Y - a.Y);
            var length = Math.Sqrt(vector.X * vector.X + vector.Y * vector.Y);
            var unitVector = new PointF((float)(vector.X / length), (float)(vector.Y / length));
            return new Point((int)(a.X + unitVector.X * distance), (int)(a.Y + unitVector.Y * distance));
        }

        public static void DrawRectangleRotated(Graphics g, Rectangle r, float angle, Pen pen)
        {
            using (Matrix m = new Matrix())
            {
                m.RotateAt(angle, new PointF(r.Left + (r.Width / 2), r.Top + (r.Height / 2)));
                g.Transform = m;
                g.DrawRectangle(pen, r);
                g.ResetTransform();
            }
        }
    }
}