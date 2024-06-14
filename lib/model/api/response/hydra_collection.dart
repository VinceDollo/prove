import 'package:flutter_starter/model/api/response/hydra_member.dart';

class HydraCollection<T> extends Hydra {
  HydraCollection.fromJson(
    Map<String, dynamic> json,
    Function(Map<String, dynamic>) fromJson,
  ) : super.fromJson(json) {
    final members = json['hydra:member'];
    if (members is List) {
      for (final member in members) {
        if (member is Map<String, dynamic>) {
          hydraMember.add(fromJson(member) as T);
        }
      }
    }

    final totalItems = json['hydra:totalItems'];
    hydraTotalItems = totalItems is int ? totalItems : 0;

    final hydraViewJson = json['hydra:view'] as Map<String, dynamic>?;
    hydraView =
        hydraViewJson != null ? HydraView.fromJson(hydraViewJson) : null;

    final hydraSearchJson = json['hydra:search'] as Map<String, dynamic>?;
    hydraSearch =
        hydraSearchJson != null ? HydraSearch.fromJson(hydraSearchJson) : null;
  }

  List<T> hydraMember = <T>[];
  int hydraTotalItems = 0;
  HydraView? hydraView;
  HydraSearch? hydraSearch;

  // TODO WIP
  Map<String, dynamic> toJsonFunction(Function(T) toJson) {
    final data = super.toJson();
    //TODO test this line
    data['hydra:member'] = hydraMember.map((v) => toJson(v)).toList();

    data['hydra:totalItems'] = hydraTotalItems;
    if (hydraView != null) {
      data['hydra:view'] = hydraView?.toJson();
    }
    if (hydraSearch != null) {
      data['hydra:search'] = hydraSearch?.toJson();
    }
    return data;
  }
}

extension HydraStringExtension on String {
  String? get pageId {
    const pageKey = 'page=';
    final index = indexOf(pageKey);
    return index == -1 ? null : substring(index + pageKey.length);
  }
}

class HydraView extends Hydra {
  HydraView({this.hydraFirst, this.hydraLast, this.hydraNext});

  HydraView.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    hydraFirst = json['hydra:first'] as String?;
    hydraLast = json['hydra:last'] as String?;
    hydraPrevious = json['hydra:previous'] as String?;
    hydraNext = json['hydra:next'] as String?;
  }

  String? hydraFirst;
  String? hydraLast;
  String? hydraPrevious;
  String? hydraNext;

  @override
  Map<String, dynamic> toJson() {
    final data = super.toJson();
    data['hydra:first'] = hydraFirst;
    data['hydra:last'] = hydraLast;
    data['hydra:next'] = hydraNext;
    return data;
  }
}

class HydraSearch extends Hydra {
  HydraSearch({
    this.hydraTemplate,
    this.hydraVariableRepresentation,
    this.hydraMapping,
  });

  HydraSearch.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    hydraTemplate = json['hydra:template'] as String?;
    hydraVariableRepresentation =
        json['hydra:variableRepresentation'] as String?;
    final mapping = json['hydra:mapping'];
    if (mapping is List) {
      hydraMapping = <HydraMapping>[];
      for (final map in mapping) {
        if (map is Map<String, dynamic>) {
          hydraMapping?.add(HydraMapping.fromJson(map));
        }
      }
    }
  }

  String? hydraTemplate;
  String? hydraVariableRepresentation;
  List<HydraMapping?>? hydraMapping;

  @override
  Map<String, dynamic> toJson() {
    final data = super.toJson();
    data['hydra:template'] = hydraTemplate;
    data['hydra:variableRepresentation'] = hydraVariableRepresentation;
    if (hydraMapping != null) {
      data['hydra:mapping'] = hydraMapping?.map((v) => v?.toJson()).toList();
    }
    return data;
  }
}

class HydraMapping extends Hydra {
  HydraMapping({this.variable, this.property, this.required});

  HydraMapping.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    variable = json['variable'] as String?;
    property = json['property'] as String?;
    required = json['required'] as bool?;
  }

  String? variable;
  String? property;
  bool? required;

  @override
  Map<String, dynamic> toJson() {
    final data = super.toJson();
    data['variable'] = variable;
    data['property'] = property;
    data['required'] = required;
    return data;
  }
}
