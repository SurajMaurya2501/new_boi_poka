import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:sample_app/controller/shared_pref_controller.dart';
import 'package:sample_app/core/constants/app_routes.dart';
import 'package:sample_app/core/constants/app_typography.dart';
import 'package:sample_app/presentation/custom_widgets/custom_textfield.dart';


@RoutePage()
class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Form(
        key: _formKey,
        child: Column(
          // shrinkWrap: true,
          children: [
            Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "BOI-POKA",
                      style: AppTypography.typo40BlackNormal,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Text(
                        "SIGN IN",
                        style: AppTypography.typo16MediumkBold,
                      ),
                    ),
                    CustomTextfield(
                      validator:[
                        FormBuilderValidators.required(),
                        FormBuilderValidators.email()
                      ],
                      controller: _emailController,
                      title: "Enter Your Email Id",
                    ),
                    CustomTextfield(
                      isObscure: true,
                      validator:[
                        FormBuilderValidators.required(),
                        FormBuilderValidators.password()
                      ],
                      controller: _passController,
                      title: "Password",
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigator.pushNamed(context, AppRoutes.pinLogin);
                        context.pushRoute(
            PageRouteInfo(
              AppRoutes.pinLogin,
            ),
          );
                      },
                      child: const Text(
                        "Use Mpin to Login",
                        style: TextStyle(
                          color: Color.fromARGB(255, 8, 47, 138),
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.4,
                    child: const Divider(
                      thickness: 2,
                    ),
                    ),
                Text(
                  "OR",
                  style: AppTypography.typo16MediumkBold,
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.4,
                  child: const Divider(
                    thickness: 2,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10.0),
                      width: 150,
                      height: 50.0,
                      child: TextButton(
                        style: const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                            Colors.amber,
                          ),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            final sharedPref = SharedPrefController();
                            sharedPref.setBool("isLogin", true);
                            context.pushRoute(
            PageRouteInfo(
              AppRoutes.mainTabView,
            ),
          );
                         }
                        },
                        child: const Text(
                          "SIGN IN",
                          style: TextStyle(fontSize: 20, color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: "Don't have an account? ",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          WidgetSpan(
                            child: GestureDetector(
                              onTap: () {
                                context.pushRoute(
            PageRouteInfo(
              AppRoutes.signup,
            ),
          );
                                // Navigator.pushReplacementNamed(
                                //     context, AppRoutes.signUp);
                              },
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                  color: Colors.amber.shade900,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: "Forgot your password? ",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          WidgetSpan(
                            child: GestureDetector(
                              
                              onTap: () {
                                // Navigator.pushReplacementNamed(
                                //     context, AppRoutes.signUp);
                                context.pushRoute(
            PageRouteInfo(
              AppRoutes.signup,
            ),
          );
                              },
                              child: Text(
                                "Reset",
                                style: TextStyle(
                                  color: Colors.amber.shade900,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget circularIcon(IconData icon, Function()? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          margin: const EdgeInsets.only(right: 5.0, left: 5.0),
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.grey,
            ),
          ),
          child: Icon(icon,),),
    );
  }
}
