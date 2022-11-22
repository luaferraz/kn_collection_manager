enum Environment { DEV, PROD }

class AppConfig {
  static late Map<String, dynamic> _config;

  static void setEnvironment(Environment env) {
    switch (env) {
      case Environment.DEV:
        _config = _Config.devConfig;
        break;
      case Environment.PROD:
        _config = _Config.prodConstants;
        break;
    }
  }

  static get baseUrl {
    return _config["baseUrl"];
  }

  static get WHERE_AM_I {
    return _config["WHERE_AM_I"];
  }
}

class _Config {
  static Map<String, dynamic> devConfig = {
    "baseUrl": "https://localhost:7210/api/",
    "WHERE_AM_I": "dev"
  };

  static Map<String, dynamic> prodConstants = {
    // "baseUrl": "https://api.letsranking.com",
    // "WHERE_AM_I": ""
  };
}
