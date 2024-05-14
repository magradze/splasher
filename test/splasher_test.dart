import 'package:flutter_test/flutter_test.dart';

import 'package:splasher/splasher.dart';

void main() {
  test('Splasher', () {
    var splasher = const Splasher(
      logo: 'logo',
    );
    expect(splasher.logo, 'logo');
  });
}
