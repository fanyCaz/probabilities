using System;

namespace RandomPaths
{
  class Program
  {
    static void Main(string[] args)
    {
      //Hypothesis: A drunk dude will move further from its origin while it keeps walking
      int[] paths_distances = new int[] { 10,100,1000,10000 };
      int attemps_number = 100;
      List<int> distances = new List<int>();
      
      foreach(int path in paths_distances){
        distances = SimulateWalking(path, attempts_number);
      }
    }

    List<int> SimulateWalking(int path, int attempts){
      TraditionalDrunk dude = TraditionalDrunk("Juan");
      var origin = new Coordinate(0,0);
    }
  }
}
