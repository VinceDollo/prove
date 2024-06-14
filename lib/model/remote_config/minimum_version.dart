import 'package:flutter_starter/model/remote_config/local_string.dart';
import 'package:kotlin_flavor/scope_functions.dart';
import 'package:package_info_plus/package_info_plus.dart';

const String minimumVersionJsonRemoteKey = 'minimum_version_json';
const int minimumVersionDefault = 0;

class MinimumVersion {
  MinimumVersion({this.minimumVersion = minimumVersionDefault, this.message});

  MinimumVersion.fromJson(Map<String, dynamic> json) {
    minimumVersion = (json['version'] as int?) ?? minimumVersionDefault;

    (json['message'] as Map<String, dynamic>?)
        ?.let((jsonMessage) => message = LocalString.fromJson(jsonMessage));
  }

  int minimumVersion = minimumVersionDefault;
  LocalString? message;

  Future<bool> updateMandatory() async {
    final info = await PackageInfo.fromPlatform();
    final versionNumber =
        int.tryParse(info.buildNumber) ?? minimumVersionDefault;
    return versionNumber < minimumVersion;
  }

  static const defaultMap = <String, dynamic>{
    'version': minimumVersionDefault,
    'message': {
      'all': 'An update of the application is required. '
          'Please go to the app store to update.',
      'fr': "Une mise à jour de l'application est nécessaire. Veuillez vous "
          "rendre dans le magasin d'applications pour "
          'effectuer la mise à jour.',
      'bg': 'Необходима е актуализация на приложението. '
          'Моля, отидете в магазина за приложения, за да актуализирате.',
      'cs': 'Je nutná aktualizace aplikace. '
          'Chcete-li aktualizovat, přejděte do obchodu s aplikacemi.',
      'da': 'En opdatering af applikationen er nødvendig. '
          'Gå til app store for at opdatere.',
      'de': 'Eine Aktualisierung der Anwendung ist erforderlich. '
          'Bitte gehen Sie zum App Store, um zu aktualisieren.',
      'el': 'Απαιτείται ενημέρωση της εφαρμογής. '
          'Μεταβείτε στο κατάστημα εφαρμογών για ενημέρωση.',
      'en': 'An update of the application is required. '
          'Please go to the app store to update.',
      'es': 'Es necesaria una actualización de la aplicación. '
          'Vaya a la tienda de aplicaciones para actualizar.',
      'fi': 'Sovelluksen päivitys on tarpeen. '
          'Siirry sovelluskauppaan päivittääksesi.',
      'hu': 'Az alkalmazás frissítése szükséges. '
          'Kérjük, menjen az App Store-ba a frissítéshez.',
      'it': 'È necessario un aggiornamento dell&#39;applicazione. '
          'Vai all&#39;app store per l&#39;aggiornamento.',
      'ja': 'アプリケーションの更新が必要です。'
          'アプリストアにアクセスして更新してください。',
      'nl': 'Een update van de applicatie is noodzakelijk. '
          'Ga naar de app store om te updaten.',
      'pl': 'Konieczna jest aktualizacja aplikacji. '
          'Przejdź do sklepu z aplikacjami, aby zaktualizować.',
      'pt': 'Uma atualização do aplicativo é necessária. '
          'Por favor, vá para a loja de aplicativos para atualizar.',
      'ru': 'Необходимо обновить приложение. '
          'Пожалуйста, перейдите в магазин приложений для обновления.',
      'sv': 'En uppdatering av applikationen är nödvändig. '
          'Gå till app store för att uppdatera.',
    },
  };
}
