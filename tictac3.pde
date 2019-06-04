Cell [][] board;
int cols=3;
int rows=3;
int player=0;
int win=0;
int game=0;
int full=9;

void setup(){
  
}
void draw(){
  
}
 class Cell{
  private int x;
  private int y;
  private int w;
  private int h;
  private int state;

 Cell( int x , int y, int w, int h, int state){
   this.x=x;
   this.y=y;
   this.w=w;
   this.h=h;
   this.state=state;
}
void click(int x, int y){
  int tx=x;
  int ty=y;
  if(tx>x && tx<x+w && ty<y+h){
    if(player==0 && state==0){
      state=1;
      full=-1;
      player=1;
    }
    else if(player==1 && state==0){
      state=2;
      full= -1;
      player= 0;
    }
  }
  
}
void clean(){
  state=0;
 }
 int checkState(){
   return state;
 }
 int checkX(){
   return x;
 }
 int checkY(){
   return y;
 }
 void display(){
   noFill();
   stroke(0);
   strokeWeight(3);
   rect(x,y,h,w);
   if(state==1){
    ellipseMode(CORNER);
    stroke(0);
    ellipse(x,y,w,h);
   }
   else if(state==2){
    stroke(0);
    line(x,y, x+w, y+h);
    line(x+w, y, x, y+h);
   }
   
   
   
 }
 
 
 
 }
