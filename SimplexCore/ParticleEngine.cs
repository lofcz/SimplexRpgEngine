using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;

namespace SimplexCore
{
    public class ParticleEngine
    {
        private Random random;
        public Vector2 EmitterLocation { get; set; }
        private List<Particle> particles;
        private List<Texture2D> textures;

        public ParticleEngine(List<Texture2D> textures, Vector2 location)
        {
            EmitterLocation = location;
            this.textures = textures;
            this.particles = new List<Particle>();
            random = new Random();
        }

        public ParticleEngine()
        {

        }

        private Particle GenerateNewParticle()
        {
            Texture2D texture = textures[random.Next(textures.Count)];
            Vector2 position = EmitterLocation;

            double rr = random.NextDouble() * 5;
            Vector2 velocity = new Vector2((float)random.NextDouble() * 5 * Sgml.choose(1, -1), (float)random.NextDouble() * 5 * Sgml.choose(1, -1));
            float angle = 0;
            float angularVelocity = 0.1f * (float)(random.NextDouble() * 5 - 1);
            Color color = new Color(
                (float)random.NextDouble(),
                (float)random.NextDouble(),
                (float)random.NextDouble());
            float size = (float)random.NextDouble();
            int ttl = 20 + random.Next(40);

            return new Particle(texture, position, velocity, angle, angularVelocity, color, size, ttl, 1);
        }

        public void Setup()
        {
            int total = 10;

            for (int i = 0; i < total; i++)
            {
                particles.Add(GenerateNewParticle());
            }
        }

        public void Update()
        {
            for (int particle = 0; particle < particles.Count; particle++)
            {
                particles[particle].Update();
                if (particles[particle].TTL <= 0)
                {
                    particles.RemoveAt(particle);
                    particle--;
                }
            }
        }

        public void Draw(SpriteBatch spriteBatch)
        {
            spriteBatch.Begin(transformMatrix: Sgml.m);
            for (int index = 0; index < particles.Count; index++)
            {
                particles[index].Draw(spriteBatch);
            }
            spriteBatch.End();
        }
    }
}
