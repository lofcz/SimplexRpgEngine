using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Diagnostics;
using System.Drawing;
using System.IO;
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
using ButtonState = Microsoft.Xna.Framework.Input.ButtonState;
using Color = Microsoft.Xna.Framework.Color;
using Rectangle = Microsoft.Xna.Framework.Rectangle;
using RectangleF = MonoGame.Extended.RectangleF;

namespace SimplexIde
{
    public class SpritesEditorRenderer : MonoGameControl
    {
        private SimplexCore.OrthographicCamera c;
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
        public DrawTest mainForm = null;
        private GameObject representativeGameObject = null;
        public Texture2D selectedImage = null;
        public Sprites_manager parentForm = null;
        int selectedXIndex = -1;
        private int selectedYIndex = -1;
        RenderTarget2D gridSurface = null;
        public int selectedImageIndex = 0;
        private RenderTarget2D imageOverlay = null;
        private MouseState ms;
        private Texture2D pixel = null;
        public Color penColor = Color.Black;
        public Color penColorRight = Color.Black;
        public AnimationFrame selectedFrame = null;
        public int selectedLayer = 0;
        public List<AnimationFrame> Frames = new List<AnimationFrame>();
        private RenderTarget2D previewGrid;
        private int animateIn = 0;

        public void AddEmptyFrame()
        {
            AnimationFrame af = new AnimationFrame();

            RenderTarget2D s = Sgml.surface_create(selectedImage.Width, selectedImage.Height);
            
            af.layers.Add(new AnimationLayer() {texture = s });
            selectedFrame = af;
            Frames.Add(af);

            Debug.WriteLine(Frames.Count);
        }

        public void AddFrameFromTexture(Texture2D texture)
        {
            AnimationFrame af = new AnimationFrame();
            af.texture = texture;

            RenderTarget2D surf = Sgml.surface_create(texture.Width, texture.Height);
            Sgml.surface_set_target(surf);
            Sgml.draw_sprite(texture, -2, Vector2.Zero);
            Sgml.surface_reset_target();

            af.layers.Add(new AnimationLayer() {texture = surf});
            selectedFrame = af;
            Frames.Add(af);
        }

        public void SelectFrame(int index)
        {
            if (Frames.Count > index)
            {
                selectedFrame = Frames[index];
                parentForm.darkGroupBox4.Text = "Animation (" + index + "/" + Frames.Count + ")";
            }
        }

        


        protected override void Initialize()
        {
            base.Initialize();
           // MouseHoverUpdatesOnly = true;

            representativeGameObject = new GameObject();
            representativeGameObject.Sprite.TextureCellsPerRow = 1;

            c = new SimplexCore.OrthographicCamera(Editor.graphics);
            cam.Camera = c;
            cam.Position = Vector2.Zero;
            cam.TransformSpeed = 0.1f;

            vertexBuffer = new DynamicVertexBuffer(GraphicsDevice, typeof(VertexPositionColor), 1000, BufferUsage.WriteOnly);
            basicEffect = new BasicEffect(GraphicsDevice);

            GraphicsDevice.PresentationParameters.RenderTargetUsage = RenderTargetUsage.PreserveContents;

            m = Matrix.CreateOrthographicOffCenter(0, GraphicsDevice.Viewport.Width, GraphicsDevice.Viewport.Height, 0, 0, -1);
            Sgml.GraphicsDevice = GraphicsDevice;

            pixel = new Texture2D(GraphicsDevice, 1, 1);
            pixel.SetData(new[] {Color.White});
          
            Rsize();
            UpdateGrid();

            previewGrid = Sgml.surface_create(80, 80);
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

            if (selectedFrame != null)
            {
                int x1 = 0;
                int y1 = 0;

                if (ms.LeftButton == ButtonState.Pressed)
                {
                    Sgml.surface_set_target(selectedFrame.layers[0].texture);
                    Sgml.draw_set_aa(false);

                    Sgml.draw_set_color(penColor);
                    Sgml.draw_sprite(pixel, -2, new Vector2((float)Sgml.round(Sgml.mouse.X - .5f) - x1, (float)Sgml.round(Sgml.mouse.Y - .5f) - y1));
                    Sgml.surface_reset_target();
                    Sgml.draw_set_color(Color.White);

                    UpdatePreview(selectedImageIndex);
                }

                if (ms.RightButton == ButtonState.Pressed)
                {
                    Sgml.surface_set_target(selectedFrame.layers[0].texture);
                    Sgml.draw_set_aa(false);

                    Sgml.draw_set_color(penColorRight);
                    Sgml.draw_sprite(pixel, -2, new Vector2((float)Sgml.round(Sgml.mouse.X - .5f) - x1, (float)Sgml.round(Sgml.mouse.Y - .5f) - y1));
                    Sgml.surface_reset_target();
                    Sgml.draw_set_color(Color.White);

                    UpdatePreview(selectedImageIndex);
                }
            }


            // Update frame if user pushed autoplay btn 
            if (parentForm.darkButton33.Pushed)
            {
                animateIn--;

                if (animateIn <= 0)
                {
                    animateIn = (int)parentForm.darkNumericUpDown5.Value;

                    selectedImageIndex++;

                    if (selectedImageIndex >= Frames.Count)
                    {
                        selectedImageIndex = 0;
                    }

                    selectedFrame = Frames[selectedImageIndex];
                    parentForm.darkImageIndex1.SelectedFrame = selectedImageIndex;
                    parentForm.darkImageIndex1.Invalidate();
                }
            }
        }

