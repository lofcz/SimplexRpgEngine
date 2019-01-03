using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;

namespace SimplexCore
{
    public class Particle
    {
        public Texture2D Texture { get; set; } 
        public Vector2 Position { get; set; }           
        public Vector2 Velocity { get; set; } 
        public float Angle { get; set; }  
        public float AngularVelocity { get; set; }
        public Color Color { get; set; } 
        public float Size { get; set; }
        public int TTL { get; set; }
        public int TTLMax { get; set; }
        public double Alpha { get; set; }
        

        public Particle(Texture2D texture, Vector2 position, Vector2 velocity, float angle, float angularVelocity, Color color, float size, int ttl, double alpha)
        {
            Texture = texture;
            Position = position;
            Velocity = velocity;
            Angle = angle;
            AngularVelocity = angularVelocity;
            Color = color;
            Size = size;
            TTL = ttl;
            Alpha = alpha;
            TTLMax = TTL;
        }

        public Particle()
        {

        }

        public void Update()
        {
            TTL--;
            Position += Velocity;
            Angle += AngularVelocity;

            Alpha = TTL / (float)TTLMax;
        }

        public void Draw(SpriteBatch spriteBatch)
        {
            Rectangle sourceRectangle = new Rectangle(0, 0, Texture.Width, Texture.Height);
            Vector2 origin = new Vector2(Texture.Width / 2, Texture.Height / 2);

            spriteBatch.Draw(Texture, Position, sourceRectangle, Color * (float)Alpha, Angle, origin, Size, SpriteEffects.None, 0f);
        }
    }


}
