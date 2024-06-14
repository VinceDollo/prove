
enum AppFlavor { dev, test, preprod, production }

extension BuildFlavorExtension on AppFlavor {
  String get flavorName {
    switch (this) {
      case AppFlavor.dev:
      case AppFlavor.test:
      case AppFlavor.preprod:
        return '($name)';
      case AppFlavor.production:
        return '';
    }
  }

  String get baseUrl {
    switch (this) {
      case AppFlavor.dev:
      case AppFlavor.test:
      case AppFlavor.preprod:
      case AppFlavor.production:
        return 'https://example.com'; // TODO change this
    }
  }

  String get debugUserEmail {
    switch (this) {
      case AppFlavor.dev:
      case AppFlavor.test:
      case AppFlavor.preprod:
      case AppFlavor.production:
        return 'customer@example.com'; // TODO change this
    }
  }

  String get debugUserPassword {
    switch (this) {
      case AppFlavor.dev:
      case AppFlavor.test:
      case AppFlavor.preprod:
      case AppFlavor.production:
        return 'password'; // TODO change this
    }
  }
}
