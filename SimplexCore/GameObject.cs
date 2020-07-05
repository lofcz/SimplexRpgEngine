using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Net;
using System.Reflection;
using System.Runtime.Serialization.Formatters.Binary;
using System.Text;
using System.Windows.Forms;
using System.Xml.Serialization;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Audio;
using Microsoft.Xna.Framework.Graphics;
using MonoGame.Extended;
using SharpDX.Direct2D1;
using SimplexResources.Objects;
using SimplexIde;
using Color = System.Drawing.Color;
using static SimplexCore.Sgml;
using SpriteBatch = Microsoft.Xna.Framework.Graphics.SpriteBatch;

namespace SimplexCore
{

    [Serializable]
    public class GameObject : IDisposable
    {
        public void Reset()
        {
            _position = __DefaultPosition;
            Position = __DefaultPosition;
            PositionPrevious = __DefaultPosition;
            Speed = 0;
            Direction = 0;
            Colliders.Clear();
        }

        public struct AlarmStruct
        {
            public int Steps;
            public bool Running;
        }
       
        public AlarmStruct[] Alarms = new AlarmStruct[16];
        
        [XmlIgnore]
        public Sprite Sprite;

        private Vector2 _position;

        public float X
        {
            get => _position.X;
            set
            {
                _position.X = value;
 
                if (ImageAngle == 0)
                {
                    UpdateRectangle();
                }
                else
                {
                    UpdateRotatedRectangle();
                }

                PositionPrevious = Position;
            }
        }

        public float Y
        {
            get => _position.Y;
            set
            {
                _position.Y = value;

                if (ImageAngle == 0)
                {
                    UpdateRectangle();
                }
                else
                {
                    UpdateRotatedRectangle();
                }

                PositionPrevious = Position;
            }
        }

        public void __Store()
        {
            __DefaultImageAngle = ImageAngle;
            __DefaultImageScale = ImageScale;
            __DefaultPosition = Position;
            __DefaultDirection = Direction;
        }

        public Vector2 Position
        {
            get => _position;
            set
            {
                _position = value;

                if (ImageAngle == 0)
                {
                    UpdateRectangle();
                }
                else
                {
                    UpdateRotatedRectangle();
                }

                PositionPrevious = Position;
            }
        }

        [XmlIgnore]
        public Type OriginalType;

        [XmlIgnore]
        public string[] EditorOptions = {"Send backward", "Send forward", "Delete"};

        [XmlIgnore]
        public Rectangle CollisionContainer = Rectangle.Empty;

        [XmlIgnore]
        public Control[] EditorProperties;
        /*
         * magic constants:
         * [magic_separator]
         */

        public string TypeString;


        public float ImageIndex
        {
            get => _imageIndex;
            set
            {
                _imageIndex = value;

                if (_imageIndex > FramesCount)
                {
                    _imageIndex = 0;
                }

                _imageIndex = _imageIndex.Clamp(0, FramesCount);
            }
        }

        public float ImageAngle;
        public float ImageAngleTarget;
        public float TransformSpeed;
        public Vector2 ImageScale;
        public Vector2 ImageScaleTarget;
        public float ImageAlpha;
        public string LayerName;
        public float ImageSpeed;
        public float Direction;
        public Vector2 PositionStart;
        public Vector2 PositionPrevious;
        public float Speed;
        public float Friction;
        public Vector2 Gravity;
        public Vector2 Velocity;
        public float Mass;
        public bool Persistent;
        public string PersistentLayer;
        public Vector2 ImageOrigin;

        public Vector2 __DefaultPosition;
        public float __DefaultImageAngle;
        public float __DefaultDirection;
        public Vector2 __DefaultImageScale;

        [XmlIgnore]
        public RotatedRectangle rr = null;

        [XmlIgnore]
        private List<ColliderBase> _colliders = null;

        [XmlIgnore]
        public List<ColliderBase> Colliders
        {
            get
            {
                return _colliders ?? (_colliders = new List<ColliderBase>());
            }
        }

