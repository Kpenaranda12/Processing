import ketai.camera.*;
import ketai.cv.facedetector.*;

KetaiCamera objeto; 
KetaiSimpleFace[] cara;  
boolean EncontrarCaras; 

void setup() {
  orientation(LANDSCAPE);// 
  objeto = new KetaiCamera(this, 1268, 768, 30); 
  rectMode(CENTER);                                      
  stroke(0, 0, 255);
  noFill();                                              
  textSize(48); 
  objeto.setCameraID(0);
}


void draw() {
  background(0); 
  if (objeto != null) {
    image(objeto, 0, 0);
    if (EncontrarCaras)
    {
      cara = KetaiFaceDetector.findFaces(objeto, 10);
      for (int i=0; i < cara.length; i++)
      {
        rect(cara[i].location.x, cara[i].location.y, 
        cara[i].distance*2, cara[i].distance*2);  
      }
      text("Caras encontradas: " + cara.length, width*.6, height/5); 
    }
  }
}
void mousePressed () {
  if(!objeto.isStarted())
    objeto.start();
  if (EncontrarCaras)
  EncontrarCaras = false;
  else
   EncontrarCaras = true;
}
void onCameraPreviewEvent() {
  objeto.read();
}
