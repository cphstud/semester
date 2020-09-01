
//File dir = new File("/Users/thor/tmp/data/famous/keep");
File dir = new File(System.getProperty("user.home") + "/Documents/Processing/pixelateI/data");
//File dir = new File(dataPath("."));
File [] files = dir.listFiles();

PImage images[];
int numOfPics;
int w;
int h;
int i=20;
int factor=100;
float r = 255;
int mouseDelay = 0;
int counter;


void settings() {
  size(1000,800);

}

void setup() {
  println(System.getProperty("user.home"));
  frameRate(i);
  counter=files.length;
  imageMode(CORNERS);
  colorMode(HSB,360);
  images = new PImage[files.length];
  for(int i=0;i<files.length;i++) {  
    String name = files[i].getAbsolutePath();
    PImage t = loadImage(name);
    t.resize(600,0);
    images[i]=t;
  } 
  counter=images.length-1;
}

void mousePressed(){
   looping =! looping;
}

void keyPressed() {
  if (key == 'a') {
    counter--;
    factor=100;
    frameRate(30);
  } 
}


void draw() { 
  println("C " + factor);
  image(images[counter],0,0);
  factor--;
    if (factor < 30) {
    frameRate(8);
  } else if (factor < 10) {
    frameRate(2);
  } else if (factor < 5) {
    frameRate(1);
  } 
  if (factor > 1) {
  pixelateImage(images[counter], factor);
  }
}

void pixelateImage(PImage p, int pxSize) {
  float ratio;
  if (width < height) {
    ratio = height/width;
  }
  else {
    ratio = width/height;
  }
  
  int pxH = int(pxSize * ratio);
  noStroke();
  for (int x=0; x<width; x+=pxSize) {
    for (int y=0; y<height; y+=pxH) {
      fill(p.get(x, y));
      rect(x, y, pxSize, pxH);
    }
  }
}
