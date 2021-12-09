using ScottPlot;

class Utils{
  public static void MakeGraph(double[] x, double[] y){
    var plot = new ScottPlot.Plot(500,500);
    plot.AddScatter(x,y);
    plot.XLabel("Steps");
    plot.YLabel("Distances");
    plot.SaveFig("drunk_1.png");
  }
}
