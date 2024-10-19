class CustomDuration {
  final int _milliseconds;

  CustomDuration(this._milliseconds);

  CustomDuration.fromHours(int hours) : _milliseconds = hours * 3600000;

  CustomDuration.fromMinutes(int minutes) : _milliseconds = minutes * 60000;

  CustomDuration.fromSeconds(int seconds) : _milliseconds = seconds * 1000;

  int get milliseconds {
    return _milliseconds;
  }

  bool operator >(CustomDuration other) {
    return this._milliseconds > other._milliseconds;
  }

  CustomDuration operator +(CustomDuration other) {
    return CustomDuration(this._milliseconds + other._milliseconds);
  }

  CustomDuration operator -(CustomDuration other) {
    int result = this._milliseconds - other._milliseconds;
    if (result < 0) {
      throw Exception('Duration cannot be negative');
    }
    return CustomDuration(result);
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
  CustomDuration duration1 = CustomDuration.fromHours(3); // 3 hours
  CustomDuration duration2 = CustomDuration.fromMinutes(45); // 45 minutes
  CustomDuration duration3 = CustomDuration.fromSeconds(122); // 122 seconds
  print(duration1 + duration2 + duration3); // 3 hours, 47 minutes, 2 seconds
  print(duration1 > duration2); //true

  try {
    print(duration2 - duration1); // This will throw an exception
  } catch (e) {
    print(e);
  }
}