import 'dart:convert';

class StartAppResponse {
  String token;
  String encryptionKey;
  int expiresIn;
  int patternMinLength;
  bool checkMsisdn;
  bool isNotificationMenuVisible;

  StartAppResponse({
    this.token,
    this.encryptionKey,
    this.expiresIn,
    this.patternMinLength,
    this.checkMsisdn,
    this.isNotificationMenuVisible,
  });

  factory StartAppResponse.fromJson(Map<String, dynamic> map) {
    return new StartAppResponse(
      token: map['token'],
      encryptionKey: map['encryptionKey'],
      expiresIn: map['expiresIn'],
      patternMinLength: map['patternMinLength'],
      checkMsisdn: map['checkMsisdn'],
      isNotificationMenuVisible: map['isNotificationMenuVisible'],
    );
  }

  String toJson() {
    var map = Map<String, dynamic>();
    map['token'] = token;
    map['encryptionKey'] = encryptionKey;
    map['expiresIn'] = expiresIn;
    map['patternMinLength'] = patternMinLength;
    map['checkMsisdn'] = checkMsisdn;
    map['isNotificationMenuVisible'] = isNotificationMenuVisible;
    return json.encode(map);
  }
}

