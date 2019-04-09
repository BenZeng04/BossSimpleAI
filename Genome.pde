class Genome
{
  Node [] inputNodes = new Node [9];
  Node [] layer1 = new Node [16];
  Node [] layer2 = new Node [16];
  Node [] outputNodes = new Node [8];
  
  void setupNodes(){
    
    for(int i = 0; i < layer1.length; i++){
      layer1[i].bias = random(1.0, -1.0);
      for(int j = 0; j < inputNodes.length; j++){
        Connection dummy = new Connection();
        dummy.weight = random(1.0, -1.0);
        dummy.fromNode = inputNodes[j];
        dummy.toNode = layer1[i];
        layer1[i].connections.add(dummy);
      }
    }
    
    for(int i = 0; i < layer2.length; i++){
      layer1[i].bias = random(1.0, -1.0);
      for(int j = 0; j < layer1.length; j++){
        Connection dummy = new Connection();
        dummy.weight = random(1.0, -1.0);
        dummy.fromNode = layer1[j];
        dummy.toNode = layer2[i];
        layer2[i].connections.add(dummy);
      }
    }
    
    for(int i = 0; i < layer2.length; i++){
      layer1[i].bias = random(1.0, -1.0);
      for(int j = 0; j < layer1.length; j++){
        Connection dummy = new Connection();aa
        dummy.weight = random(1.0, -1.0);
        dummy.fromNode = layer1[j];
        dummy.toNode = layer2[i];
        layer2[i].connections.add(dummy);
      }
    }
    
  }
  
  void setGenes(int px, int py, int box, int boy, int bux, int buy, int mx, int my, float cooldown){
    inputNodes[0].value = px;
    inputNodes[1].value = py;
    inputNodes[2].value = box;
    inputNodes[3].value = boy;
    inputNodes[4].value = bux;
    inputNodes[5].value = buy;
    inputNodes[6].value = mx;
    inputNodes[7].value = my;
    inputNodes[8].value = cooldown;
    for(int i = 0; i < inputNodes.length; i++){
      inputNodes[i].value = inputNodes[i].sigmoid(inputNodes[i].value);
    }
  }
  
  
  
}
