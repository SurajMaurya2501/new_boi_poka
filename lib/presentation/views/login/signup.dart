import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_form_builder/flutter_form_builder.dart";
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:form_builder_validators/form_builder_validators.dart";
import "package:sample_app/core/constants/app_colors.dart";
import "package:sample_app/core/constants/app_images.dart";
import "package:sample_app/core/constants/app_routes.dart";
import "package:sample_app/core/constants/app_typography.dart";
import "package:sample_app/controller/facebook_login_controller.dart";
import "package:sample_app/controller/firebase_login_controller.dart";
import "package:sample_app/controller/google_login_controller.dart";
import "package:sample_app/controller/twitter_login_controller.dart";
import "package:sample_app/presentation/custom_widgets/custom_textfield.dart";
import "package:sample_app/presentation/provider/signup_riverpod.dart";
import "package:sample_app/presentation/views/login/widgets/custom_circular_icon.dart";

@RoutePage()
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TwitterLoginController _twitterLoginController =
      TwitterLoginController();
  final GoogleLoginController _googleLoginController = GoogleLoginController();
  final FacebookLoginController _facebookLoginController =
      FacebookLoginController();
  final FirebaseLoginController _firebaseController = FirebaseLoginController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  String? gender;
  Locale locale = const Locale("en");

  List<String> cities = <String>[
    "Mumbai",
    "Pune",
    "Nagpur",
    "Nashik",
    "Aurangabad",
    "Solapur",
    "Thane",
    "Kolhapur",
    "Amravati",
    "Satara",
  ];

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: AppColors.primaryColor,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            final StateController<Locale> locale =
                ref.read(signupProvider.notifier);

            return SafeArea(
              child: SingleChildScrollView(
                child: FormBuilder(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        //Above Part with background image
                        Container(
                          height: MediaQuery.sizeOf(context).height * 0.3,
                          padding: const EdgeInsets.all(15),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                AppImages.appBg,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 10,
                                    ),
                                    child: Image.asset(
                                      AppImages.appLogo,
                                    ),
                                  ),
                                  PopupMenuButton(
                                    icon: const Icon(
                                      Icons.translate,
                                      color: Colors.white,
                                    ),
                                    itemBuilder: (BuildContext context) =>
                                        <PopupMenuItem<String>>[
                                      PopupMenuItem(
                                        value: "en",
                                        child: const Text(
                                          "English",
                                        ),
                                        onTap: () {
                                          locale.state = const Locale("en");
                                        },
                                      ),
                                      PopupMenuItem(
                                        value: "es",
                                        child: const Text(
                                          "Spanish",
                                        ),
                                        onTap: () {
                                          locale.state = const Locale("es");
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              ListTile(
                                contentPadding: const EdgeInsets.all(5),
                                minVerticalPadding: 0,
                                title: Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 5,
                                  ),
                                  child: Text(
                                    AppLocalizations.of(context)!.signup,
                                    style: AppTypography.typo26WhiteBold,
                                  ),
                                ),
                                subtitle: Text(
                                  AppLocalizations.of(context)!
                                      .signup_description,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    height: 1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // //Below Part

                        const SizedBox(
                          height: 10,
                        ),

                        const Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            "Enter Basic Details",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        CustomTextfield(
                          validator: <FormFieldValidator<String>>[
                            FormBuilderValidators.required(),
                          ],
                          controller: _nameController,
                          title: AppLocalizations.of(context)!.name,
                        ),
                        CustomTextfield(
                          validator: <FormFieldValidator<String>>[
                            FormBuilderValidators.required(),
                            FormBuilderValidators.email(),
                          ],
                          controller: _emailController,
                          title: AppLocalizations.of(context)!.email,
                        ),
                        CustomTextfield(
                          validator: <FormFieldValidator<String>>[
                            FormBuilderValidators.required(),
                            FormBuilderValidators.password(),
                          ],
                          controller: _passController,
                          title: AppLocalizations.of(context)!.password,
                        ),

                        const Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            "Choose Gender & City",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                flex: 2,
                                child: FormBuilderRadioGroup(
                                    decoration: const InputDecoration(
                                      labelStyle: TextStyle(fontSize: 18),
                                      contentPadding: EdgeInsets.zero,
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    // wrapAlignment: WrapAlignment.center,
                                    onChanged: (String? value) {
                                      gender = value;
                                    },
                                    name: "gender",
                                    options: <FormBuilderChipOption<String>>[
                                      FormBuilderChipOption(
                                        value:
                                            AppLocalizations.of(context)!.male,
                                        avatar: const Icon(Icons.female),
                                      ),
                                      FormBuilderChipOption<String>(
                                        value: AppLocalizations.of(context)!
                                            .female,
                                        avatar: const Icon(Icons.male),
                                      ),
                                    ],),
                              ),
                              Expanded(
                                child: FormBuilderDropdown<String>(
                                  initialValue: "Mumbai",
                                  iconDisabledColor: Colors.white,
                                  iconEnabledColor: Colors.white,
                                  dropdownColor: AppColors.primaryColor,
                                  menuMaxHeight: 150,
                                  name: "cities",
                                  decoration: InputDecoration(
                                    fillColor: AppColors.primaryColor,
                                    filled: true,
                                    hintStyle: const TextStyle(
                                      color: Colors.white,
                                    ),
                                    // contentPadding: EdgeInsets.all(0.0),
                                    enabledBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    focusedBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                  ),
                                  items: List.generate(
                                    cities.length,
                                    (int index) => DropdownMenuItem<String>(
                                      value: cities[index],
                                      child: Text(
                                        cities[index],
                                        style: const TextStyle(
                                            color: Colors.white,),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(
                          height: 20,
                        ),

                        GestureDetector(
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              await _firebaseController.signupWithEmail(
                                  _emailController.text,
                                  _passController.text,
                                  context,
                                  _nameController.text,);
                            }
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            alignment: Alignment.center,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                5,
                              ),
                              color: const Color(
                                0xFF6574CF,
                              ),
                            ),
                            child: Text(
                              AppLocalizations.of(context)!.signup,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "OR",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 18,
                                height: 2.5,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            circularIcon(FontAwesomeIcons.google, () async {
                              await _googleLoginController
                                  .signInWithGoogle(context);
                            }),
                            circularIcon(FontAwesomeIcons.facebookF, () async {
                              await _facebookLoginController
                                  .signInWithFacebook(context);
                            }),
                            circularIcon(FontAwesomeIcons.twitter, () async {
                              await _twitterLoginController
                                  .twitterLogin(context);
                            }),
                            circularIcon(FontAwesomeIcons.linkedin, () async {
                              await context.pushRoute(
                                const PageRouteInfo(
                                  AppRoutes.linkedin,
                                ),
                              );
                              // Navigator.pushNamed(context, AppRoutes.linkedin);
                            }),
                          ],
                        ),

                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RichText(
                              text: TextSpan(
                                children: <InlineSpan>[
                                  TextSpan(
                                    text:
                                        "${AppLocalizations.of(context)!.existingAccount} ",
                                    style: const TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  WidgetSpan(
                                    child: GestureDetector(
                                      onTap: () async {
                                        await context.replaceRoute(
                                          const PageRouteInfo(
                                            AppRoutes.signin,
                                          ),
                                        );
                                        // Navigator.pushReplacementNamed(
                                        //     context, AppRoutes.signin);
                                      },
                                      child: Text(
                                        "Sign In",
                                        style: TextStyle(
                                          color: AppColors.primaryColor,
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
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),),
              ),
            );
          },
        ),
      );

}