enum AppFlavor { test, production }

AppFlavor getFlavor(String flavorName) {
  switch (flavorName) {
    case 'test':
      return AppFlavor.test;
    case 'production':
      return AppFlavor.production;
    default:
      return AppFlavor.production;
  }
}

extension BuildFlavorExtension on AppFlavor {
  String get flavorName {
    switch (this) {
      case AppFlavor.test:
      case AppFlavor.production:
        return '';
    }
  }

  String get baseUrl {
    switch (this) {
      case AppFlavor.test:
      case AppFlavor.production:
        return 'https://example.com';
    }
  }

  String get debugUserEmail {
    switch (this) {
      case AppFlavor.test:
      case AppFlavor.production:
        return 'customer@example.com';
    }
  }

  String get debugUserPassword {
    switch (this) {
      case AppFlavor.test:
      case AppFlavor.production:
        return 'password';
    }
  }
}
