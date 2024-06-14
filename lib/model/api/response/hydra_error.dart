class HydraException implements Exception {
  HydraException(this.error);

  HydraError error;
}

class HydraError {
  HydraError({
    this.context,
    this.type,
    this.hydraTitle,
    this.hydraDescription,
    this.violations,
  });

  HydraError.fromJson(Map<String, dynamic> json) {
    context = json['@context'] as String?;
    type = json['@type'] as String;
    hydraTitle = json['hydra:title'] as String;
    hydraDescription = json['hydra:description'] as String;

    final jsonViolations = json['violations'];
    if (jsonViolations is List) {
      violations = <Violations>[];
      for (final v in jsonViolations) {
        if (v != null) {
          violations?.add(Violations.fromJson(v as Map<String, dynamic>));
        }
      }
    }
  }

  String? context;
  String? type;
  String? hydraTitle;
  String? hydraDescription;
  List<Violations?>? violations;

  String? get displayError => violations?.isNotEmpty == true
      ? (violations?.first?.message ?? hydraDescription)
      : hydraDescription;

  String? getKeyErrorMessage(String key) {
    if (violations?.isNotEmpty == true) {
      return violations
          ?.firstWhere(
            (violation) => violation?.propertyPath == key,
            orElse: () => null,
          )
          ?.message;
    }

    return null;
  }

  bool hasFieldErrors(List<String> fieldsKey) {
    if (fieldsKey.isNotEmpty == true && violations?.isNotEmpty == true) {
      return violations?.firstWhere(
            (violation) => fieldsKey.contains(violation?.propertyPath),
            orElse: () => null,
          ) !=
          null;
    }

    return false;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['@context'] = context;
    data['@type'] = type;
    data['hydra:title'] = hydraTitle;
    data['hydra:description'] = hydraDescription;
    if (violations != null) {
      data['violations'] = violations?.map((v) => v?.toJson()).toList();
    }
    return data;
  }
}

class Violations {
  Violations({this.propertyPath, this.message, this.code});

  Violations.fromJson(Map<String, dynamic> json) {
    propertyPath = json['propertyPath'] as String?;
    message = json['message'] as String?;
    code = json['code'] as String?;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['propertyPath'] = propertyPath;
    data['message'] = message;
    data['code'] = code;
    return data;
  }

  String? propertyPath;
  String? message;
  String? code;
}
