import ddf.minim.*;
import ddf.minim.ugens.*;

Minim minim;
AudioOutput out;
PImage imgJPG;
void setup()
{
  minim = new Minim(this);

 
  // use the getLineOut method of the Minim object to get an AudioOutput object
  out = minim.getLineOut();
  imgJPG = loadImage("image.png");
  
  setNewSize(imgJPG.width, imgJPG.height);
  imgJPG.loadPixels();

  out.setTempo(180);

  out.pauseNotes();

  for (int i = 0; i < imgJPG.pixels.length; i++) {
    float sound = red(imgJPG.pixels[i]) + blue(imgJPG.pixels[i]) + green(imgJPG.pixels[i]);
    out.playNote(i, 1, sound);
  }

  updatePixels();

  out.resumeNotes();
}

void draw()
{
  background(0);
  stroke(255);
  image(imgJPG, 0, 0);
}

void setNewSize(int w, int h)
{
  surface.setSize(w,h);
  size(w,h);
}