        [XmlIgnore]
        public ObjectLayer Layer;

        [XmlIgnore]
        public string EditorPath;

        [XmlIgnore]
        public int FramesCount;

        [XmlIgnore]
        public Guid Id;

        [XmlIgnore]
        private List<ColliderDescriptor> _descriptors;

        [XmlIgnore]
        public List<ColliderDescriptor> CollidersActive
        {
            get
            {
                return _descriptors ?? (_descriptors = new List<ColliderDescriptor>());
            }
        }

        private float _imageIndex;

        [XmlIgnore]
        public Vector2 TempPosition = Vector2.Zero;

        public void UpdateRectangle()
        {
            CollisionContainer.X = (int)(_position.X - (ImageOrigin.X * ImageScale.X));
            CollisionContainer.Y = (int)(_position.Y - (ImageOrigin.Y * ImageScale.Y));
            CollisionContainer.Width = (int) (Sprite.ImageRectangle.Width * ImageScale.X);
            CollisionContainer.Height = (int)(Sprite.ImageRectangle.Height * ImageScale.Y);

        }

        public bool CollidingWithPoint(Vector2 point)
        {        
            if (ImageAngle == 0)
            {
                return CollisionContainer.Contains(point);
            }

            return rr.Contains(point);
        }

        void UpdateRotatedRectangle()
        {
            if (rr == null)
            {
                rr = new RotatedRectangle(Vector2.One, Vector2.One, Vector2.One, Vector2.One);
            }

            float xdif = Position.X - PositionPrevious.X;
            float ydif = Position.Y - PositionPrevious.Y;

            rr.Point1 = new Vector2(rr.Point1.X + xdif, rr.Point1.Y + ydif);
            rr.Point2 = new Vector2(rr.Point2.X + xdif, rr.Point2.Y + ydif);
            rr.Point3 = new Vector2(rr.Point3.X + xdif, rr.Point3.Y + ydif);
            rr.Point4 = new Vector2(rr.Point4.X + xdif, rr.Point4.Y + ydif);
        }

        public GameObject()
        {
            ImageScale = Vector2.One;
            ImageScaleTarget = Vector2.One;
            ImageAngle = 0;
            ImageAngleTarget = 0;
            ImageIndex = 0;
            TransformSpeed = 0.2f;
            Sprite = new Sprite();
            Sprite.TextureSource = "unknown";
            ImageAlpha = 1;
            ImageSpeed = 1;
            Gravity = new Vector2(0, 270);
            Speed = 0;
            Velocity = Vector2.Zero;
            Friction = 0;
            Direction = 0;
            Id = Guid.NewGuid();

            if (ImageAngle == 0)
            {
                UpdateRectangle();
            }
            else
            {
                UpdateRotatedRectangle();
            }
        }



        public void UpdateImageAngle()
        {
            ImageAngle = SimplexMath.Lerp(ImageAngle, ImageAngleTarget, TransformSpeed);
        }

        public void UpdateImageScale()
        {
            
            ImageScale = new Vector2(SimplexMath.Lerp(ImageScale.X, ImageScaleTarget.X, TransformSpeed), SimplexMath.Lerp(ImageScale.Y, ImageScaleTarget.Y, TransformSpeed));
        }

        public void UpdateColliders()
        {
            foreach (ColliderBase c in Colliders)
            {
                if (c is ColliderRectangle)
                {
                    ColliderRectangle cr = c as ColliderRectangle;

                    if (c.AttachToRoot && cr.Root != null)
                    {
                        cr.Collision.X = c.Root.X;
                        cr.Collision.Y = c.Root.Y;
                    }

                    cr.CollisionTransformed = new RectangleF(Position.X + cr.Collision.X, Position.Y + cr.Collision.Y, cr.Collision.Width, cr.Collision.Height);
                }

                if (c is ColliderCircle)
                {
                    ColliderCircle cr = c as ColliderCircle;

                    if (c.AttachToRoot && cr.Root != null)
                    {
                        cr.Position.X = c.Root.X;
                        cr.Position.Y = c.Root.Y;
                    }

                    cr.Position = new Vector2(Position.X, Position.Y);            
                }
            }
        }

