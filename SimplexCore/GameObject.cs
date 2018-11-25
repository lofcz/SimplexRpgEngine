using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Text;
using System.Windows.Forms;
using System.Xml.Serialization;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;
using SimplexResources.Objects;
using SimplexIde;
using Color = System.Drawing.Color;

namespace SimplexCore
{
    [Serializable]
    public class GameObject : IDisposable
    {
        [XmlIgnore]
        public Sprite Sprite;
        public Vector2 Position;

        [XmlIgnore]
        public Type OriginalType;


        [XmlIgnore]
        public ToolStripItemCollection EditorOptions = new ToolStripItemCollection(new ToolStrip(), new ToolStripItem[] {new ToolStripMenuItem("Kill1")});

        public string TypeString;


        public float ImageIndex
        {
            get => _imageIndex;
            set
            {
                _imageIndex = value;
                _imageIndex = _imageIndex.Clamp(0, FramesCount);
            }
        }

        public float ImageAngle;
        public float ImageAngleTarget;
        public float TransformSpeed;
        public Vector2 ImageScale;
        public Vector2 ImageScaleTarget;
        public float ImageAlpha;

        [XmlIgnore]
        public string EditorPath;

        [XmlIgnore]
        public int FramesCount;

        [XmlIgnore]
        public int Id;

        private float _imageIndex;

        public GameObject()
        {
            ImageScale = Vector2.One;
            ImageScaleTarget = Vector2.One;
            ImageAngle = 0;
            ImageAngleTarget = 0;
            ImageIndex = 0;
            TransformSpeed = 0.2f;
            Sprite = new Sprite();
            ImageAlpha = 1;
        }



        public void UpdateImageAngle()
        {
            ImageAngle = SimplexMath.Lerp(ImageAngle, ImageAngleTarget, TransformSpeed);
        }

        public void UpdateImageScale()
        {
            ImageScale = new Vector2(SimplexMath.Lerp(ImageScale.X, ImageScaleTarget.X, TransformSpeed), SimplexMath.Lerp(ImageScale.Y, ImageScaleTarget.Y, TransformSpeed));
        }


        // Editor events
        public virtual void DrawNode(SpriteBatch s, SpriteFont f, Texture2D objectTexture)
        {
            s.Draw(objectTexture, Position, Microsoft.Xna.Framework.Color.White * ImageAlpha);
        }

        public virtual void EvtCreate()
        {

        }

        public virtual void EvtLoad()
        {

        }

        public virtual void EvtSave()
        {

        }

        public virtual void EvtDelete()
        {

        }

        public virtual void EvtContextMenuSelected(ToolStripItem e)
        {

        }

        // Public state events  
        public void UpdateState()
        {
            UpdateImageScale();
            UpdateImageAngle();
        }


        // Events
        public virtual void OnCreate()
        {

        }

        public virtual void OnStep()
        {

        }

        public virtual void OnDraw(SpriteBatch sb)
        {
           
        }

        #region IDisposable Support
        private bool disposedValue = false; // To detect redundant calls

        protected virtual void Dispose(bool disposing)
        {
            if (!disposedValue)
            {
                if (disposing)
                {
                    // TODO: dispose managed state (managed objects).
                }

                // TODO: free unmanaged resources (unmanaged objects) and override a finalizer below.
                // TODO: set large fields to null.

                disposedValue = true;
            }
        }

        // TODO: override a finalizer only if Dispose(bool disposing) above has code to free unmanaged resources.
        // ~GameObject() {
        //   // Do not change this code. Put cleanup code in Dispose(bool disposing) above.
        //   Dispose(false);
        // }

        // This code added to correctly implement the disposable pattern.
        public void Dispose()
        {
            // Do not change this code. Put cleanup code in Dispose(bool disposing) above.
            Dispose(true);
            // TODO: uncomment the following line if the finalizer is overridden above.
            // GC.SuppressFinalize(this);
        }
        #endregion
    }
}
