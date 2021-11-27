using System;

public class Coordinate{
  public int X { get; set; }
  public int Y { get; set; }
  public Coordinate(int x,int y){
    X = x;
    Y = y;
  }

  public Coordinate Move(int delta_x, int delta_y){
    return new Coordinate(this.X + delta_x,this.Y + delta_y);
  }

  public double DistanceTo(Coordinate otherPoint){
    int delta_x = this.X - otherPoint.X;
    int delta_y = this.Y - otherPoint.Y;

    return Math.Sqrt(Math.Pow(delta_x,2) + Math.Pow(delta_y,2));
  }
}
