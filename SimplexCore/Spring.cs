using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Xna.Framework;

namespace SimplexCore
{
    public class Spring
    {
        public float Position, Velocity, Height, TargetHeight, Speed;

        public Spring()
        {
            TargetHeight = 100;
            Height = (float)Sgml.random_range(0, 100);
            Speed = 0.001f;
            Velocity = 0.001f;

        }


        public void Update(float d, float t)
        {
            const float k = 0.001f; // adjust this value to your liking
            float x = Height - TargetHeight;
            float acceleration = -k * x;

            Position += Velocity;
            Velocity += acceleration;
        }

        public void Splash(float speed)
        {
           Speed = speed;
        }

        public static List<Spring> UpdateSprings(Spring[] springs)
        {
            float Dampening = 0.00025f;
            float Spread = 0.02f;//0.25f;
            float Tension = 0.001f;

            for (int i = 0; i < springs.Length; i++)
            {
                springs[i].Update(Dampening, Tension);
            }

            float[] leftDeltas = new float[springs.Length];
            float[] rightDeltas = new float[springs.Length];

            // do some passes where springs pull on their neighbours
            for (int j = 0; j < 8; j++)
            {
                for (int i = 0; i < springs.Length; i++)
                {
                    if (i > 0)
                    {
                        leftDeltas[i] = Spread * (springs[i].Height - springs[i - 1].Height);
                        springs[i - 1].Speed += leftDeltas[i];
                    }
                    if (i < springs.Length - 1)
                    {
                        rightDeltas[i] = Spread * (springs[i].Height - springs[i + 1].Height);
                        springs[i + 1].Speed += rightDeltas[i];
                    }
                }

                for (int i = 0; i < springs.Length; i++)
                {
                    if (i > 0)
                        springs[i - 1].Height += leftDeltas[i];
                    if (i < springs.Length - 1)
                        springs[i + 1].Height += rightDeltas[i];
                }
            }

            return springs.ToList();
        }
    }

}
