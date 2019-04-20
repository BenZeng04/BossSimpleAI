class PlayerBullet
{
  float x = 0, y = 0;
  int direction = 0;
  boolean alive = false;
  boolean hitWall(){
    if(x > 1600 || x < 0 || y > 1000 || y < 0){
      return true;
    }
    return false;
  }
  boolean hitBoss(Boss b)
  {
    if(dist(x, y, b.x, b.y) < 70)
    {
      return true;
      
    }
    return false;
  }
  
}
