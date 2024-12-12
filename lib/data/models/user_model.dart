class UserModel {

  UserModel(
      {required this.sucess,
      required this.token,
      required this.expiry,
      required this.expiryInSeconds,
      required this.route,
      required this.queryParams,
      required this.jid,
      required this.entitlements,
      required this.ems_roles});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        sucess: json["sucess"],
        token: json['token'],
        expiry: json['expiry'],
        expiryInSeconds: json['expiryInSeconds'],
        route: json['route'],
        queryParams: json['queryParams'],
        jid: json['jid'],
        entitlements: json['entitlements'],
        ems_roles: json['ems_roles']);
  }
  final bool sucess;
  final String token;
  final String expiry;
  final int expiryInSeconds;
  final String route;
  final Map<String, dynamic> queryParams;
  final String jid;
  final String entitlements;
  final String ems_roles;

  Map<String, dynamic> toJson(UserModel user) => {
      'sucess': user.sucess,
      'token': user.token,
      'expiry': user.expiry,
      'expiryInSeconds': user.expiryInSeconds,
      'route': user.route,
      'queryParams': user.queryParams,
      'jid': user.jid,
      'entitlements': user.entitlements,
      'ems_roles': user.ems_roles,
    };

}
