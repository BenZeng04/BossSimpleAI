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
}
