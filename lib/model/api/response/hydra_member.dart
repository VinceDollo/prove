class Hydra {
  Hydra({
    this.id,
    this.type,
    this.pathId,
  });

  Hydra.fromJson(Map<String, dynamic> json) {
    pathId = json['@id'] as String?;
    type = json['@type'] as String?;
    id = json['id'] as int?;
  }

  String? pathId;
  String? type;
  int? id;

  String? get idFromPath {
    final index = pathId?.lastIndexOf('/') ?? -1;
    return index == -1 ? null : pathId?.substring(index + 1);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['@id'] = pathId;
    data['@type'] = type;
    data['id'] = id;
    return data;
  }
}
