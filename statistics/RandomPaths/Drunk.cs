using System;
using System.Collections.Generic;

public class Drunk{
  public string Name { get; }
  public List<Coordinate> walk_choices { get; set; }
  public Drunk(string name){
    Name = name;
    walk_choices = new List<Coordinate>();
  }
}

public class TraditionalDrunk : Drunk{
  public TraditionalDrunk(string name): base(name){
    walk_choices.Add(new Coordinate(-2,-1));
    walk_choices.Add(new Coordinate(0,-3));
    walk_choices.Add(new Coordinate(0,1));
    walk_choices.Add(new Coordinate(2,1));
    walk_choices.Add(new Coordinate(1,1));
  } 
  //Define possible paths of this kind of drunk dude,
  //and the choose between them
  //coordinates inside array??
  Random rand = new Random();
  public Coordinate Walks(){
    var steps = rand.Next(walk_choices.Count - 1);
    return walk_choices[steps];
  }
}
