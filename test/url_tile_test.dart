import 'package:flutter_test/flutter_test.dart';

import 'package:url_tile/url_tile.dart';

void main() {
  test('adds one to input values', () {
    const URLTile(url: 'https://source.unsplash.com/user/c_v_r/1900x800');
    const URLTile(url: 'https://www.africau.edu/images/default/sample.pdf');
  });
}
