import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:proximore/utils/constants.dart';
import 'package:proximore/widgets/components/text/text_field.dart';

import 'package:proximore/data_source/auth_service.dart';
import 'package:proximore/widgets/components/buttons/button.dart';
import 'package:flutter_svg/svg.dart';

class ConnexionPage extends StatefulWidget {
  const ConnexionPage({super.key});

  @override
  _ConnexionPageState createState() => _ConnexionPageState();
}

class _ConnexionPageState extends State<ConnexionPage>
    with WidgetsBindingObserver {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> handleLogin() async {
    final email = _emailController.text;
    final password = _passwordController.text;
    final success = await AuthService().login(email, password);
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
        resizeToAvoidBottomInset: true, // Désactiver le comportement par défaut
        body: Container(
          color: Colors.white,
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
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: MediaQuery.of(context).size.height * 0.04,
                          decoration: BoxDecoration(
                            color: Constants.primaryBlue,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: InkWell(
                              onTap: () {
                                context.go('/');
                              },
                              child: const Text(
                                "Se connecter en tant qu'invité",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
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
                          'CONNEXION',
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
                              labelText: "adresse email",
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
                                handleLogin();
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
                                      text: 'VALIDER',
                                      textColor: Constants.secondaryOrange,
                                      onPressed: () {
                                        handleLogin();
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
                        Text(
                          'MOT DE PASSE OUBLIÉ ?',
                          style: TextStyle(color: Constants.secondaryOrange),
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
                          'SE CONNECTER AVEC',
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
                        InkWell(
                          onTap: () {
                            context.go('/signup');
                          },
                          child: Text(
                            "PAS DE COMPTE ? S'INSCRIRE.",
                            style: TextStyle(color: Constants.secondaryOrange),
                          ),
                        ),
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
