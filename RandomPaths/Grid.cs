using System;
using System.Collections.Generic;

public class Grid{
  public Dictionary<TraditionalDrunk,Coordinate> drunk_dudes_coordinates { get; }
  public Grid(){
    drunk_dudes_coordinates = new Dictionary<TraditionalDrunk,Coordinate>();
  }

  public void AddDrunkDude(TraditionalDrunk dude, Coordinate coords){
    drunk_dudes_coordinates.Add(dude, coords); 
  }

  public void MoveDrunkDude(TraditionalDrunk dude){
    var point = dude.Walks();
    var current_coordinate = drunk_dudes_coordinates[dude];
    var new_point = current_coordinate.Move(point);
    drunk_dudes_coordinates[dude] = new_point;
  }

  public Coordinate getCoordinateOf(TraditionalDrunk dude){
    return drunk_dudes_coordinates[dude];
  }
}
