class BearerTokenDto {
  BearerTokenDto({
    this.accessToken,
    this.expiresIn,
    this.tokenType,
    this.refreshToken,
  });

  BearerTokenDto.fromJson(Map<dynamic, dynamic> json) {
    accessToken = json['access_token'] as String?;
    expiresIn = json['expires_in'] as int?;
    scope = json['scope'] as String?;
    tokenType = json['token_type'] as String?;
    refreshToken = json['refresh_token'] as String?;
  }

  String? accessToken;
  int? expiresIn;
  String? scope;
  String? tokenType;
  String? refreshToken;

  String get header => 'Bearer $accessToken';

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['access_token'] = accessToken;
    data['expires_in'] = expiresIn;
    data['scope'] = scope;
    data['token_type'] = tokenType;
    data['refresh_token'] = refreshToken;
    return data;
  }
}
