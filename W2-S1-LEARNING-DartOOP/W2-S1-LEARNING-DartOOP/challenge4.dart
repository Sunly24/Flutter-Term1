class Distance {
  final double _meters;

  Distance.kms(double kms) : _meters = kms * 1000;

  Distance.meters(double meters) : _meters = meters;

  Distance.cms(double cms) : _meters = cms / 100;

  double get kms {
    return _meters / 1000;
  }

  double get metrs {
    return _meters;
  }

  double get cms {
    return _meters * 100;
  }

  Distance operator +(Distance d) {
    return Distance.meters(_meters + d.metrs);
  }
}

main() {
  Distance d1 = Distance.kms(3.4);
  Distance d2 = Distance.meters(1000);

  print((d1 + d2).kms);
}
