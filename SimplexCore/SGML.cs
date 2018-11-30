using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;
using MonoGame.Extended;
using SharpDX;
using Color = Microsoft.Xna.Framework.Color;
using Matrix = System.Drawing.Drawing2D.Matrix;
using Rectangle = Microsoft.Xna.Framework.Rectangle;
using RectangleF = MonoGame.Extended.RectangleF;
using Vector2 = Microsoft.Xna.Framework.Vector2;

namespace SimplexCore
{
    public static partial class Sgml
    {
        public static List<GameObject> SceneObjects = new List<GameObject>();
        public static List<TextureReference> Textures = new List<TextureReference>();
        private static int _randomSeed = DateTime.Now.Millisecond;
        public static Random _random = new Random();
        private static double _epsilon = 0.000001;
        public static SpriteBatch sb;
        private static Color _color = Color.White;
        private static SpriteFont drawFont;
        public static VertexBuffer vb;
        public static BasicEffect be;
        public static Microsoft.Xna.Framework.Matrix m;

        public static Color DrawColor
        {
            get { return FinalizeColor(_color); }
            set { _color = value; }
        }

        private static float drawAlpha = 1;
        private static int drawCirclePrecision = 32;

        private static Color FinalizeColor(Color c)
        {
            c *= drawAlpha;
            return c;
        }

        public static bool PlaceEmpty(Vector2 position)
        {
            if (SceneObjects.Count > 0)
            {
                foreach (GameObject g in SceneObjects)
                {
                    Rectangle r = new Rectangle((int) g.Position.X, (int) g.Position.Y, g.Sprite.ImageRectangle.Width,
                        g.Sprite.ImageRectangle.Height);

                    if (r.Contains(position))
                    {
                        return false;
                    }
                }
            }

            return true;
        }

        public static GameObject InstancePlace(Vector2 vec)
        {
            if (SceneObjects.Count > 0)
            {
                List<GameObject> sortedObjects = SceneObjects.OrderBy(x => x.Layer.Depth).ToList();
                for (int i = sortedObjects.Count - 1; i >= 0; i--)
                {
                    Rectangle r = new Rectangle((int)sortedObjects[i].Position.X, (int)sortedObjects[i].Position.Y,
                        sortedObjects[i].Sprite.ImageRectangle.Width, sortedObjects[i].Sprite.ImageRectangle.Height);

                    if (r.Contains(vec))
                    {
                        return SceneObjects.FirstOrDefault(x => x.Equals(sortedObjects[i]));
                    }
                }
            }

            return null;
        }
        
        public static Color RandomColor()
        {
            return new Color(_random.Next(255), _random.Next(255), _random.Next(255));
        }

        public static void DrawRectangle(float x1, float y1, float x2, float y2, bool outline)
        {
            if (!outline)
            {
                sb.FillRectangle(new RectangleF(x1, y1, Math.Abs(x1 - x2), Math.Abs(y1 - y2)), DrawColor);
            }
            else
            {
                sb.DrawRectangle(new RectangleF(x1, y1, Math.Abs(x1 - x2), Math.Abs(y1 - y2)), DrawColor);
            }          
        }

        public static void DrawRectangle(Vector2 position, Vector2 size, bool outline)
        {
            if (!outline)
            {
                sb.FillRectangle(new RectangleF(position.X, position.Y, size.X, size.Y), DrawColor);
            }
            else
            {
                sb.DrawRectangle(new RectangleF(position.X, position.Y, size.X, size.Y), DrawColor);
            }
                    
        }

        public static void DrawRectangle(Vector2 position, Vector2 size, bool outline, float lineThickness)
        {
            if (!outline)
            {
                sb.FillRectangle(new RectangleF(position.X, position.Y, size.X, size.Y), DrawColor);
            }
            else
            {
                sb.DrawRectangle(new RectangleF(position.X, position.Y, size.X, size.Y), DrawColor, lineThickness);
            }
        }

        public static void draw_set_alpha(double alpha)
        {
            alpha = alpha.Clamp(0, 1);
            drawAlpha = (float)alpha;
        }

        public static void DrawSetColor(Color c)
        {
            DrawColor = c;
        }

        public static double DrawGetAlpha()
        {
            return drawAlpha;
        }

        public static Color DrawGetColor()
        {
            return DrawColor;
        }

