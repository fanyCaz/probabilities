using System;
using System.Linq;
using System.Collections.Generic;

using ScottPlot;

namespace RandomPaths
{
  class Program
  {
    static void Main(string[] args)
    {
      //Hypothesis: A drunk dude will move further from its origin while it keeps walking
      int[] paths_distances = new int[] { 10,100,1000,10000 };
      int attempts_number = 100;
      List<double> distances_simulation = new List<double>();
      List<double> distances_mean = new List<double>();

      foreach(int path in paths_distances){
        distances_simulation = SimulateWalking(path, attempts_number);
        double mean = Math.Round(distances_simulation.Sum() / distances_simulation.Count, 3);
        double max_distance = Math.Round( distances_simulation.Max(),2 );
        double min_distance = Math.Round( distances_simulation.Min(),2 );
        Console.WriteLine($"Mean of distances {mean}, max distance {max_distance}, min distance {min_distance} Steps: {path}");
        distances_mean.Add(mean);
      }
      var paths_x = paths_distances.Select(x => (double)x).ToArray();
      //Lo que puedo hacer porque no está la librería muy bien
      //aquí en mi compiu, es sacar un csv y graficar con julia ese csv
      Utils.MakeGraph(paths_x, distances_mean.ToArray());
    }

    static List<double> SimulateWalking(int steps, int attempts){
      TraditionalDrunk dude = new TraditionalDrunk("Juan");
      var origin = new Coordinate(0,0);
      List<double> distances = new List<double>();

      for(int i = 0; i < attempts; i++){
        Grid bar = new Grid();
        bar.AddDrunkDude(dude, origin);
        double distance = Walking(bar, dude, steps);
        distances.Add(distance);
      }
      return distances;
    }

    static double Walking(Grid bar, TraditionalDrunk dude, int steps){
      Coordinate start = bar.getCoordinateOf(dude);
      for(int i = 0; i < steps; i++){
        bar.MoveDrunkDude(dude);
      }
      return start.DistanceTo(bar.getCoordinateOf(dude));
    }
  }
}
