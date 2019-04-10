class Bullet{
  float x = 0, y = 0, angle = 0;
  boolean alive = false;
  void hitWall(){
    if(x > 1600 || x < 0 || y > 1000 || y < 0){
      alive = false;
    }
    alive = true;
  }
  boolean hitPlayer(float px, float py)
  {
    if(dist(x, y, px, py) < 60)
    {
      alive = false;
      return true;
      
    }
    return false;
  }
  
}
