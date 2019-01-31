using System;
using System.Collections.Generic;
using System.Drawing;
using System.Text;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Content;
using Microsoft.Xna.Framework.Graphics;
using Point = System.Drawing.Point;
using Rectangle = System.Drawing.Rectangle;

namespace SimplexCore
{
    public static partial class Sgml
    {
        public enum PathfindingAttributes
        {
            CellFree
        }

        private static PathfingingGrid pathfindingGrid = new PathfingingGrid();

        public static void mp_grid_create(Rectangle rect, Size cellSize)
        {
            pathfindingGrid = new PathfingingGrid();

            pathfindingGrid.Grid = new bool[rect.Width * rect.Height, Enum.GetNames(typeof(PathfindingAttributes)).Length];
            pathfindingGrid.X = rect.X;
            pathfindingGrid.Y = rect.Y;
            pathfindingGrid.CellSizeX = cellSize.Width;
            pathfindingGrid.CellSizeY = cellSize.Height;
            pathfindingGrid.CellsX = rect.Width / pathfindingGrid.CellSizeX;
            pathfindingGrid.CellsY = rect.Height / pathfindingGrid.CellSizeY;

        }

        public static void mp_grid_draw(bool outline = true, double alpha = .5)
        {
            draw_primitive_batch_start(!outline ? PrimitiveType.TriangleList : PrimitiveType.LineList, outline);
            Microsoft.Xna.Framework.Color c = DrawGetColor();
            double f = DrawGetAlpha();

            draw_set_alpha(alpha);
            for (int i = 0; i < pathfindingGrid.CellsY; i++)
            {
                for (int j = 0; j < pathfindingGrid.CellsX; j++)
                {
                    GeneralRectangle.X = j * pathfindingGrid.CellSizeX;
                    GeneralRectangle.Y = i * pathfindingGrid.CellSizeY;
                    GeneralRectangle.Width = pathfindingGrid.CellSizeX;
                    GeneralRectangle.Height = pathfindingGrid.CellSizeY;

                    draw_set_color(mp_grid_get_cell(j, i) ? Microsoft.Xna.Framework.Color.Lime : Microsoft.Xna.Framework.Color.Red);
                    draw_rectangle(GeneralRectangle, outline);
                }
            }

            draw_primitive_batch_end();
            draw_set_color(c);
            draw_set_alpha(f);
        }

        public static void mp_grid_set_instance(GameObject go, bool empty = true)
        {
            // rasterize entire shit based on bounding box

            if (Math.Abs(go.ImageAngle) < .5f)
            {
                Microsoft.Xna.Framework.Rectangle r = go.CollisionContainer;
                int relativeX = (int) go.X - pathfindingGrid.X;
                int relativeY = (int) go.Y - pathfindingGrid.Y;

                mp_grid_set_rectangle(relativeX / pathfindingGrid.CellSizeX, relativeY / pathfindingGrid.CellSizeY, (int) ceil(r.Width / (float) pathfindingGrid.CellSizeX), (int) ceil(r.Height / (float) pathfindingGrid.CellSizeY), empty);
            }
            else
            {
                RotatedRectangle rr = go.rr;
                Vector2 p = new Vector2();

                for (int i = 0; i < pathfindingGrid.CellsY; i++)
                {
                    for (int j = 0; j < pathfindingGrid.CellsX; j++)
                    {
                        p.X = j * pathfindingGrid.CellSizeX + pathfindingGrid.CellSizeX / 2;
                        p.Y = i * pathfindingGrid.CellSizeY + pathfindingGrid.CellSizeX / 2;

                        if (rr.Contains(p))
                        {
                            mp_grid_set_cell(j, i);
                        }
                    }
                }
            }
        }

        public static void mp_grid_set_rectangle(int x, int y, int w, int h, bool empty = true)
        {
            for (int i = y; i < y + h; i++)
            {
                for (int j = x; j < x + w; j++)
                {
                    mp_grid_set_cell(j, i, empty);
                }
            }
        }

        public static void mp_grid_set_cell(int x, int y, bool empty = true)
        {
            pathfindingGrid.Grid[y * pathfindingGrid.CellsX + x, 0] = empty;
        }

        public static bool mp_grid_get_cell(int x, int y)
        {
            return pathfindingGrid.Grid[y * pathfindingGrid.CellsX + x, 0];
        }

        public static void mp_grid_clear()
        {
            for (int i = 0; i < pathfindingGrid.CellsY; i++)
            {
                for (int j = 0; j < pathfindingGrid.CellsX; j++)
                {
                    mp_grid_set_cell(j, i, false);
                }
            }
        }
    }

    public class PathfingingGrid
    {
        public bool[,] Grid;
        public int X;
        public int Y;
        public int CellSizeX;
        public int CellSizeY;
        public int CellsX;
        public int CellsY;
    }
}
