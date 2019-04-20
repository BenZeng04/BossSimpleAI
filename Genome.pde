class Genome
{
  Node [] inputNodes = new Node [5];
  Node [] layer1 = new Node [8];
  Node [] outputNodes = new Node [4];
  
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

    for(int i = 0; i < outputNodes.length; i++){
      Node test = new Node();
      test.bias(random(10.0) - 5);
      for(int j = 0; j < layer1.length; j++){
        Connection dummy = new Connection();
        dummy.weight = random(10.0) - 5;
        dummy.fromNode = layer1[j];
        dummy.toNode = test;
        test.connections.add(dummy);
      }
      outputNodes[i] = test;
      
    }
    
  }
  
  void setGenes(float px, float py, float bx, float by, float cooldown){
    inputNodes[0].value = (px - 800) / 100;
    inputNodes[1].value = (py - 500) / 100;
    inputNodes[2].value = (bx - 800) / 100;
    inputNodes[3].value = (by - 500) / 100;
    inputNodes[4].value = (cooldown - 50) / 10;
    for(int i = 0; i < inputNodes.length; i++){
      inputNodes[i].value = inputNodes[i].sigmoid(inputNodes[i].value);
    }
    for(int i = 0; i < layer1.length; i++){
      layer1[i].initialize();
    }
    for(int i = 0; i < outputNodes.length; i++){
      outputNodes[i].initialize();
    }
  }
  
  void mutate()
  {
    for(int i = 0; i < layer1.length; i++){
      if(random(100) > 80){
      layer1[i].mutateBias();}
      for(int j= 0; j < layer1[i].connections.size(); j ++){
        if(random(100) > 80){
        layer1[i].connections.get(j).mutateWeight();
        }
      }
    }
    for(int i = 0; i < outputNodes.length; i++){
      if(random(100) > 80){
      outputNodes[i].mutateBias();}
      for(int j= 0; j < outputNodes[i].connections.size(); j ++){
        if(random(100) > 80){
        outputNodes[i].connections.get(j).mutateWeight();
        }
      }
    }
  }
  
  void mergeGene(Player p1, Player p2)
  {
    for(int i = 0; i < layer1.length; i++){
      if(random(2) > 1)
      {
        layer1[i].bias = p1.genes.layer1[i].bias;
      }
      else
      {layer1[i].bias = p2.genes.layer1[i].bias;}
   
      for(int j= 0; j < layer1[i].connections.size(); j ++){
        if(random(2) > 1){
          layer1[i].connections.set(j, p1.genes.layer1[i].connections.get(j)); 
        }
        else
        {layer1[i].connections.set(j, p2.genes.layer1[i].connections.get(j)); }
      }
    }
    for(int i = 0; i < outputNodes.length; i++){
      if(random(2) > 1)
      {
        outputNodes[i].bias = p1.genes.outputNodes[i].bias;
      }
      else
      {outputNodes[i].bias = p2.genes.outputNodes[i].bias;}
      for(int j= 0; j < outputNodes[i].connections.size(); j ++){
        if(random(2) > 1){
          outputNodes[i].connections.set(j, p1.genes.outputNodes[i].connections.get(j)); 
        }
        else
        {outputNodes[i].connections.set(j, p1.genes.outputNodes[i].connections.get(j)); }
      }
    }
    
    
  }
  
  
  
}