        /* ----------------------------------------------------------------------------------------------------
         * Math
         * ----------------------------------------------------------------------------------------------------
         */


        /*
         *  ------------------------------------- Random ------------------------------------
         */
        public static T choose<T>(params T[] items)
        {
            return items[_random.Next(0, items.Length)];
        }

        public static double random(double n)
        {
            return _random.NextDouble() * n;
        }

        public static double random_range(double n1, double n2)
        {
            return _random.NextDouble(n1, n2);
        }

        public static int irandom(int n)
        {
            return _random.Next(n);
        }

        public static int irandom_range(int n1, int n2)
        {
            return _random.Next(n1, n2);
        }

        public static void random_set_seed(int seed)
        {
            _randomSeed = seed;
            _random = new Random(_randomSeed);
        }

        public static int random_get_seed()
        {
            return _randomSeed;
        }

        public static void randomize()
        {
            _randomSeed = DateTime.Now.Millisecond;
            _random = new Random(_randomSeed);
        }

        /*
         *  ------------------------------------- Trigonometry ------------------------------------
         */
        public static double arccos(double x)
        {
            return ApplyEpsilon(Math.Acos(x));
        }

        public static double arcsin(double x)
        {
            return ApplyEpsilon(Math.Asin(x));
        }

        public static double arctan(double x)
        {
            return ApplyEpsilon(Math.Atan(x));
        }

        public static double arctan2(double x, double y)
        {
            return ApplyEpsilon(Math.Atan2(x, y));
        }

        public static double sin(double x)
        {
            return ApplyEpsilon(Math.Sin(x));
        }

        public static double cos(double x)
        {
            return ApplyEpsilon(Math.Cos(x));
        }

        public static double tan(double x)
        {
            return ApplyEpsilon(Math.Tan(x));
        }

        public static double dsin(double x)
        {
            return ApplyEpsilon(Math.Sin(MathHelper.ToRadians((float)x)) * (1 / _epsilon));
        }

        public static double dcos(double x)
        {
            return ApplyEpsilon(Math.Cos(MathHelper.ToRadians((float)x)) * (1 / _epsilon));
        }

        public static double dtan(double x)
        {
            return ApplyEpsilon(Math.Tan(MathHelper.ToRadians((float)x)) * (1 / _epsilon));
        }

        public static double darcsin(double x)
        {
            return ApplyEpsilon(Math.Asin(MathHelper.ToRadians((float)x)) * (1 / _epsilon));
        }

        public static double darccos(double x)
        {
            return ApplyEpsilon(Math.Acos(MathHelper.ToRadians((float)x)) * (1 / _epsilon));
        }

        public static double darctan(double x)
        {
            return ApplyEpsilon(Math.Atan(MathHelper.ToRadians((float)x)) * (1 / _epsilon));
        }

        public static double darctan2(double y, double x)
        {
            return ApplyEpsilon(Math.Atan2(MathHelper.ToRadians((float)y), MathHelper.ToRadians((float)x)) * (1 / _epsilon));
        }

        /*
         *  ------------------------------------- Rounding ------------------------------------
         */
        public static double degtorad(double x)
        {
            return ApplyEpsilon(MathHelper.ToRadians((float)x));
        }

        public static double radtodeg(double x)
        {
            return ApplyEpsilon(MathHelper.ToDegrees((float)x));
        }

        public static double lengthdir_x(double len, double dir)
        {
            return ApplyEpsilon(Math.Cos(dir * Math.PI / 180) * len);
        }

        public static double lengthdir_y(double len, double dir)
        {
            return ApplyEpsilon(Math.Sin(dir * Math.PI / 180) * len);
        }

        public static double round(double n)
        {
            return ApplyEpsilon(Math.Round(n));
        }

        public static double floor(double n)
        {
            return ApplyEpsilon(Math.Floor(n));
        }

        public static double frac(double n)
        {
            return ApplyEpsilon(n - Math.Truncate(n));
        }

        public static double abs(double n)
        {
            return ApplyEpsilon(Math.Abs(n));
        }

        public static int sign(double n)
        {
            return Math.Sign(n);
        }

        public static double ceil(double n)
        {
            return ApplyEpsilon(Math.Ceiling(n));
        }

