import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:proximore/utils/constants.dart';
import 'package:proximore/widgets/components/buttons/button.dart';
import 'package:proximore/widgets/components/text/text_field.dart';

import 'package:proximore/data_source/auth_service.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> with WidgetsBindingObserver {
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> handleRegister() async {
    final nom = _nomController.text;
    final email = _emailController.text;
    final password = _passwordController.text;

    final success = await AuthService().register(nom, email, password);
    if (success) {
      print('Logged in! User ID: ${AuthService().userId}');
      context.go('/');
    } else {
      print('Login failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset:
            false, // Désactiver le comportement par défaut
        body: Container(
          color: Constants.primaryBeige,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: Column(
                      children: [
                        Image(
                          width: MediaQuery.of(context).size.width * 0.6,
                          image: AssetImage(Constants.logo),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.6,
                  decoration: BoxDecoration(
                    color: Constants.primaryBlue,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'INSCRIPTION',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                            height:
                                (MediaQuery.of(context).size.height * 0.02)),
                        FractionallySizedBox(
                          widthFactor: 0.75,
                          child: SizedBox(
                            height: (MediaQuery.of(context).size.height * 0.05),
                            child: UITextField(
                              labelText: "Nom",
                              controller: _nomController,
                              labelColor: Constants.secondaryOrange,
                              labelFloating: false,
                              fillColor: Constants.white,
                              focusedBorderColor: Constants.secondaryOrange,
                              enabledBorderColor: Constants.white,
                              textColor: Constants.secondaryOrange,
                              onFieldSubmitted: (value) {},
                            ),
                          ),
                        ),
                        SizedBox(
                            height:
                                (MediaQuery.of(context).size.height * 0.02)),
                        FractionallySizedBox(
                          widthFactor: 0.75,
                          child: SizedBox(
                            height: (MediaQuery.of(context).size.height * 0.05),
                            child: UITextField(
                              labelText: "Adresse email",
                              controller: _emailController,
                              labelColor: Constants.secondaryOrange,
                              labelFloating: false,
                              fillColor: Constants.white,
                              focusedBorderColor: Constants.secondaryOrange,
                              enabledBorderColor: Constants.white,
                              textColor: Constants.secondaryOrange,
                              onFieldSubmitted: (value) {},
                            ),
                          ),
                        ),
                        SizedBox(
                            height:
                                (MediaQuery.of(context).size.height * 0.02)),
                        FractionallySizedBox(
                          widthFactor: 0.75,
                          child: SizedBox(
                            height: (MediaQuery.of(context).size.height * 0.05),
                            child: UITextField(
                              labelText: "Mot de passe",
                              controller: _passwordController,
                              labelColor: Constants.secondaryOrange,
                              labelFloating: false,
                              fillColor: Constants.white,
                              focusedBorderColor: Constants.secondaryOrange,
                              enabledBorderColor: Constants.white,
                              textColor: Constants.secondaryOrange,
                              onFieldSubmitted: (value) {
                                handleRegister();
                                print("Mot de passe soumis");
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                            height:
                                (MediaQuery.of(context).size.height * 0.02)),
                        FractionallySizedBox(
                          widthFactor: 0.60,
                          child: SizedBox(
                              height:
                                  (MediaQuery.of(context).size.height * 0.05),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: UIButton(
                                      text: 'ANNULER',
                                      backgroundColor:
                                          Constants.secondaryOrange,
                                      textColor: Constants.white,
                                      onPressed: () {
                                        context.go('/connexion');
                                        print('Action du boutton ANNULER');
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                      width: (MediaQuery.of(context)
                                              .size
                                              .width *
                                          0.03)), // Espacement entre les boutons
                                  Expanded(
                                    child: UIButton(
                                      text: 'VALIDER',
                                      textColor: Constants.secondaryOrange,
                                      onPressed: () {
                                        handleRegister();
                                        print('Action du boutton VALIDER');
                                      },
                                    ),
                                  ),
                                ],
                              )),
                        ),
                        SizedBox(
                            height:
                                (MediaQuery.of(context).size.height * 0.02)),
                        Container(
                          width: (MediaQuery.of(context).size.width * 0.75),
                          height: 1,
                          color: Constants.white,
                        ),
                        SizedBox(
                            height:
                                (MediaQuery.of(context).size.height * 0.02)),
                        Text(
                          "S'INSCRIRE AVEC",
                          style: TextStyle(color: Constants.secondaryOrange),
                        ),
                        SizedBox(
                            height:
                                (MediaQuery.of(context).size.height * 0.02)),
                        FractionallySizedBox(
                            widthFactor: 0.60,
                            child: SizedBox(
                                child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: SvgPicture.asset(Constants.google,
                                      colorFilter: const ColorFilter.mode(
                                        Colors.white,
                                        BlendMode.srcIn,
                                      )),
                                ),
                                SizedBox(
                                    width: (MediaQuery.of(context).size.width *
                                        0.03)),
                                Expanded(
                                  child: SvgPicture.asset(Constants.facebook,
                                      colorFilter: const ColorFilter.mode(
                                        Colors.white,
                                        BlendMode.srcIn,
                                      )),
                                ),
                                SizedBox(
                                    width: (MediaQuery.of(context).size.width *
                                        0.03)),
                                Expanded(
                                  child: SvgPicture.asset(Constants.apple,
                                      colorFilter: const ColorFilter.mode(
                                        Colors.white,
                                        BlendMode.srcIn,
                                      )),
                                ),
                              ],
                            ))),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
