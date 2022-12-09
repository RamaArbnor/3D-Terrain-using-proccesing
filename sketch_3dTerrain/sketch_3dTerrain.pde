float x,y,z;
int cols, rows;
int scl = 10; 

int w = 1200;
int h = 900;


float[][] terrain;

float xoff;
float yoff;

float speed = 0;

void setup() {
  size(600,600,P3D);
  
  cols = w / scl;
  rows = h / scl;
  
  terrain = new float[cols][rows];  
    
    
  
}

void draw() {
   background(0);
   
   speed -= 0.1;
   
    yoff = speed;
    for(int y = 0; y < rows; y++) {
    xoff = 0;
      for(int x = 0; x < cols; x++) { 
       terrain[x][y] =  map(noise(xoff,yoff), 0, 1, -100, 150);
       xoff += 0.05;
       
     }
     yoff += 0.05;
   }
   
   
   
   translate(width/2, height/2);
   rotateX(PI/3);
   
  
   

   translate(-w/2, -h/2);
   for(int y = 0; y < rows -1 ; y++) {
     beginShape(TRIANGLE_STRIP);

     for(int x = 0; x < cols; x++) { 
       stroke(255);
       //noStroke();
       if(terrain[x][y] < 10){
         fill(0,0,120);
       }else if(terrain[x][y] > 80){
         fill(145, 97, 68);
       }
       else{
         fill(0,120,0);
       }

       vertex(x*scl, y*scl, terrain[x][y]);
       vertex(x*scl, (y+1)*scl, terrain[x][y+1]);
       //rect(x*scl, y*scl, scl, scl);

     }

     endShape();
   }
   

   
}
