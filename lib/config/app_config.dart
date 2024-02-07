enum Env {
  dev,
  prod,
  stage,
}

abstract class AppConfig {
  Env get environment;

  String get baseUrl;
}

class DevConfig extends AppConfig {
  @override
  Env get environment => Env.dev;

  @override
  String get baseUrl => "https://herogamesuserapp-default-rtdb.firebaseio.com/";
}

class ProdConfig extends AppConfig {
  @override
  Env get environment => Env.prod;

  @override
  String get baseUrl => "";
}

class StageConfig extends AppConfig {
  @override
  Env get environment => Env.stage;

  @override
  String get baseUrl => "";
}
