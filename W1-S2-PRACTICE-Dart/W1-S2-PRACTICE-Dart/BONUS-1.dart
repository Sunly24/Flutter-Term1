enum Direction { north, east, south, west }

void main() {
  int x = 7;
  int y = 3;
  Direction direction = Direction.north;

  const instructions = "RAALAL";

  for (int i = 0; i < instructions.length; i++) {
    switch (instructions[i]) {
      case 'R':
        direction = turnRight(direction);
        break;
      case 'L':
        direction = turnLeft(direction);
        break;
      case 'A':
        switch (direction) {
          case Direction.north:
            y += 1;
            break;
          case Direction.south:
            y -= 1;
            break;
          case Direction.east:
            x += 1;
            break;
          case Direction.west:
            x -= 1;
            break;
        }
        break;
    }
  }

  print("Final position: {${x},${y}} ");
  print("Facing: ${DirToString(direction)} ");
}

Direction turnRight(Direction direction) {
  switch (direction) {
    case Direction.east:
      return Direction.south;
    case Direction.north:
      return Direction.east;
    case Direction.south:
      return Direction.west;
    case Direction.west:
      return Direction.north;
  }
}

Direction turnLeft(Direction direction) {
  switch (direction) {
    case Direction.east:
      return Direction.north;
    case Direction.north:
      return Direction.west;
    case Direction.west:
      return Direction.south;
    case Direction.south:
      return Direction.east;
  }
}

String DirToString(Direction direction) {
  switch (direction) {
    case Direction.north:
      return "north";
    case Direction.east:
      return "east";
    case Direction.south:
      return "south";
    case Direction.west:
      return "west";
  }
}
