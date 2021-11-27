using System;

public class Drunk{
  public string Name { get; }
  public Drunk(string name){
    Name = name;
  }
}

public class TraditionalDrunk : Drunk{
  public TraditionalDrunk(string name): base(name){
  } 
  //Define possible paths of this kind of drunk dude,
  //and the choose between them
  //coordinates inside array??
  int[] walk_choices = new int[]{};
  public void Walks(){
    Console.WriteLine("Asi asi");
  }
}
