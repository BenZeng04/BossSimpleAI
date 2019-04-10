import java.util.*;
void setup(){
  size(1600, 1000);
  player.genes.setupNodes();
  
}

Player player = new Player();
void draw()
{
  background(0);
  player.action(player.computeGeneLikelyhood());
  player.drawPlayer();
  player.visualization();

}
