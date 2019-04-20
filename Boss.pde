class Boss
{
  float x = 200, y = 200;
  int HP = 2;
  float atkCooldown = 50;

  
  
  void drawBoss(){
    fill(0,0,255,100);
    ellipse(x, y, 100, 100);
  }
  
  int attackPlayer(float px, float py, int hp){
    atkCooldown --;
    if(dist(x, y, px, py) > 20){
    x += 6 * (px - x) / dist(x, y, px, py);
    y += 6 * (py - y) / dist(x, y, px, py);
    }
    if(dist(x, y, px, py) < 75 && atkCooldown < 0){
      hp -= 40;
      atkCooldown = 50;
    }
    return hp;
  }
}