        public void UpdatePreview(int index)
        {
            RenderTarget2D finalSurface = Sgml.surface_create(selectedFrame.layers[0].texture.Width, selectedFrame.layers[0].texture.Height);
            Sgml.surface_set_target(finalSurface);


            Sgml.draw_surface(Vector2.Zero, selectedFrame.layers[0].texture);
            Sgml.surface_reset_target();

            MemoryStream ms = Sgml.surface_save_ext_memory(finalSurface, 80, 80);

            Bitmap b = (Bitmap)Image.FromStream(ms);
            b.MakeTransparent(System.Drawing.Color.Black);

            if (parentForm.darkImageIndex1.Frames.Count > index)
            {
                parentForm.darkImageIndex1.Frames[index].bmp = b;
            }

            Debug.WriteLine(parentForm.darkImageIndex1.Frames.Count);
            parentForm.darkImageIndex1.Invalidate();
        }

        public void SaveChanges()
        {
            RenderTarget2D finalSurface = Sgml.surface_create(imageOverlay.Width, imageOverlay.Height);
            Sgml.surface_set_target(finalSurface);
            Sgml.draw_sprite(selectedImage, -2, Vector2.Zero);
         //   Sgml.draw_surface(Vector2.Zero, imageOverlay);
            Sgml.surface_reset_target();


            Sgml.surface_save(finalSurface, parentForm.owner.currentProject.RootPath + "/Content/Sprites/texture");
            finalSurface.Dispose();
        }

