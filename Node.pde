class Node
{
  
  float value = 0;
  float bias = 0;

  ArrayList<Connection> connections = new ArrayList<Connection>();
  
  float sum = 0;
    
  void initialize(){
    sum = bias;
    for(Connection c : connections){
      sum += c.weight * c.fromNode.value;
    }
    value = sigmoid(sum);
  }
  
  float sigmoid(float x) 
  {
  float y = 1 / (1 + pow((float)Math.E, -4.9*x));
   return y;
  }
  
  void bias(float b){
  bias = b;
}
  void mutateBias() {
    float rand2 = random(1);
    if (rand2 < 0.1) {//10% of the time completely change the weight
      bias = random(5, -5);
    } else {//otherwise slightly change it
      bias += randomGaussian()/10;
      //keep weight between bounds
      if(bias > 1){
        bias = 1;
      }
      if(bias < -1){
        bias = -1;        
        
      }
    }
  }
}
