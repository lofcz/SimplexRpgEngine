using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Text;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Content;
using Microsoft.Xna.Framework.Graphics;
using MoreLinq;
using SharpDX.Direct2D1;
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
        static List<AStarCell> openList = new List<AStarCell>();
        static List<AStarCell> closedList = new List<AStarCell>();
        static AStarCell node = new AStarCell();
        private static int g = 0;

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

                    draw_set_color(mp_grid_get_cell(j, i) ? Microsoft.Xna.Framework.Color.Red : Microsoft.Xna.Framework.Color.Lime);
                    draw_rectangle(GeneralRectangle, outline);
                }
            }

            draw_primitive_batch_end();
            draw_set_color(c);
            draw_set_alpha(f);
        }

        public static GamePath mp_grid_path(Vector2 start, Vector2 goal)
        {
            Stopwatch stopwatch = new Stopwatch();
            stopwatch.Start();

            GamePath p = new GamePath();

            // 1) Convert positions to cell indexes
            int relativeX = (int)start.X - pathfindingGrid.X;
            int relativeY = (int)start.Y - pathfindingGrid.Y;

            int startX = relativeX / pathfindingGrid.CellSizeX;
            int startY = relativeY / pathfindingGrid.CellSizeY;

            relativeX = (int)goal.X - pathfindingGrid.X;
            relativeY = (int)goal.Y - pathfindingGrid.Y;

            int goalX = relativeX / pathfindingGrid.CellSizeX;
            int goalY = relativeY / pathfindingGrid.CellSizeY;

            // Prepare lists for a*
            openList.Clear();
            closedList.Clear();

            // Prepare goal + start cells
            AStarCell startCell = new AStarCell() {X = startX, Y = startY};
            AStarCell goalCell = new AStarCell() { X = goalX, Y = goalY };

            // Get all surrounding cells of the start cell
            MpAddNeighbors(startCell, startCell, goalCell);

            // loop until path is found
            bool resolved = false;

            int tried = 0;
            while (!resolved)
            {
                AStarCell lowest = MpSelectLowest();
                tried++;

                if (lowest.X == goalCell.X && lowest.Y == goalCell.Y)
                {
                    resolved = true;
                    stopwatch.Stop();
                    show_debug_message(tried.ToString());

                    // backtrack the path
                    bool backtrackDone = false;

                    while (!backtrackDone)
                    {
                        if (lowest.ParentNode != null)
                        {
                            p.points.Add(new Vector2(lowest.X * pathfindingGrid.CellSizeX + pathfindingGrid.X + 16, lowest.Y * pathfindingGrid.CellSizeY + pathfindingGrid.Y + 16));
                            lowest = lowest.ParentNode;
                        }
                        else
                        {
                            backtrackDone = true;
                            
                        }
                    }
                }
                else
                {
                    MpAddNeighbors(lowest, startCell, goalCell);
                }

                closedList.Add(lowest);
                openList.Remove(lowest);
            }

            show_debug_message(stopwatch.Elapsed.ToString());
            return p;
        }

        static AStarCell MpSelectLowest()
        {
            return openList.MinBy(x => x.F).First();
        }

        static void MpAddNeighbors(AStarCell p, AStarCell start, AStarCell end)
        {
            // N
            if (!mp_grid_get_cell(p.X, p.Y - 1) && closedList.FirstOrDefault(x => x.X == p.X && x.Y == p.Y - 1) == null)
            {
                if (openList.FirstOrDefault(x => x.X == p.X && x.Y == p.Y - 1) == null)
                {
                    node = new AStarCell() {X = p.X, Y = p.Y - 1, StartNode = start, GoalNode = end, ParentNode = p};
                    node.ComputeGHF(p);
                    openList.Add(node);
                }
                else
                {
                    node = openList.FirstOrDefault(x => x.X == p.X && x.Y == p.Y - 1);
                    node.ComputeGHF(p);
                }

            }

            // S
            if (!mp_grid_get_cell(p.X, p.Y + 1) && closedList.FirstOrDefault(x => x.X == p.X && x.Y == p.Y + 1) == null)
            {
                if (openList.FirstOrDefault(x => x.X == p.X && x.Y == p.Y + 1) == null)
                {
                    node = new AStarCell() {X = p.X, Y = p.Y + 1, StartNode = start, GoalNode = end, ParentNode = p};
                    node.ComputeGHF(p);
                    openList.Add(node);
                }
                else
                {
                    node = openList.FirstOrDefault(x => x.X == p.X && x.Y == p.Y + 1);
                    node.ComputeGHF(p);
                }
            }

            // E
            if (!mp_grid_get_cell(p.X - 1, p.Y) && closedList.FirstOrDefault(x => x.X == p.X - 1 && x.Y == p.Y) == null)
            {
                if (openList.FirstOrDefault(x => x.X == p.X - 1 && x.Y == p.Y) == null)
                {
                    node = new AStarCell() {X = p.X - 1, Y = p.Y, StartNode = start, GoalNode = end, ParentNode = p};
                    node.ComputeGHF(p);
                    openList.Add(node);
                }
                else
                {
                    node = openList.FirstOrDefault(x => x.X == p.X - 1 && x.Y == p.Y);
                    node.ComputeGHF(p);
                }
            }

            // W
            if (!mp_grid_get_cell(p.X + 1, p.Y) && closedList.FirstOrDefault(x => x.X == p.X + 1 && x.Y == p.Y) == null)
            {
                if (openList.FirstOrDefault(x => x.X == p.X + 1 && x.Y == p.Y) == null)
                {
                    node = new AStarCell() {X = p.X + 1, Y = p.Y, StartNode = start, GoalNode = end, ParentNode = p};
                    node.ComputeGHF(p);
                    openList.Add(node);
                }
                else
                {
                    node = openList.FirstOrDefault(x => x.X == p.X + 1 && x.Y == p.Y);
                    node.ComputeGHF(p);
                }
            }

            // NE
            if (!mp_grid_get_cell(p.X + 1, p.Y - 1) && closedList.FirstOrDefault(x => x.X == p.X + 1 && x.Y == p.Y - 1) == null)
            {
                if (openList.FirstOrDefault(x => x.X == p.X + 1 && x.Y == p.Y - 1) == null)
                {
                    node = new AStarCell() {X = p.X + 1, Y = p.Y - 1, StartNode = start, GoalNode = end, ParentNode = p};
                    node.ComputeGHF(p);
                    openList.Add(node);
                }
                else
                {
                    node = openList.FirstOrDefault(x => x.X == p.X + 1 && x.Y == p.Y - 1);
                    node.ComputeGHF(p);
                }
            }

            // NW
            if (!mp_grid_get_cell(p.X - 1, p.Y - 1) && closedList.FirstOrDefault(x => x.X == p.X - 1 && x.Y == p.Y - 1) == null)
            {
                if (openList.FirstOrDefault(x => x.X == p.X - 1 && x.Y == p.Y - 1) == null)
                {
                    node = new AStarCell() {X = p.X - 1, Y = p.Y - 1, StartNode = start, GoalNode = end, ParentNode = p};
                    node.ComputeGHF(p);
                    openList.Add(node);
                }
                else
                {
                    node = openList.FirstOrDefault(x => x.X == p.X - 1 && x.Y == p.Y - 1);
                    node.ComputeGHF(p);
                }
            }

            // SE
            if (!mp_grid_get_cell(p.X + 1, p.Y + 1) && closedList.FirstOrDefault(x => x.X == p.X + 1 && x.Y == p.Y + 1) == null)
            {
                if (openList.FirstOrDefault(x => x.X == p.X + 1 && x.Y == p.Y + 1) == null)
                {
                    node = new AStarCell() {X = p.X + 1, Y = p.Y + 1, StartNode = start, GoalNode = end, ParentNode = p};
                    node.ComputeGHF(p);
                    openList.Add(node);
                }
                else
                {
                    node = openList.FirstOrDefault(x => x.X == p.X + 1 && x.Y == p.Y + 1);
                    node.ComputeGHF(p);
                }
            }

            // SW
            if (!mp_grid_get_cell(p.X - 1, p.Y + 1) && closedList.FirstOrDefault(x => x.X == p.X - 1 && x.Y == p.Y + 1) == null)
            {
                if (openList.FirstOrDefault(x => x.X == p.X - 1 && x.Y == p.Y + 1) == null)
                {
                    node = new AStarCell() {X = p.X - 1, Y = p.Y + 1, StartNode = start, GoalNode = end, ParentNode = p};
                    node.ComputeGHF(p);
                    openList.Add(node);
                }
                else
                {
                    node = openList.FirstOrDefault(x => x.X == p.X - 1 && x.Y == p.Y + 1);
                    node.ComputeGHF(p);
                }
            }
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
            if (x >= 0 && y >= 0)
            {
                return pathfindingGrid.Grid[y * pathfindingGrid.CellsX + x, 0];
            }

            return true;
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

    public class AStarCell
    {
        public int X;
        public int Y;
        public double G;
        public double H;
        public double F;
        public AStarCell StartNode;
        public AStarCell GoalNode;
        public AStarCell ParentNode;

        public void ComputeGHF(AStarCell pNode)
        {
            int dX = Math.Abs(pNode.X - X);
            int dY = Math.Abs(pNode.Y - Y);
            double k = 0;

            if (dX > dY)
            {
                k = G + (14 * dY + 10 * (dX - dY));
            }
            else
            {
                k = G + (14 * dX + 10 * (dY - dX));
            }

            //if (k < G)
            {
                G = k;
                H = k - G;
                F = G + H;
                ParentNode = pNode;
            }
        }
    }
}
