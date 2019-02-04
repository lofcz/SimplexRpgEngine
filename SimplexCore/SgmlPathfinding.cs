using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Text;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Content;
using Microsoft.Xna.Framework.Graphics;
using MoreLinq;
using SharpDX.Direct2D1;
using TagLib.Riff;
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
        private static Heap<AStarCell> openList;
        static List<AStarCell> tempList = new List<AStarCell>();
        static HashSet<AStarCell> closedList = new HashSet<AStarCell>();
        static AStarCell node = new AStarCell();
        private static int g = 0;
        public static int heapSize = 0;

        public static void mp_grid_create(Rectangle rect, Size cellSize)
        {
            pathfindingGrid = new PathfingingGrid();

            pathfindingGrid.Grid = new AStarCell[rect.Width, rect.Height];
            pathfindingGrid.X = rect.X;
            pathfindingGrid.Y = rect.Y;
            pathfindingGrid.CellSizeX = cellSize.Width;
            pathfindingGrid.CellSizeY = cellSize.Height;
            pathfindingGrid.CellsX = rect.Width / pathfindingGrid.CellSizeX;
            pathfindingGrid.CellsY = rect.Height / pathfindingGrid.CellSizeY;

            heapSize = pathfindingGrid.CellsX * pathfindingGrid.CellsY;

            for (var i = 0; i < pathfindingGrid.CellsY; i++)
            {
                for (var j = 0; j < pathfindingGrid.CellsX; j++)
                {
                    pathfindingGrid.Grid[j, i] = new AStarCell() {X = j, Y = i, Empty = true};
                }
            }

        }

        public static bool mp_potential_step(Vector2 start, Vector2 goal, bool allowDiag = true)
        {
            potential cur_check = new potential(){X = (int)start.X, Y = (int)start.X};
            
            int complete = 1;

            bool result = true;
            
            if (complete != 0)
            {     
            
                if (cur_check.X < goal.X)
                {
                    cur_check.X  = cur_check.X + 16;
                }
                if (cur_check.X > goal.X)
                {
                    cur_check.X  = cur_check.X - 16;
                }
                if (cur_check.Y < goal.Y)
                {
                    cur_check.Y  = cur_check.Y + 16;
                }
                if (cur_check.Y > goal.Y)
                {
                    cur_check.Y  = cur_check.Y - 16;
                }

                if (!PlaceEmpty(new Vector2(cur_check.X, cur_check.Y)))
                {
                    complete = 0;
                    return result = false;
                }

                if (cur_check.X == goal.X && cur_check.Y == goal.Y)
                {
                    complete = 0;
                    return result = true;
                }
            }

            return result;
        }

        class potential
        {
            public int X { get; set; }
            public int Y { get; set; }
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
                    GeneralRectangle.X = j * pathfindingGrid.CellSizeX + pathfindingGrid.X;
                    GeneralRectangle.Y = i * pathfindingGrid.CellSizeY + pathfindingGrid.Y;
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

        static List<AStarCell> MpGetNeighbors(AStarCell cell, bool allowDiag)
        {
            tempList.Clear();

            for (int x = -1; x <= 1; x++)
            {
                for (int y = -1; y <= 1; y++)
                {
                    if (x == 0 && y == 0) { continue; }

                    if (!allowDiag)
                    {
                        if (x == -1 && y == -1)
                        {
                            continue;                          
                        }

                        if (x == 1 && y == -1)
                        {
                            continue;                          
                        }

                        if (x == -1 && y == 1)
                        {
                            continue;
                        }

                        if (x == 1 && y == 1)
                        {
                            continue;
                        }
                    }

                    int cX = cell.X + x;
                    int cY = cell.Y + y;

                    if (cX >= 0 && cX <= pathfindingGrid.CellsX && cY >= 0 && cY <= pathfindingGrid.CellsY)
                    {
                        tempList.Add(pathfindingGrid.Grid[cX, cY]);
                    }
                }
            }

            return tempList;
        }

        public static GamePath mp_grid_path(Vector2 start, Vector2 goal, bool allowDiag = true)
        {
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

            // Prepare heaps for a*
            openList = new Heap<AStarCell>(heapSize);
            closedList.Clear();

            // Prepare goal + start cells
            AStarCell startCell = pathfindingGrid.Grid[startX, startY];
            AStarCell goalCell = pathfindingGrid.Grid[goalX, goalY];

            openList.Add(startCell);
            int iter = 0;

            while (openList.Count > 0)
            {
                AStarCell currentNode = openList.RemoveFirst();
                closedList.Add(currentNode);

                if (currentNode.X == goalX && currentNode.Y == goalY)
                {
                    RetracePath(startCell, goalCell);

                    foreach (AStarCell a in tempList)
                    {
                       p.points.Add(new Vector2(a.X * pathfindingGrid.CellSizeX + pathfindingGrid.X + 16, a.Y * pathfindingGrid.CellSizeY + pathfindingGrid.Y + 16));     
                    }

                    break;
                }

                foreach (AStarCell cell in MpGetNeighbors(currentNode, allowDiag))
                {
                    if (cell == null || !cell.Empty || closedList.Contains(cell))
                    {
                        continue;
                    }

                    int d = currentNode.G + MpGetDistance(currentNode, cell);

                    if (d < cell.G || !openList.Contains(cell))
                    {
                        cell.G = d;
                        cell.H = MpGetDistance(cell, goalCell);
                        cell.F = cell.G + cell.H;

                        cell.ParentNode = currentNode;

                        if (!openList.Contains(cell))
                        {
                            openList.Add(cell);
                        }
                    }
                }
            }

            return p;
        }

        static void RetracePath(AStarCell start, AStarCell end)
        {
            List<AStarCell> path = new List<AStarCell>();
            AStarCell cNode = end;

            while (cNode != start)
            {
                path.Add(cNode);
                cNode = cNode.ParentNode;
            }

            tempList = path;
        }

        static int MpGetDistance(AStarCell a, AStarCell b)
        {
            int dx = Math.Abs(a.X - b.X);
            int dy = Math.Abs(a.Y - b.Y);

            if (dx > dy)
            {
                return 14 * dy + 10 * (dx - dy);
            }

            return 14 * dx + 10 * (dy - dx);
        }

        public static void mp_grid_set_instance(GameObject go, bool empty = false)
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

        public static void mp_grid_set_rectangle(int x, int y, int w, int h, bool empty = false)
        {
            for (int i = y; i < y + h; i++)
            {
                for (int j = x; j < x + w; j++)
                {
                    mp_grid_set_cell(j, i, empty);
                }
            }
        }

        public static void mp_grid_set_cell(int x, int y, bool empty = false)
        {
            if (x >= 0 && y >= 0 && x < pathfindingGrid.CellsX && y < pathfindingGrid.CellsY)
            {
                pathfindingGrid.Grid[x, y].Empty = empty;
            }
        }

        public static bool mp_grid_get_cell(int x, int y)
        {
            return pathfindingGrid.Grid[x, y].Empty;
        }

        public static void mp_grid_clear()
        {
            for (int i = 0; i < pathfindingGrid.CellsY; i++)
            {
                for (int j = 0; j < pathfindingGrid.CellsX; j++)
                {
                    mp_grid_set_cell(j, i, true);
                }
            }
        }
    }

    public class PathfingingGrid
    {
        public AStarCell[,] Grid;
        public int X;
        public int Y;
        public int CellSizeX;
        public int CellSizeY;
        public int CellsX;
        public int CellsY;
    }

    public class AStarCell : IHeapItem<AStarCell>
    {
        public int X;
        public int Y;
        public int G;
        public int H;
        public int F;
        private int heapIndex;

        public int HeapIndex
        {
            get { return heapIndex; }

            set { heapIndex = value; }
        }

        public bool Empty;
        public AStarCell StartNode;
        public AStarCell GoalNode;
        public AStarCell ParentNode;

        public AStarCell()
        {
            Empty = true;
        }

        public int CompareTo(AStarCell toCompare)
        {
            int compare = F.CompareTo(toCompare.F);

            if (compare == 0)
            {
                compare = H.CompareTo(toCompare.H);
            }

            return -compare;
        }
    }
}
