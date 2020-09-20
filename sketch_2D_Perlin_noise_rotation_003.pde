// https://www.openprocessing.org/sketch/544740
// 2D Perlin noise - rotation by nsiddh3 
// fork by Rupert Russell 21 September 2020

float xstart, xnoise, ynoise;
int scale = 25;
int margin = 100;

void setup() {
  noLoop();
  strokeWeight(3);
  // size(4535, 5480); Wood
  size(1000, 1000);
  smooth();
  background(255);
  xstart = random(10);
  xnoise = xstart;
  ynoise = random(10);
  for (int y=margin; y<=height - margin; y+=scale) {
    ynoise+=0.1;
    xnoise = xstart;
    for (int x=margin; x<=width - margin - scale; x+=scale) {  
      xnoise+=0.1;
      drawPoint(x, y, noise(xnoise, ynoise));
    }
  }
 // save("noise-10000.png");
 // println("saved noise-10000.png");
 // exit();
}
void drawPoint(float x, float y, float noiseFactor) {
  pushMatrix();
  translate(x, y);
  rotate(noiseFactor * radians(360));
  stroke(0);
  strokeWeight(noiseFactor * 5);
  line(0, 0, scale * 1.3 *  noiseFactor, 0);
  popMatrix();
}
