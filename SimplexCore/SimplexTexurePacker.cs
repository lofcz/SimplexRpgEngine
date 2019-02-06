using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Content;
using Microsoft.Xna.Framework.Graphics;

namespace SimplexCore
{
    public static class SimplexTexurePacker
    {
        public static void PackTextures(Texture2D[] textures, int pageSize)
        {
            // 0. preapare a list of rectangles 
            List<Rectangle> cells = new List<Rectangle>();
            cells.Add(new Rectangle(0, 0, pageSize, pageSize));

            // 1. generate TexturePrepacked[] pro Texture2D[]
            TexturePrepacked[] prepacked = new TexturePrepacked[textures.Length];

            for (var i = 0; i < prepacked.Length; i++)
            {
                TexturePrepacked p = new TexturePrepacked();
                p.Tex = textures[i];
                p.MaxSize = textures[i].Width * textures[i].Height;

                prepacked[i] = p;
            }

            // 2. sort input by maxsize
            prepacked = prepacked.OrderByDescending(x => x.MaxSize).ToArray();

            // 3. generate a new texture page
            RenderTarget2D page = Sgml.surface_create(pageSize, pageSize);

            // 4. find first to fit rectangle for each texture
            Sgml.surface_set_target(page);
            List<RectangleCadidate> candidates = new List<RectangleCadidate>();

            foreach (TexturePrepacked t in prepacked)
            {
                candidates.Clear();
                foreach (Rectangle r in cells)
                {
                    if (t.FitsToRectangle(r))
                    {
                        RectangleCadidate rc = new RectangleCadidate();
                        rc.r = r;
                        rc.LeftArea = t.LeftArea(r);  
                        
                        candidates.Add(rc);
                    }                    
                }

                if (candidates.Count > 0)
                {
                    // Split this rectangle to two new rectangles
                    Rectangle r = candidates.OrderBy(x => x.LeftArea).ToList()[0].r;
                    Rectangle r1 = new Rectangle(r.X + t.Tex.Width, r.Y, r.Width - t.Tex.Width, t.Tex.Height);
                    Rectangle r2 = new Rectangle(r.X, r.Y + t.Tex.Height, r.Width, r.Height - t.Tex.Height);

                    Sgml.draw_sprite(t.Tex, -2, new Vector2(r.X, r.Y));

                    cells.Remove(r);
                    cells.Add(r1);
                    cells.Add(r2);
                }
            }
            Sgml.surface_reset_target();

            Sgml.surface_save(page, "kokotiSurface");
        }

        struct RectangleCadidate
        {
            public int LeftArea;
            public Rectangle r;
        }
    }

    public class TexturePrepacked
    {
        public Texture2D Tex { get; set; }
        public int MaxSize { get; set; }

        public bool FitsToRectangle(Rectangle r)
        {
            return (r.Width >= Tex.Width && r.Height >= Tex.Height);
        }

        public int LeftArea(Rectangle r)
        {
            return Math.Abs((r.Height * r.Width) - (Tex.Width * Tex.Height));
        }
    }
}
