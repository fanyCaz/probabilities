using System;

namespace RandomPaths
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello World!");
            Drunk guy = new Drunk("Javi");
            Console.WriteLine(guy.Name);
            TraditionalDrunk dude = new TraditionalDrunk("Jorge");
            dude.Walks();
            Coordinate coordinate = new Coordinate(0,0);
            Coordinate newPoint = coordinate.Move(3,4);
            Console.WriteLine(coordinate.X);
            Console.WriteLine(coordinate.DistanceTo(newPoint));
        }
    }
}
