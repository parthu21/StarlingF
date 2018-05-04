class BoidList
{
  ArrayList boids; //will hold the boids in this BoidList
  float h; //for color
  float eraseRadius;
  float averageKE;
  
  boolean freeze;

  BoidList(int n,float ih)
  {
    freeze = false;
    boids = new ArrayList();
    eraseRadius = 10;
    h = ih;
    for(int i=0;i<n;i++)
      boids.add(new Boid(new PVector(width/2,height/2,600)));
  }

  void add()
  {
    for(int i=0;i<50;i++){
      boids.add(new Boid(new PVector(random(width),random(height))));
    }
  }

  void addBoid(Boid b)
  {
    boids.add(b);
  }

  void run(boolean aW, float slider1,float slider2,float slider3,int fin,int sin)
  {
    averageKE = 0;
    for(int i=fin;i<boids.size() || i<sin;i++) //iterate through the list of boids
    {
      Boid tempBoid = (Boid)boids.get(i); //create a temporary boid to process and make it the current boid in the list
      tempBoid.h = h;
      tempBoid.avoidWalls = aW;
      if(!freeze){
        tempBoid.run(boids,slider1,slider2,slider3); //tell the temporary boid to execute its run method
      }
      //averageKE = ((averageKE * i) + (tempBoid.KineticEnergy))/(i+1);
    }
  }
  
  int energy(){
    int en = 0;
    for(int i=0;i<boids.size();i++) //iterate through the list of boids
    {
      Boid tempBoid = (Boid)boids.get(i);
      en += tempBoid.vel.dot(tempBoid.vel);
    }
    return en;
  }
  
  void renders(){
      for(int i=0;i<boids.size();i++) //iterate through the list of boids
    {
      Boid tempBoid = (Boid)boids.get(i); //create a temporary boid to process and make it the current boid in the list
      tempBoid.render();
    }
  }
  
  void freeze(){
    freeze = !(freeze);
  }
  
  void reverses(){
    for(int i=0;i<boids.size();i++) //iterate through the list of boids
    {
      Boid tempBoid = (Boid)boids.get(i); //create a temporary boid to process and make it the current boid in the list
      tempBoid.reverse();
    }
  }
  
  void speedUps(){
    for(int i=0;i<boids.size();i++) //iterate through the list of boids
    {
      Boid tempBoid = (Boid)boids.get(i); //create a temporary boid to process and make it the current boid in the list
      tempBoid.speedUp();
    }
  }
  
  void speedDowns(){
    for(int i=0;i<boids.size();i++) //iterate through the list of boids
    {
      Boid tempBoid = (Boid)boids.get(i); //create a temporary boid to process and make it the current boid in the list
      tempBoid.speedDown();
    }
  }
  
  void erase(int e){
      for(int i=0;i<boids.size() && e>0;i++){
      float re = random(10);
      if(re > 6){
        e--;
        boids.remove(i);
      }
  }
}
}