        public void RegisterCollider(string c, Type cT, string n, Action<GameObject, GameObject> method)
        {
            CollisionPairExtended cp1 = new CollisionPairExtended();
            CollisionPair cp2 = new CollisionPair();

            cp1.ColliderName = c;
            cp1.Object = GetType();
            cp1.CollisionAction = method;

            cp2.ColliderName = n;
            cp2.Object = cT;

            
            CollisionsTree.DefinedCollisionPairs.Add(cp1, cp2);
        }

        public void DrawStart(SpriteBatch s, DynamicVertexBuffer vb, BasicEffect be, Matrix m, GameObject currentObject)
        {
            Sgml.sb = s;
            Sgml.vb = vb;
            Sgml.be = be;
            Sgml.m = m;
            Sgml.currentObject = currentObject;
        }

        // Editor events
        public virtual void EvtRegisterCollisions()
        {

        }

        public virtual void EvtDraw()
        {
            //s.Draw(objectTexture, Position, Microsoft.Xna.Framework.Color.White * ImageAlpha);
        }

        public virtual void EvtCreate()
        {

        }

        public virtual void EvtCreateEnd()
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

        public virtual void EvtStep()
        {

        }

        public virtual void EvtAlarm0()
        {

        }

        public virtual void EvtAlarm1()
        {

        }

        public virtual void EvtAlarm2()
        {

        }

        public virtual void EvtAlarm3()
        {

        }

        public virtual void EvtAlarm4()
        {

        }

        public virtual void EvtAlarm5()
        {

        }

        public virtual void EvtAlarm6()
        {

        }

        public virtual void EvtAlarm7()
        {

        }

        public virtual void EvtAlarm8()
        {

        }

        public virtual void EvtAlarm9()
        {

        }

        public virtual void EvtAlarm10()
        {

        }

        public virtual void EvtAlarm11()
        {

        }

        public virtual void EvtAlarm12()
        {

        }

        public virtual void EvtAlarm13()
        {

        }

        public virtual void EvtAlarm14()
        {

        }

        public virtual void EvtAlarm15()
        {

        }

        public virtual void EvtAlarm16()
        {

        }

        public virtual void EvtContextMenuSelected(ToolStripItem e)
        {

        }

        public virtual void EvtDrawToSurfaces()
        {

        }

        // Public state events  
        public void UpdateState()
        {
            // Update timelines
          /*  foreach (TimeLines line in all_time_lines)
            {
                line.Count++;
            }*/
            
            // Update alarms
            for (var i = 0; i < 16; i++)
            {
                if (Alarms[i].Running)
                {
                    Alarms[i].Steps--;

                    if (Alarms[i].Steps <= 0)
                    {
                        MethodInfo alarmMethod = OriginalType.GetMethod("EvtAlarm" + i);
                        alarmMethod.Invoke(this, null);
                        Alarms[i].Steps = -1;
                        Alarms[i].Running = false;
                    }
                }
            }

            UpdateImageScale();
            UpdateImageAngle();

            ImageIndex += (float)ImageSpeed;
            // Apply friction
            if (abs(Speed) > 0)
            {
                if (Speed > 0)
                {
                    Speed -= Friction;
                }
                else
                {
                    Speed += Friction;
                }

                if (abs(Speed) < Friction)
                {
                    Speed = 0;
                }
            }
            // Update velocity
            Velocity = new Vector2(Velocity.X + (float)lengthdir_x(-Gravity.X, Gravity.Y), Velocity.Y + (float)lengthdir_y(-Gravity.X, Gravity.Y));

            Position = new Vector2(Position.X + Velocity.X + (float)lengthdir_x(Speed, Direction), Position.Y + Velocity.Y + (float)lengthdir_y(Speed, Direction));
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
