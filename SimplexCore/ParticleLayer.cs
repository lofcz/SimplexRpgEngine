using System;
using System.Collections.Generic;
using System.Text;

namespace SimplexCore
{
    public class ParticleLayer : RoomLayer
    {
        public List<ParticleEngine> Emmiters = new List<ParticleEngine>();

        public ParticleLayer()
        {
            LayerType = LayerTypes.typeParticle;
        }
    }
}
