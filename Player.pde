class Player {
int HP = 1000;
int x = 1;
int y = 1;
float fitness;
float weaponCooldown = 100;  
Genome genes = new Genome();
PlayerBullet bullet = new PlayerBullet();
Boss boss = new Boss();

void action(int type){
  weaponCooldown--;
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
  }
  weaponCooldown = 100;
}
if(type == 6){
  if(weaponCooldown < 0){
  bullet.x = x;
  bullet.y = y;
  bullet.direction = 2;
  }
  weaponCooldown = 100;
}
if(type == 7){
  if(weaponCooldown < 0){
  bullet.x = x;
  bullet.y = y;
  bullet.direction = 3;
  }
  weaponCooldown = 100;
}
if(type == 8){
  if(weaponCooldown < 0){
  bullet.x = x;
  bullet.y = y;
  bullet.direction = 4;
  }
  weaponCooldown = 100;
}
}

int computeGeneLikelyhood(){
   int choice = 0;
   float smallestDist = 1000000;
   float largestNode = -2;
   int bulletx = 0, bullety = 0;
   
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
       choice = i + 1;
     }
   }
   return choice;
}

void drawPlayer(){
  ellipse(x, y, 50, 50);
  ellipse(bullet.x, bullet.y, 10, 10);
}

}
