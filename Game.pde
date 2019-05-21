Grid grid;
void setup(){
  size(900,900);
  grid= new Grid();
} 
void draw(){
  background(0);
  grid.display();
  showCursor();
}
  void showCursor(){
  println(" "+mouseX+" "+mouseY);
  
}
