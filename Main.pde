import java.util.*;
void setup(){
  size(1600, 1000);
  pop.init();
}
Population pop = new Population();

void draw()
{
  frameRate(10000);
  background(0);
  pop.commit();
  

}
void keyPressed()
{
  
}
