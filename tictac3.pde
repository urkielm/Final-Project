Cell [][] board;

int cols=3;
int rows=3;
int player=0;
int win=0;
int game=0;
int full=9;

void setup(){
  size(400, 400);
  smooth();
  board=new Cell[cols][rows];
  for(int i=0;i<cols;i++){
   for(int j=0; j<rows;j++){
    board[i][j]= new Cell(width/3 *i, height/3*j, width/3, height/3); 
   }
  }
  
}
void draw(){
  background(255);
  
  if(game==0){
   fill(0);
   textSize(20);
   text("Press Enter to Start", width/2-width/4, height/2);
   
  

  }
  if(game==1)
  {
    checkGame();
    for(int i=0; i<cols;i++)
    {
      for(int j=0; j<rows;j++){
       board[i][j].display(); 
      }
    }
  }
    
}
void mousePressed(){
  
  if(game==1){
    if(win==0){
    
   
    for(int i=0; i<cols;i++){
      for(int j=0;j<rows; j++){
        
        board[i][j].click(mouseX, mouseY);
        
        

   }
        

      
    }
   }
   
  }
}

void keyPressed(){
  if(game==0){
   if(key==ENTER)
   {
    game=1;
    full=9;
   }
  }
  else if(game==1 && win==0 && full==0){
   if(key==ENTER){
    game=0;
    for(int i=0; i<cols;i++){
     for( int j=0; j<rows;j++){
      board[i][j].clean();
      win=0;
      full=9;
     }
    }
   }
  }
  else if(game==1 &&(win==1||win==2)){
   if(key==ENTER){
    game=0;
    for(int i=0;i<cols;i++){
     for(int j=0; j<rows;j++){
      board[i][j].clean();
      win=0;
      full=9;
     }
    }
   
   }
  }
}
void checkGame(){
 int row=0; 
 for(int col=0; col<cols; col++){
   if(board[col][row].checkState()==1 && board[col][row+1].checkState()==1 && board[col][row+2].checkState()==1){
     win=1;
   }
   else if(board[row][col].checkState()==1 && board[row+1][col].checkState()==1 && board[row+2][col].checkState()==1){
     win=1;
   }
   else if(board[col][row].checkState()==2 && board[col][row+1].checkState()==2 && board[col][row+2].checkState()==2){
     win=2;
   }
   else if(board[row][col].checkState()==2 && board[row+1][col].checkState()==2 && board[row+2][col].checkState()==2){
     win=2;
   }
   if(board[row][row].checkState()==1 && board[row+1][row+1].checkState()==1 && board[row+2][row+2].checkState()==1){
       win=1;

 }
else if(board[row][row].checkState()==2 && board[row+1][row+1].checkState()==2 && board[row+2][row+2].checkState()==1){
     win=2;
 
}
else if(board[0][row+2].checkState()==1 && board[1][row+1].checkState()==1 && board[0][row+2].checkState()==1){
  win=1;
  
}
else if(board[0][row+2].checkState()==2 && board[1][row+1].checkState()==2 && board[0][row+2].checkState()==2){
  win=2;
}
fill(255);
textSize(20);
if(win==1){
  fill(0);
  text("Player 1 \n Won", board[1][1].checkX()*40,board[1][1].checkY()*50);
}
if(win==2){
  fill(0);
  text("Player 2 \n Won", board[1][1].checkX()*40,board[1][1].checkY()*50);
}
if(win==1||win==2){
  fill(0);
  textSize(35);
  text("Press Enter to Start Again", width/2-width/2+23, height/2-height/6-20);
}
if(win==0 && full==0){
  fill(0);
  textSize(35);
  text("Press Enter to Start", width/2-width/2+23, height/2-height/6-20);
  
}
 }
}
 class Cell{
  int x;
  int y;
  int w;
  int h;
  int state;
Cell(){
  
}
 Cell( int tx , int ty, int tw, int th){
   x=tx;
   y=ty;
   w=tw;
   h=th;
   
}
void click(int tx, int ty){
  int mx= tx;
  int my=ty;
   
  
  if(mx>x && mx<x+w && my<y+h){
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
   else{
     
   }
   
   
   
 }
 
 
 
 }