        protected override void Draw()
        {
            if (parentForm != null)
            {
                ms = Mouse.GetState();

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
                Sgml.currentObject = representativeGameObject;

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

                basicEffect.View = Matrix.Identity;
                Sgml.m = Matrix.Identity;

                Sgml.draw_surface(Vector2.Zero, gridSurface);


                Sgml.draw_set_color(Color.White);
                Sgml.draw_text(new Vector2(10, 10), framerate.ToString());
                Sgml.draw_text(new Vector2(10, 30), "[X: " + Sgml.round(Sgml.mouse.X) + " Y: " + Sgml.round(Sgml.mouse.Y) + "]");
                Sgml.draw_text(new Vector2(10, 50), parentForm.darkNumericUpDown1.Value.ToString());
                Sgml.draw_text(new Vector2(10, 70), cam.Zoom.ToString());
                basicEffect.View = view;
                Sgml.m = transformMatrix;

                if (selectedFrame != null)
                {
                    Sgml.draw_set_aa(!parentForm.drawModeOn);

                    if (selectedFrame.layers[0].texture != null)
                    {
                        Sgml.draw_surface(Vector2.Zero, selectedFrame.layers[selectedLayer].texture);
                    }

                    Sgml.draw_set_aa(true);

                    // draw cells
                    int xx = 0;
                    int yy = 0;
                    int xIndex = 0;
                    int yIndex = 0;
                    RectangleF temp = RectangleF.Empty;

                    int x1 = 0;
                    int y1 = 0;
                    int x2 = x1 + (int) parentForm.darkNumericUpDown1.Value;
                    int y2 = y1 + (int) parentForm.darkNumericUpDown2.Value;

                    Sgml.draw_set_alpha(0.8);
                    Sgml.draw_set_color(Color.Black);
                    for (var i = 0; i < parentForm.darkNumericUpDown2.Value + 1; i++)
                    {
                        Sgml.draw_line(x1, y1 + i, x2, y1 + i);
                    }

                    for (var i = 0; i < parentForm.darkNumericUpDown2.Value + 1; i++)
                    {
                        Sgml.draw_line(x1 + i, y1, x1 + i, y2);
                    }

                    Sgml.draw_set_alpha(1);
                    Sgml.draw_set_color(Color.White);

                    Sgml.draw_set_aa(false);
              

                    Sgml.draw_set_color(penColor);
                    Sgml.draw_rectangle(
                        new Vector2((float) Sgml.round(Sgml.mouse.X - .5f), (float) Sgml.round(Sgml.mouse.Y - .5f)),
                        new Vector2((float) Sgml.round(Sgml.mouse.X + .5f), (float) Sgml.round(Sgml.mouse.Y + .5f)),
                        false);

                    Sgml.draw_set_alpha(1);
                    Sgml.draw_set_color(Color.White);

                    if (selectedFrame.layers.Count > 0)
                    {
                        if (selectedFrame.layers[0].texture != null)
                        {
                            Sgml.draw_rectangle(Vector2.Zero, new Vector2(selectedFrame.layers[0].texture.Width, selectedFrame.layers[0].texture.Height), true);
                        }
                    }

                }
            }
        }

        void UpdateGrid()
        {
            int cellSize = 16;
            int x = 0;
            int y = 0;

            RectangleF rect = RectangleF.Empty;

            Color c1 = Color.FromNonPremultiplied(68, 68, 68, 255);
            Color c2 = Color.FromNonPremultiplied(77, 77, 77, 255);

            bool flag = true;
            bool lastFlag = flag;

            gridSurface = Sgml.surface_create(Width, Height);
            Sgml.surface_set_target(gridSurface);
            for (var i = 0; i < Height / cellSize + 1; i++)
            {
                for (var j = 0; j < Width / cellSize + 1; j++)
                {
                    if (j == 0)
                    {
                        lastFlag = flag;
                    }

                    rect.Size = new Size2(cellSize, cellSize);
                    rect.Position = new Point2(x, y);

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
            Sgml.surface_reset_target();
        }


        public void Rsize()
        {
            // Fix weird errors folks are getting with this method
            if (Editor != null)
            {
                Editor.graphics.Viewport = new Viewport(0, 0, this.Width, this.Height);
                m = Matrix.CreateOrthographicOffCenter(0, GraphicsDevice.Viewport.Width, GraphicsDevice.Viewport.Height,
                    0, 0, -1);
                UpdateGrid();
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

        public void AaToggled()
        {
            if (parentForm == null)
            {
                if (selectedXIndex != -1 && selectedYIndex != -1)
                {
                    selectedImageIndex = 1;
                    imageOverlay = Sgml.surface_create((int)parentForm.darkNumericUpDown1.Value, (int)parentForm.darkNumericUpDown2.Value);

                    Sgml.surface_set_target(imageOverlay);
                    Sgml.draw_clear_transparent();
                    Sgml.surface_reset_target();
                }
                return;
            }

            if (parentForm.drawModeOn)
            {
                if (selectedXIndex != -1 && selectedYIndex != -1)
                {
                    selectedImageIndex = 1;
                    imageOverlay = Sgml.surface_create((int)parentForm.darkNumericUpDown1.Value, (int)parentForm.darkNumericUpDown2.Value);
                   
                    Sgml.surface_set_target(imageOverlay);
                    Sgml.draw_clear_transparent();
                    Sgml.surface_reset_target();
                }
            }
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
