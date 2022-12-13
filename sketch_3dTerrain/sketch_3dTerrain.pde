import peasy.*;

float w = 30;

float cols;
float rows;

float xoff;
float yoff;

float speed = 0;

PeasyCam cam;

boolean fly = false;

void setup() {
  size(600,600,P3D);
  
  cols = 600 / w;
  rows = 600 / w;
  
  cam = new PeasyCam(this, -500);
  
}

void draw() {

  background(135, 206, 250);
  translate(height/2, width/2, -800);
  rotateX(PI/3);
  //stroke(255,255,255);
  
  if(fly)
    speed -= 0.04;
  
  yoff = speed;


  yoff = speed;
  //beginShape();
  for(int y = 0; y < rows; y++){
    xoff = 0;
    translate(-w*rows,w,0);
    for(int x = 0; x < cols; x++){
        float r = map(noise(xoff, yoff),0,1,0,20);
        
      //if(r < 8){
      //  fill(0,0,120);
      //}else{
      //  fill(0,120,0);
      //}
      if(r < 6)
        r = 6;
      createTower((int)r);

      xoff += 0.01;

    }
        yoff += 0.01;

  }
  //endShape();

}

void createTower(int x){

  
  for(int i = 0; i < x; i++){
      if(i <= 3){
        fill(139, 139, 139); // stone
      }else if(i > 3 && i <= 5 ){
        fill(0, 0, 255); // water
      }else if(i == 6){
        fill(#f7e9aa); //sand
      }else if (i > 6 && i <= 8){
        fill(49,221,20); // grass low
      }else if (i > 8 && i <= 10){
        fill(14,164,0); // grass high
      }else if (i > 10 && i <= 12){
        fill(125,130,126); // mountain low
      }else{
        fill(254,255,254);// mountain high
      }
    translate(0,0,w);
    box(w,w,w);
    
  }
    translate(w,0,-x*w);

  //translate(w, 0, 0);

}

void keyPressed() {
  //speed -= 0.02;
  fly = !fly;
}
