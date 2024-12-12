import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:intl/intl.dart";
import "package:sample_app/core/constants/app_routes.dart";
import "package:sample_app/data/datasources/jwt_datasource.dart";
import "package:sample_app/data/datasources/secure_storage_impl.dart";

class JwtController {
  final JwtDatasource jwtDatasource = JwtDatasource();
  final SecureStorage secureStorage = SecureStorage();

  Future<void> jwtAuthenticaion(
      String email, String password, BuildContext context,) async {
         final Map<String, dynamic> response =
        await jwtDatasource.getJwtData(email, password);
         // response = {
        //   "sucess": true,
        //   "token":
        //       "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbGFpbXMiOnsiYXBwcyI6bnVsbCwiZW1zX3JvbGVzIjpbXX0sImlhdCI6MTczMTA0ODA4MCwiZXhwIjoxNzMxMTM0NDgwLCJhdWQiOiJDb2dlbmNpc1VzZXIiLCJpc3MiOiJDb2dlbmNpcyJ9.tjG0RdXivQVhpoECikqpVqskctVKUnGDetIGVPdk4Tc",
        //   "expiry": "2024-11-09T06:41:20.000Z",
        //   "expiryInSeconds": 1731134480000,
        //   "route": "newsbrief",
        //   "queryParams": {},
        //   "jid": null,
        //   "entitlements": null,
        //   "ems_roles": []
        // };
    if (response.isNotEmpty) {
      secureStorage.saveJwtToken(
          response["token"] ?? "",
          response["expiry"] ?? "",
          response["route"] ?? "",
          response["jit"] ?? "",
          response["entitlements"] ?? "",);
      context.pushRoute(
        const PageRouteInfo(
          AppRoutes.navigation,
        ),
      );
    }
  }

  Future<bool> checkJwtExpiry() async {
    final String? expiryDate = await secureStorage.getSecureData("expiry");
    final String currentDate = DateFormat("dd-MM-yyyy").format(DateTime.now());
    if (expiryDate == "2024-11-09T06:41:20.000Z") {
      return true;
    }
    return false;
  }

  Future<String?> getJwtToken() async => secureStorage.readJwtToken();
}
