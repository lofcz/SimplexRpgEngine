// Each iteration, it calculates: new = old * old + c, where c is
// a constant and old starts at current pixel.
var cRe, cIm;                     // Real and imaginary part of the constant c,
                                  // Determinate shape of the Julia Set
var newRe, newIm, oldRe, oldIm;   // Real and imaginary parts of new and old
zoom = 1; moveX = 0; moveY = 0;   // You can change these to zoom and change position
var color;                        // The RGB color value for the pixel
maxIterations = 30;               // After how much iterations the function should stop

// Pick some values for the constant c, this determines the shape of the Julia Set
cRe = -0.7;
cIm = 0.27015;

w = room_width;
h = room_height;

// Loop through every pixel
for(xx=0; xx<w; xx+=1;)
for(yy=0; yy<h; yy+=1;)
{
 // Calculate the initial real and imaginary part of z, based
 // on the pixel location and zoom and position values.
 newRe = 1.5 * (xx - w / 2) / (0.5 * zoom * w) + moveX;
 newIm = (yy - h / 2) / (0.5 * zoom * h) + moveY;

 // Start the iteration process
 for(i=0; i<maxIterations; i+=1;)
 {
  // Remember value of previous iteration
  oldRe = newRe;
  oldIm = newIm;

  // The actual iteration, the real and imaginary part are calculated
  newRe = oldRe * oldRe - oldIm * oldIm + cRe;
  newIm = 2 * oldRe * oldIm + cIm;

  // If the point is outside the circle with radius 2: stop
  if((newRe * newRe + newIm * newIm) > 4) break;
 }

 // Use color model conversion to get rainbow palette,
 // make brightness black if maxIterations reached.
 color = make_color_hsv(i mod 256, 255, 255 * (i < maxIterations));

 // Draw the pixel
 draw_set_color(color);
 draw_rectangle(round(xx),round(yy),round(xx)+1,round(yy)+1,false);
}
