class MyDuration {
  final int _milliseconds;

  MyDuration(this._milliseconds);

  MyDuration.fromHours(int hours) : _milliseconds = hours * 3600000;

  MyDuration.fromMinutes(int minutes) : _milliseconds = minutes * 60000;

  MyDuration.fromSeconds(int seconds) : _milliseconds = seconds * 1000;

  int get milliseconds {
    return _milliseconds;
  }

  int cheackDuration() {
    int milisec = _milliseconds;
    if (milisec >= 0) {
      return milisec;
    } else {
      throw Exception('Duration shall always be greater or equal to 0');
    }
  }

  bool operator >(MyDuration other) {
    return this._milliseconds > other._milliseconds;
  }

  MyDuration operator +(MyDuration other) {
    return MyDuration(this._milliseconds + other._milliseconds);
  }

  MyDuration operator -(MyDuration other) {
    int result = this._milliseconds - other._milliseconds;
    if (result < 0) {
      throw Exception('Duration cannot be negative');
    }
    return MyDuration(result);
  }

  @override
  String toString() {
    int seconds = (_milliseconds / 1000).round();
    int minutes = (seconds / 60).floor();
    seconds = seconds % 60;
    int hours = (minutes / 60).floor();
    minutes = minutes % 60;
    return '$hours hours, $minutes minutes, $seconds seconds';
  }
}

void main() {
  MyDuration duration1 = MyDuration.fromHours(3); // 3 hours
  MyDuration duration2 = MyDuration.fromMinutes(45); // 45 minutes
  MyDuration duration3 = MyDuration.fromSeconds(122); // 122 seconds
  print(duration1 + duration2 + duration3); // 3 hours, 47 minutes, 2 seconds
  print(duration1 > duration2); //true

  try {
    print(duration2 - duration1); // This will throw an exception
  } catch (e) {
    print(e);
  }
}
