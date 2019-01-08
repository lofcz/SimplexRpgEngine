using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Microsoft.VisualBasic.CompilerServices;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;
using Microsoft.Xna.Framework.Input;
using MonoGame.Extended;
using MonoGame.Forms.Controls;
using SimplexCore;

namespace SimplexIde
{
    public class SpritesEditorRenderer : MonoGameControl
    {
        private Camera2D c;
        SimplexCamera cam = new SimplexCamera();
        Matrix world = Matrix.Identity;
        private Color BackgroundColor;
        public Vector2 MousePosition;
        public static DynamicVertexBuffer vertexBuffer;
        public static BasicEffect basicEffect;
        private Matrix m;
        private bool mouseLocked = false;
        private bool panView = false;
        Vector2 MousePrevious = Vector2.One;
        Vector2 helpVec = Vector2.One;
        Vector2 MousePositionTranslated = Vector2.One;

        protected override void Initialize()
        {
            base.Initialize();
            c = new Camera2D(Editor.graphics);
            cam.Camera = c;
            cam.Position = Vector2.Zero;
            cam.TransformSpeed = 0.1f;

            vertexBuffer = new DynamicVertexBuffer(GraphicsDevice, typeof(VertexPositionColor), 1000, BufferUsage.WriteOnly);
            basicEffect = new BasicEffect(GraphicsDevice);

            m = Matrix.CreateOrthographicOffCenter(0, GraphicsDevice.Viewport.Width, GraphicsDevice.Viewport.Height, 0, 0, -1);
            Sgml.GraphicsDevice = GraphicsDevice;

            Rsize();
        }

        protected override void Update(GameTime gameTime)
        {
            base.Update(gameTime);
            cam.UpdatePosition();

            var originalPos = cam.Camera.Position;
            var originalZoom = cam.Camera.Zoom;

            Matrix view = cam.Camera.GetViewMatrix();

            cam.Camera.Position = new Vector2(0, 0);
            cam.Camera.Zoom = 1;

            Matrix normalizedMatrix = cam.Camera.GetViewMatrix();

            cam.Camera.Position = originalPos;
            cam.Camera.Zoom = originalZoom;

            Sgml.world = world;
            Sgml.view = view;
            Sgml.normalizedMatrix = normalizedMatrix;
        }

        protected override void Draw()
        {
            MouseState ms = Mouse.GetState();

            base.Draw();
            double framerate = Editor.GetFrameRate;
            Matrix transformMatrix = cam.Camera.GetViewMatrix();
            MousePositionTranslated = cam.Camera.ScreenToWorld(new Vector2(ms.X, ms.Y));

            BackgroundColor = Color.Black;
            Editor.graphics.Clear(BackgroundColor);
            Input.MousePosition = MousePositionTranslated;
            MousePosition = new Vector2(ms.X, ms.Y);

            Sgml.sb = Editor.spriteBatch;
            Sgml.vb = vertexBuffer;
            Sgml.be = basicEffect;
            Sgml.m = transformMatrix;

            Matrix view = cam.Camera.GetViewMatrix();
            Matrix projection = m;

            basicEffect.World = world;
            basicEffect.View = view;
            basicEffect.Projection = projection;
            basicEffect.VertexColorEnabled = true;

            Sgml.mouse = MousePositionTranslated;

            // Actual logic
            int cellSize = 16;
            int x = 0;
            int y = 0;

            RectangleF rect = RectangleF.Empty;

            Color c1 = Color.FromNonPremultiplied(68, 68, 68, 255);
            Color c2 = Color.FromNonPremultiplied(77, 77, 77, 255);

            bool flag = true;
            bool lastFlag = flag;

            for (var i = 0; i < Height / cellSize + 1; i++)
            {
                for (var j = 0; j < Width / cellSize + 1; j++)
                {
                    if (j == 0)
                    {
                        lastFlag = flag;
                    }

                    rect.Size = new Size2(cellSize, cellSize);
                    rect.Position = new Point2( x, y);

                    if (flag)
                    {
                        Sgml.draw_set_color(c1);
                    }
                    else
                    {
                        Sgml.draw_set_color(c2);
                    }

                    Sgml.draw_rectangle(rect, false);
                    x += cellSize;
                    flag = !flag;
                }

                x = 0;
                y += cellSize;
                lastFlag = !lastFlag;
                flag = lastFlag;
            }
            Sgml.draw_circle_fast(new Vector2(Sgml.mouse.X, Sgml.mouse.Y), 32, 24, Color.CornflowerBlue);

            Sgml.draw_set_color(Color.White);
            Sgml.draw_text(new Vector2(10, 10), framerate.ToString());
        }

        public void Rsize()
        {
            // Fix weird errors folks are getting with this method
            if (Editor != null)
            {
                Editor.graphics.Viewport = new Viewport(0, 0, this.Width, this.Height);
                m = Matrix.CreateOrthographicOffCenter(0, GraphicsDevice.Viewport.Width, GraphicsDevice.Viewport.Height,
                    0, 0, -1);
            }
        }

        public void WheelDown()
        {
            cam.TargetZoom -= 0.1f;
        }

        public void WheelUp()
        {
            cam.TargetZoom += 0.1f;
        }

        public void ClickLock(MouseButtons btn)
        {
            mouseLocked = true;
            MousePrevious = Sgml.mouse;

            if (btn == MouseButtons.Middle)
            {
                panView = true;
                helpVec = cam.Camera.ScreenToWorld(MousePosition);
            }
        }

        public void ClickUp()
        {
            panView = false;
        }

        public void MouseDrag(System.Drawing.Point pos)
        {

        }

        public void MoveView()
        {
            if (panView)
            {
                cam.TargetPosition = new Vector2(cam.Position.X + helpVec.X - MousePositionTranslated.X, cam.Position.Y + helpVec.Y - MousePositionTranslated.Y);
            }
        }

    }
}
