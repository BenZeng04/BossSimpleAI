class Population{
  Player [] pop = new Player[100];
  void init(){
    for(int i = 0; i < pop.length; i++){
    Player test = new Player();
    test.genes.setupNodes();
    pop[i] = test;
    }
  }
  
  boolean done = false;
  int gen = 1;
  
  void drawAll(){ // Method to draw everything
    done = true;
    for(int i = 0; i < pop.length; i++){
      if(pop[i].HP > 0 && pop[i].boss.HP > 0){
        pop[i].action(pop[i].computeGeneLikelyhood());
        pop[i].drawPlayer();
        if(i == 99){
          text("THIS IS THE ONE", pop[i].x, pop[i].y);
        }
        done = false;
      }
      else{
        pop[i].fitness = pop[i].HP - pop[i].boss.HP;
      }
    }  
    fill(255);
    text("GENERATION "+gen, 1000, 20);
    
  
  }

  void commit() // Doing all the AI buisness and evolution
  {
    if(!done)
    {
      drawAll();
    }
    else
    {
      gen++;
      done = false;
      sort(pop);
      pop[99].visualization();
      println(pop[99].fitness);
      pop = evolvePlayer(pop);
      
    }
  }
  
  void sort(Player arr[]) 
  { 
    int i, j; 
    Player test;
    for (i = 1; i < arr.length; i++) { 
        test = arr[i]; 
        j = i - 1; 
  
        while (j >= 0 && arr[j].fitness > test.fitness) { 
            arr[j + 1] = arr[j]; 
            j = j - 1; 
        } 
        arr[j + 1] = test; 
    } 
  } 
  
  Player [] evolvePlayer(Player p[])
  {
    boolean [] playerKill = new boolean [p.length];
    for(int i = 0; i < p.length; i++){
      if( random(1.00) >= 1/(1 + pow(2.71,0.1*(float(i)- 50) ) ) )
      {  
        playerKill[i] = true;
      }
      else
      {
        playerKill[i] = false;
      }
    }
    println();
    for(int i = 0; i < p.length; i++){
      Player p1 = selectPlayer(playerKill);
      Player p2 = selectPlayer(playerKill);
      p[i].x = 1400;
      p[i].y = 800;
      p[i].HP = 200;
      p[i].weaponCooldown = -5; 
      p[i].boss.x = 200;
      p[i].boss.y = 200;
      p[i].boss.HP = 600;
      p[i].boss.atkCooldown  = 50;
      
      if(playerKill[i])
      {
        print(i+" ");
        if(random(1.0) > 0.85){
        p[i].genes.mergeGene(p1, p2);
        }
        else{
          if(random(1.0) > 0.5){
            p[i].genes = p1.genes;
          }else
          {
            p[i].genes = p2.genes;
          }
        }
        p[i].genes.mutate();
      }
    }
    return p;
  }
  
    Player selectPlayer(boolean [] dead) {
    float fitnessSum = 0;
    for (int i =0; i < pop.length; i++) {
      fitnessSum += pop[i].fitness;
    }

    float rand = random(fitnessSum);
    float runningSum = 0;

    for (int i = 0; i<pop.length; i++) {
      runningSum += pop[i].fitness; 
      if (runningSum > rand && !dead[i]) {
        if(random(1.0) > 0.9){
        return pop[i];}else
        {
          Player p = new Player();
          p.genes.setupNodes();
          return p;
        }
      }
    }
    // if all dead
    Player p = new Player();
    p.genes.setupNodes();
    return p;
  }
  

  
}
