void setup(){
  size(800, 500);
  player.genes.setup();
}
Player player = new Player();
void draw()
{
  background(0);
  player.action(player.computeGeneLikelyhood());
  player.drawPlayer();
}
