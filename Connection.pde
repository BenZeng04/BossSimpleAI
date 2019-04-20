class Connection
{
  Node fromNode, toNode;
  float weight;
  void mutateWeight() {
    float rand2 = random(1);
    if (rand2 < 0.1) {//10% of the time completely change the weight
      weight = random(-5, 5);
    } else {//otherwise slightly change it
      weight += randomGaussian()/10;
      //keep weight between bounds
      if(weight > 1){
        weight = 1;
      }
      if(weight < -1){
        weight = -1;        
        
      }
    }
  }
}
