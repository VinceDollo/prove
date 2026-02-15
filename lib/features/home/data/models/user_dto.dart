class UserDto {
  UserDto({
    this.email,
    this.firstName,
    this.lastName,
    this.subscribedToNewsletter,
  });

  UserDto.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    email = json['email'] as String?;
    firstName = json['firstName'] as String?;
    lastName = json['lastName'] as String?;
    subscribedToNewsletter = json['subscribedToNewsletter'] as bool?;
  }

  int? id;
  String? email;
  String? firstName;
  String? lastName;
  bool? subscribedToNewsletter;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['subscribedToNewsletter'] = subscribedToNewsletter;
    return data;
  }
}
