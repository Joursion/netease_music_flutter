class Config {
  final isProd = bool.fromEnvironment('dart.vm.product');

  get appName => isProd ? 'App' : 'App';
}

final gloablConfig = Config();