        public static T max<T>(params T[] items)
        {
            return items.Max();
        }

        public static double mean(params double[] items)
        {
            return ApplyEpsilon(items.Average());
        }

        public static double median(params double[] items)
        {
            Array.Sort(items);
            return items[items.Length / 2];
        }

        public static T min<T>(params T[] items)
        {
            return items.Min();
        }

        public static double lerp(double a, double b, double amt)
        {
            return ApplyEpsilon(MathHelper.Lerp((float)a, (float)b, (float)amt));
        }

        public static double clamp(double val, double min, double max)
        {
            return ApplyEpsilon(MathHelper.Clamp((float) val, (float) min, (float) max));
        }

        /*
         *  ------------------------------------- Misc ------------------------------------
         */

        public static double exp(double n)
        {
            return ApplyEpsilon(Math.Pow(Math.E, n));
        }

        public static double ln(double n)
        {
            return ApplyEpsilon(Math.Log(n, Math.E));
        }

        public static double power(double x, int n)
        {
            return ApplyEpsilon(Math.Pow(x, n));
        }

        public static double sqr(double x)
        {
            return ApplyEpsilon(Math.Pow(x, 2));
        }

        public static double sqrt(double x)
        {
            return ApplyEpsilon(Math.Sqrt(x));
        }

        public static double log2(double n)
        {
            return ApplyEpsilon(Math.Log(n, 2));
        }

        public static double log10(double n)
        {
            return ApplyEpsilon(Math.Log(n, 10));
        }

        public static double logn(double n, double val)
        {
            return ApplyEpsilon(Math.Log(val, n));
        }

        /*
         *  ------------------------------------- Vector ------------------------------------
         */

        public static double point_direction(double x1, double y1, double x2, double y2)
        {
            double xDiff = x2 - x1;
            double yDiff = y2 - y1;
            return ApplyEpsilon(360 - (Math.Atan2(yDiff, xDiff) * 180.0 / Math.PI));
        }

        public static double point_direction(Vector2 point1, Vector2 point2)
        {
            double xDiff = point2.X - point1.Y;
            double yDiff = point2.Y - point1.Y;
            return ApplyEpsilon(360 - (Math.Atan2(yDiff, xDiff) * 180.0 / Math.PI));
        }

        public static double point_distance(double x1, double y1, double x2, double y2)
        {
            return ApplyEpsilon((Math.Pow(x1 - x2, 2) + Math.Pow(y1 - y2, 2)));
        }

        public static double point_distance(Vector2 point1, Vector2 point2)
        {
            return ApplyEpsilon((Math.Pow(point1.X - point2.X, 2) + Math.Pow(point1.Y - point2.Y, 2)));
        }

        public static double dot_product(double x1, double y1, double x2, double y2)
        {
            return ApplyEpsilon((x1 * x2) + (y1 * y2));
        }

        public static double dot_product(Vector2 point1, Vector2 point2)
        {
            return ApplyEpsilon(point1.Dot(point2));
        }

        public static double dot_product_normalised(double x1, double y1, double x2, double y2)
        {
            double dotProduct = dot_product(x1, y1, x2, y2);
            double mag1 = sqrt(x1 * x1 + y1 * y1);
            double mag2 = sqrt(x2 * x2 + y2 * y2);
            return ApplyEpsilon((dotProduct) / (mag1 * mag2));
        }

        public static double dot_product_normalised(Vector2 point1, Vector2 point2)
        {
            double dotProduct = dot_product(point1, point2);
            double mag1 = sqrt(point1.X * point1.X + point1.Y * point1.Y);
            double mag2 = sqrt(point2.X * point2.X + point2.Y * point2.Y);
            return ApplyEpsilon((dotProduct) / (mag1 * mag2));
        }

        public static double angle_difference(double src, double dest)
        {
            dest %= 360;
            src %= 360;
            return src - dest;
        }

        /*
         *  ------------------------------------- Epsilon ------------------------------------
         */
        public static void math_set_epsilon(double epsilon)
        {
            _epsilon = epsilon;
        }

        public static double math_get_epsilon()
        {
            return ApplyEpsilon(_epsilon);
        }

        private static double ApplyEpsilon(double x)
        {
            return Math.Ceiling(x * (1 / _epsilon)) / (1 / _epsilon);
        }
    }
}
