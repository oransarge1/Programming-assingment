import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;



Minim minim;
AudioPlayer player;
AudioInput ai;
AudioBuffer ab;
FFT fft;

int savedTime;
int totalTime = 5000;

float colorInc;

float halfH;

float lerpedAverage = 0;

float[] lerpedBuffer = new float[1024];
float lerpedY=0;


void setup() {
savedTime = millis();
  size(1400,800);
  minim = new Minim(this);

  player = minim.loadFile("house-21049.mp3");
  player.play();
 
 
fullScreen();


  fft = new FFT(player.bufferSize(), player.sampleRate());

  frameRate(120);


  ab = player.mix;
  halfH = height/2;
   colorInc= 255/(float)ab.size();
   colorMode(HSB);

  for(int i=0;i< drops.length;i++) {
  drops[i]= new Drop();
  frameRate(40);
  smooth();
}

}


void draw() {





  background(0);

 for(int i=0;i< drops.length;i++) {
   drops[i].fall();
  drops[i].show();
   }


  fft.forward(player.mix);
 

  float sum = 0 ;
  for (int i = 0; i<ab.size(); i++) {
    sum +=abs(ab.get(i));
   lerpedBuffer[i] = lerp(lerpedBuffer[i], ab.get(i), 0.1f);
  }
  float average = sum / (float)ab.size();
  lerpedY = lerp(lerpedY, average, 0.1f);
  strokeWeight(4);
  stroke(255);
  fill(0);


  stroke(lerpedY*600, 255, 255);
//  circle(width/1.5, height/2, lerpedY*1150);
 circle(width/2, height/2, lerpedY*1300);
  stroke(lerpedY*580, 255, 255);
 circle(width/2, height/2, lerpedY*1200);
  stroke(lerpedY*560, 255, 255);
  circle(width/2, height/2, lerpedY*1100);
   stroke(lerpedY*540, 255, 255);
 circle(width/2, height/2, lerpedY*1000);
  stroke(lerpedY*500, 255, 255);
 circle(width/2, height/2, lerpedY*900);
  stroke(lerpedY*480, 255, 255);
 circle(width/2, height/2, lerpedY*800);
  stroke(lerpedY*460, 255, 255);
  circle(width/2, height/2, lerpedY*700);
   stroke(lerpedY*460, 255, 255);
 circle(width/2, height/2, lerpedY*600);
  stroke(lerpedY*480, 255, 255);
  circle(width/2, height/2, lerpedY*500);
   stroke(lerpedY*500, 255, 255);
 circle(width/2, height/2, lerpedY*400);
  stroke(lerpedY*540, 255, 255);
  circle(width/2, height/2, lerpedY*300);
   stroke(lerpedY*580, 255, 255);
 circle(width/2, height/2, lerpedY*200);
  stroke(lerpedY*600, 255, 255);
 circle(width/2, height/2, lerpedY*100);
 

 
 
 
 
 
 
 
  noStroke();





//noFill();




}

class Drop {
  float x=random(width);
  float y=random(-250,-20);
  float yspeed= random(1,3);
  float light;
  void fall() {
   y=y+ yspeed;

   if(y>height){
     y= random(-250,0);
  }
  }
  void show() {

stroke(lerpedY*700, 255, 255);
rectMode(CENTER);
//rect(x,y,lerpedY*500,lerpedY*500);





  int passedTime = millis() - savedTime;
  println(passedTime);
 
  //if ((passedTime<=35000)&&(passedTime>=18000)) triangle(x+10*lerpedY*30,y,x-10*lerpedY*30,y,x,y+15*lerpedY*30);}





stroke(lerpedY*650, 255, 255);
    if ((passedTime<=115000)&&(passedTime>=71500)) {
    circle(x,y,lerpedY*400);}
    stroke(lerpedY*750, 255, 255);
     if ((passedTime<=115000)&&(passedTime>=71500)) {
       rect(x,y,lerpedY*300,lerpedY*300);}
       







stroke(lerpedY*650, 255, 255);
    if ((passedTime<=72000)&&(passedTime>=51000)) {
    circle(x,y,lerpedY*300);}
    stroke(lerpedY*750, 255, 255);
     if ((passedTime<=72000)&&(passedTime>=51000)) {
       triangle(x+10*lerpedY*20,y,x-10*lerpedY*20,y,x,y+15*lerpedY*20);}
       
       
    stroke(lerpedY*400, 255, 255);
    //noFill();
if ((passedTime<=51000)&&(passedTime>=35000)) {  
triangle(x+10*lerpedY*20,y,x-10*lerpedY*20,y,x,y+15*lerpedY*20);}

   stroke(lerpedY*500, 255, 255);
if ((passedTime<=51000)&&(passedTime>=35000)) {  
triangle(x+10*lerpedY*5,y,x-10*lerpedY*7.5,y,x,y+15*lerpedY*5);}

 stroke(lerpedY*600, 255, 255);
if ((passedTime<=51000)&&(passedTime>=35000)) {  
triangle(x+10*lerpedY*10,y,x-10*lerpedY*7.5,y,x,y+15*lerpedY*10);}





stroke(lerpedY*400, 255, 255);
if (passedTime<=18000){
rect(x,y,lerpedY*500,lerpedY*500);}


stroke(lerpedY*600, 255, 255);
if (passedTime<=18000){
circle(x,y,lerpedY*500);}


stroke(lerpedY*400, 255, 255);
if ((passedTime<=35000)&&(passedTime>=18000)) {
  rect(x,y,lerpedY*100,lerpedY*500);
 
  stroke(lerpedY*700, 255, 255);
if ((passedTime<=35000)&&(passedTime>=18000)) {
  rect(x,y,lerpedY*500,lerpedY*100);
 


}


}
  }
}




Drop[] drops = new Drop[250];
