class Player {
int HP = 1000;
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
if(type == 5){
  if(weaponCooldown < 0){
  bullet.x = x;
  bullet.y = y;
  bullet.direction = 1;
  bullet.alive = true;
  weaponCooldown = 100;
  }
  
}
if(type == 6){
  if(weaponCooldown < 0){
  bullet.x = x;
  bullet.y = y;
  bullet.direction = 2;
  bullet.alive = true;
  weaponCooldown = 100;
  }
  
}
if(type == 7){
  if(weaponCooldown < 0){
  bullet.x = x;
  bullet.y = y;
  bullet.direction = 3;
  bullet.alive = true;
  weaponCooldown = 100;
  }
  
}
if(type == 8){
  if(weaponCooldown < 0){
  bullet.x = x;
  bullet.y = y;
  bullet.direction = 4;
  bullet.alive = true;
  weaponCooldown = 100;
  }
  
}
}

int computeGeneLikelyhood(){
   int choice = 0;
   float smallestDist = 1000000;
   float largestNode = -2;
   float bulletx = 0, bullety = 0;
   
   for(Bullet b : boss.shots){
     if(dist(x, y, b.x, b.y) < smallestDist)
     {
       smallestDist = dist(x, y, b.x, b.y);
       bulletx = b.x;
       bullety = b.y;
     }
   }
   
   genes.setGenes(x, y, boss.x, boss.y, bulletx, bullety, boss.minion.x, boss.minion.y, weaponCooldown);
   for(int i = 0; i < 8; i++){
     if(genes.outputNodes[i].value > largestNode){
       largestNode = genes.outputNodes[i].value;
       choice = i + 1;
     }
   }
   return choice;
}


void drawPlayer(){
  fill(255,0,0);
  ellipse(x, y, 50, 50); // Player
  fill(0,255,0);

  if(bullet.hitBoss(boss)){
    boss.HP -= 30;
  }
  fill(255);
  if(bullet.alive && !bullet.hitWall()){
  
    switch(bullet.direction)
    {
      case 1:
        bullet.x+=20;
        break;
      case 2:
        bullet.x-=20;
        break;
      case 3:
        bullet.y+=20;
        break;
      case 4:
        bullet.y-=20;
        break;
    }

  
    ellipse(bullet.x, bullet.y, 10, 10); //<>//
  }
  
}

void visualization(){
  println();
  println();
  println();
  for(int i = 0; i < 9; i++){
    print(genes.inputNodes[i].value+" ");
  }
  for(int i = 0; i < 16; i++){
    print(genes.layer1[i].value+" ");
  }
  for(int i = 0; i < 16; i++){
    print(genes.layer2[i].value+" ");
  }
  for(int i = 0; i < 8; i++){
    print(genes.outputNodes[i].value+" ");
  }
}

}
