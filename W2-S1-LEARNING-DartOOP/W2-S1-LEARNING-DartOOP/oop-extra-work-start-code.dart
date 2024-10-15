// Class Tree
class Tree {
  String type;
  double height;

  Tree(this.type, this.height);
}

// Class House
class House {
  int stair;
  Window window;
  Roof roof;
  Door door;

  List<Tree> trees = []; // by default empty

  House(this.stair, this.window, this.roof, this.door);

  void addTree(Tree newTree) {
    this.trees.add(newTree);
  }

  void buildHouse() {
    if (stair > 1) {
      print("House has $stair stairs");
    } else {
      print("House has 1 stair");
    }
    print('Window: $window');
    print('Roof: $roof');
    print('Door: $door');
  }
}

class Window {
  String location;
  int number;
  String color;

  Window(this.location, this.number, this.color);

  @override
  String toString() {
    return "Window $color on $location side";
  }
}

class Roof {
  String type;
  String material;

  Roof(this.type, this.material);
  @override
  String toString() {
    return "$type roof made of $material";
  }
}

class Door {
  String type;
  String material;
  String location;

  Door(this.type, this.material, this.location);

  @override
  String toString() {
    return "$type door made of $material is in the $location";
  }
}

main() {
  Window w1 = Window('left', 4, 'red');
  Roof r1 = Roof('Hip', 'Clay Tile');
  Door d1 = Door('Three Panel', 'Wood', 'Center');

  House h1 = House(2, w1, r1, d1);

  h1.buildHouse();
}
