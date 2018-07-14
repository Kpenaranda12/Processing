import ketai.camera.*;
import ketai.cv.facedetector.*;

KetaiCamera cam; 
KetaiSimpleFace[] cara; 
boolean EncontrarCaras = false; 

void setup() {
  orientation(LANDSCAPE);// 
  cam = new KetaiCamera(this, 1280, 768, 30); 
  rectMode(CENTER);                                   
  stroke(0, 0, 255);
  noFill();                                                
  textSize(48);  
}
void draw() {
  background(0); 
  if (cam != null) {
    image(cam, 0, 0); 
    if (EncontrarCaras)
    {
      cara = KetaiFaceDetector.findFaces(cam, 10);
      for (int i=0; i < cara.length; i++)
      {
        rect(cara[i].location.x, cara[i].location.y cara[i].distance*2, cara[i].distance*2); 
      }
      text("Caras encontradas: " + cara.length, width*.6, height/2); 
    }
  }
}
void mousePressed () {
  if(!cam.isStarted())
    cam.start();
  if (EncontrarCaras)
  EncontrarCaras = false;
  else
   EncontrarCaras = true;
}

void onCameraPreviewEvent() {
  cam.read();
}
