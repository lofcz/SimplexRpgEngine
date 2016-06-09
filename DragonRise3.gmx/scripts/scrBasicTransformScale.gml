/// scrBasicTransformScale(amt, xscale, yscale, startXScale, startYScale)

var xs, ys;
xs = 1;
ys = 1;

if (argument_count > 0) {basicTransformAmt    = argument[0];}
if (argument_count > 1) {basicTransformXScale = argument[1];}
if (argument_count > 2) {basicTransformYScale = argument[2];}
if (argument_count > 3) {xs                   = argument[3];}
if (argument_count > 4) {ys                   = argument[4]; scl(xs,ys);}

basicTransform = Transformations.scale;
