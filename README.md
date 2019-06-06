# Final-Project; Tic Tac Toe Game

The purpose of this game is to function like a simple game of Tic Tac Toe. The players will enter the game and use the mouse to
click on the desired box when it is their turn. If they get three in a row before the other player does, then they win. 

### Difficulties

One of the difficulties that I encountered was the display of the X's and O's. When the players click on the desired cell, 
the X or O would not appear. I was then able to fix it in the click method, but then ran into an issue with when they would appear, which was that too many would appear with one click.

### Most Interesting Piece of Code

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
  
  This piece of code resets the board once a player wins. It checks to see if either of them one, and then uses clean to reset the board.
