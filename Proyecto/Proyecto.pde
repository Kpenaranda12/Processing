//Processing es un lenguaje de programación y entorno de desarrollo integrado de código abierto basado en Java, 
//de fácil utilización, y que sirve como medio para la enseñanza y producción de proyectos multimedia e interactivos de diseño digital. 

//La biblioteca de Ketai nos ayuda a desarrollar aplicaciones para trabajar con sensores, 
//cámaras, multitáctiles, redes, Bluetooth, Wi-Fi Direct, Near Field Communication y SQLite.
import ketai.camera.*;
import ketai.cv.facedetector.*;

KetaiCamera cam; //Permite acceder a la camaras android a traves de un objeto
KetaiSimpleFace[] cara; // Un array para poder almacenar la lista de caras encontradas
boolean EncontrarCaras = false; // bool que es verdadero o falso 

// se ejecuta una vez cuando se inicia el programa o aplicacion se utiliza para definir las propiedades
void setup() {
  orientation(LANDSCAPE);// 
  cam = new KetaiCamera(this, 1280, 768, 30); // se llama a KetaiCamera con los pixeles 
  rectMode(CENTER);  //se crea un rectangulo y se lo centra                                       
  stroke(0, 0, 255);// Establece el color utilizado para dibujar bordes RGB
  noFill();  // desactiva el relleno del rectangulo y no se dibuja en la pantalla                                              
  textSize(48); // El tamano de letra 
}

// ejecuta las lineas de codigo contenidas dentro de su bloque 
void draw() {
  background(0); // el color establecido para la ventana de fondo rgb
  if (cam != null) {
    image(cam, 0, 0); // camara y valores x and y
    if (EncontrarCaras)// si la camara encuentra hace lo siguiente
    {
      cara = KetaiFaceDetector.findFaces(cam, 10);// que encuentre un numero maximo de caras
      for (int i=0; i < cara.length; i++)//Analiza el resultado y devuelve el array segun el numero de caras
      {
        rect(cara[i].location.x, cara[i].location.y, // Dibuja el rectagulo en la ubicacion de la cara x and Y
        cara[i].distance*2, cara[i].distance*2); // es recomendable usar el 2 para la distencia entre los ojos para detectar 
      }
      text("Caras encontradas: " + cara.length, width*.6, height/2); //Muestra el numero total de caras encontradas
    }
  }
}

// se invoca una vez que se presione la pantalla
void mousePressed () {
  if(!cam.isStarted())
    cam.start();// en el momento que empiza la camara muestre si se encontro o no caras
  if (EncontrarCaras)
  EncontrarCaras = false;
  else
   EncontrarCaras = true;
}

// Este evento ejecuta cuando hay un nuevo marco de camara disponible y
// usa el read para capturar. 
void onCameraPreviewEvent() {
  cam.read();
}
