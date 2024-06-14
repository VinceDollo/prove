class Customer {

  Customer({
    this.context,
    this.id,
    this.type,
    this.pathId,
    this.email,
    this.firstName,
    this.lastName,
    this.subscribedToNewsletter,
  });

  Customer.fromJson(Map<String, dynamic> json) {
    context = json['@context'] as String?;
    pathId = json['@id'] as String?;
    type = json['@type'] as String?;
    id = json['id'] as int?;
    email = json['email'] as String?;
    firstName = json['firstName'] as String?;
    lastName = json['lastName'] as String?;
    subscribedToNewsletter = json['subscribedToNewsletter'] as bool?;
  }

  String? context;
  String? pathId;
  String? type;
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  bool? subscribedToNewsletter;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['@context'] = context;
    data['@id'] = pathId;
    data['@type'] = type;
    data['id'] = id;
    data['email'] = email;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['subscribedToNewsletter'] = subscribedToNewsletter;
    return data;
  }
}
