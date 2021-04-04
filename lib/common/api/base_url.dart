const bool _inProduction = const bool.fromEnvironment("dart.vm.product");

class Api {
  static get baseUrl {
    if (_inProduction) {
      return 'http://api.obulks.com';
    } else {
      return 'http://192.168.1.101:10001';
    }
  }
}
