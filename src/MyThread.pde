public class MyThread extends Thread{
  int first;
  int last;
  boolean running;
  //BoidList object = new BoidList();

  MyThread(int a, int b){
    this.first = a;
    this.last = b;
  }
  
  public void start(){
    running = true;
    super.start();
  }
  
  public void run(){
    while(true){
      flock1.run(avoidWalls, seperate, align, cohere, first, last);
    }
  }
}
