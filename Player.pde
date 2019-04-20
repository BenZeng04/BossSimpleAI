class Player {
int HP = 2;
float x = 1400;
float y = 800;
float fitness;
float weaponCooldown = -5;  
Genome genes = new Genome();
PlayerBullet bullet = new PlayerBullet();
Boss boss = new Boss();

void action(int type){
  weaponCooldown--;
    if(x > 1575)
  {
    x = 1575;
  }
  if(x < 25)
  {
    x = 25;
  }
  if(y < 25)
  {
    y = 25;
  }
  if(y > 975)
  {
    y = 975;
  }
if(type == 1){
  x += 10;
}
if(type == 2){
  x -= 10;
}
if(type == 3){
  y += 10;
}
if(type == 4){
  y -= 10;
}
  if(weaponCooldown < 0){
  bullet.x = x;
  bullet.y = y;
  bullet.alive = true;
  weaponCooldown = 50;
  }
  

}

int computeGeneLikelyhood(){
   int choice = 0;
   float largestNode = -2;
   
   genes.setGenes(x, y, boss.x, boss.y, weaponCooldown);
   for(int i = 0; i < 4; i++){
     if(genes.outputNodes[i].value > largestNode){
       largestNode = genes.outputNodes[i].value;
       choice = i + 1;
     }
   }
   return choice;
}


void drawPlayer(){
  HP = boss.attackPlayer(x, y, HP);
  textAlign(CENTER);
  fill(255,0,0,100);
  noStroke();
  ellipse(x, y, 50, 50); // Player
  fill(0,255,0,50);
  fill(255);
  textSize(18);
  text(HP, x, y);
  fill(255);
  text(boss.HP, boss.x, boss.y);
  stroke(255, 80);
  strokeWeight(2);
  line(x, y, boss.x, boss.y);
  
  noStroke();
  boss.drawBoss();
  
  if(bullet.alive && bullet.hitBoss(boss)){
    boss.HP -= 30;
    bullet.alive = false;
  }
  fill(255,100);
  if(bullet.alive && !bullet.hitWall()){
  
  if(dist(boss.x, boss.y, bullet.x, bullet.y) > 20){
    bullet.x += 20 * (boss.x - bullet.x) / dist(boss.x, boss.y, bullet.x, bullet.y);
    bullet.y += 20 * (boss.y - bullet.y) / dist(boss.x, boss.y, bullet.x, bullet.y);
    }

    fill(255);
    ellipse(bullet.x, bullet.y, 10, 10); //<>//
  }
  
}

void visualization(){
  println();
  println();
  println();
  for(int i = 0; i < 5; i++){
    print(genes.inputNodes[i].bias+" ");
  }
  for(int i = 0; i < 8; i++){
    print(genes.layer1[i].bias+" ");
  }
  for(int i = 0; i < 4; i++){
    print(genes.outputNodes[i].bias+" ");
  }
}

}
