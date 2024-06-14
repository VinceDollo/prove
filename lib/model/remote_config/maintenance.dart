import 'package:flutter_starter/model/remote_config/local_string.dart';
import 'package:kotlin_flavor/scope_functions.dart';

const String maintenanceJsonRemoteKey = 'maintenance_json';

class Maintenance {
  Maintenance({
    this.isActive = false,
    this.title,
    this.message,
  });

  Maintenance.fromJson(Map<String, dynamic> json) {
    isActive = (json['isActive'] as bool?) ?? false;
    (json['title'] as Map<String, dynamic>?)
        ?.let((jsonMessage) => title = LocalString.fromJson(jsonMessage));
    (json['message'] as Map<String, dynamic>?)
        ?.let((jsonMessage) => message = LocalString.fromJson(jsonMessage));
  }

  bool isActive = false;
  LocalString? title;
  LocalString? message;

  static const defaultMap = <String, dynamic>{
    'isActive': false,
    'title': {'all': 'Maintenance', 'fr': 'Maintenance'},
    'message': {
      'all': 'Sorry, the application is temporarily'
          ' unavailable due to maintenance.',
      'fr': "Désolé, l'application est momentanément "
          'indisponible car une maintenance est en cours.',
      'bg': 'За съжаление, приложението временно не е достъпно, тъй като се '
          'поддържа поддръжка.',
      'cs': 'Litujeme, aplikace je dočasně nedostupná, protože probíhá údržba.',
      'da': 'Beklager, applikationen er midlertidigt utilgængelig, '
          'fordi vedligeholdelse er i gang.',
      'de': 'Die Anwendung ist leider vorübergehend nicht verfügbar, '
          'da gerade Wartungsarbeiten durchgeführt werden.',
      'el': 'Λυπούμαστε, η εφαρμογή δεν είναι προσωρινά διαθέσιμη επειδή η'
          ' συντήρηση βρίσκεται σε εξέλιξη.',
      'en': 'Sorry, the application is temporarily unavailable due to'
          ' maintenance.',
      'es': 'Lo sentimos, la aplicación no está disponible temporalmente porque'
          ' el mantenimiento está en progreso.',
      'fi': 'Valitettavasti sovellus ei ole tilapäisesti poissa käytöstä, koska'
          ' ylläpito on käynnissä.',
      'hu': 'Sajnáljuk, az alkalmazás ideiglenesen nem érhető el, mert a'
          ' karbantartás folyamatban van.',
      'it': 'Spiacenti, l&#39;applicazione è temporaneamente non disponibile'
          ' perché è in corso la manutenzione.',
      'ja': 'メンテナンス中のため、アプリケーションを一時的にご利用いただけません。',
      'nl': 'Sorry, de applicatie is tijdelijk niet beschikbaar omdat er'
          ' onderhoud wordt uitgevoerd.',
      'pl': 'Przepraszamy, aplikacja jest tymczasowo niedostępna, '
          'ponieważ trwają prace konserwacyjne.',
      'pt': 'O aplicativo está temporariamente indisponível porque '
          'a manutenção está em andamento.',
      'ru': 'Извините, приложение временно недоступно, потому что '
          'идет обслуживание.',
      'sv': 'Tyvärr är applikationen tillfälligt inte tillgänglig '
          'eftersom underhåll pågår.',
    },
  };
}
