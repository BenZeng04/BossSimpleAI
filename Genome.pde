class Genome
{
  Node [] inputNodes = new Node [9];
  Node [] layer1 = new Node [16];
  Node [] layer2 = new Node [16];
  Node [] outputNodes = new Node [8];
  
  void setupNodes(){
    for(int i = 0; i < inputNodes.length; i++){
      Node test = new Node();
      inputNodes[i] = test;
    }
    for(int i = 0; i < layer1.length; i++){
      Node test = new Node();
      test.bias(random(10.0) - 5);
      for(int j = 0; j < inputNodes.length; j++){
        Connection dummy = new Connection();
        dummy.weight = random(10.0) - 5;
        dummy.fromNode = inputNodes[j];
        dummy.toNode = test;
        test.connections.add(dummy);
      }
      layer1[i] = test;
    }
    
    for(int i = 0; i < layer2.length; i++){
      Node test = new Node();
      test.bias(random(10.0) - 5);
      for(int j = 0; j < layer1.length; j++){
        Connection dummy = new Connection();
        dummy.weight = random(10.0) - 5;
        dummy.fromNode = layer1[j];
        dummy.toNode = test;
        test.connections.add(dummy);
      }
      layer2[i] = test;
    }
    
    for(int i = 0; i < outputNodes.length; i++){
      Node test = new Node();
      test.bias(random(10.0) - 5);
      for(int j = 0; j < layer2.length; j++){
        Connection dummy = new Connection();
        dummy.weight = random(10.0) - 5;
        dummy.fromNode = layer2[j];
        dummy.toNode = test;
        test.connections.add(dummy);
      }
      outputNodes[i] = test;
      
    }
    
  }
  
  void setGenes(float px, float py, float box, float boy, float bux, float buy, float mx, float my, float cooldown){
    inputNodes[0].value = (px - 800) / 100;
    inputNodes[1].value = (py - 500) / 100;
    inputNodes[2].value = (box - 800) / 100;
    inputNodes[3].value = (boy - 500) / 100;
    inputNodes[4].value = (bux - 800) / 100;
    inputNodes[5].value = (buy - 500) / 100;
    inputNodes[6].value = (mx - 800) / 100;
    inputNodes[7].value = (my - 800) / 100;
    inputNodes[8].value = (cooldown - 50) / 10;
    for(int i = 0; i < inputNodes.length; i++){
      inputNodes[i].value = inputNodes[i].sigmoid(inputNodes[i].value);
    }
    for(int i = 0; i < layer1.length; i++){
      layer1[i].initialize();
    }
    for(int i = 0; i < layer2.length; i++){
      layer2[i].initialize();
    }
    for(int i = 0; i < outputNodes.length; i++){
      outputNodes[i].initialize();
    }
  }
  
  
  
}
