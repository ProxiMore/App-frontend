import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:proximore/utils/constants.dart';
import 'package:proximore/widgets/components/buttons/button.dart';
import 'package:proximore/widgets/components/text/text_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> with WidgetsBindingObserver {
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
                              labelText: "adresse email",
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
                              labelColor: Constants.secondaryOrange,
                              labelFloating: false,
                              fillColor: Constants.white,
                              focusedBorderColor: Constants.secondaryOrange,
                              enabledBorderColor: Constants.white,
                              textColor: Constants.secondaryOrange,
                              onFieldSubmitted: (value) {
                                print("Mot de passe soumis: $value");
                              },
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
                              labelText: "Confirmation mot de passe",
                              labelColor: Constants.secondaryOrange,
                              labelFloating: false,
                              fillColor: Constants.white,
                              focusedBorderColor: Constants.secondaryOrange,
                              enabledBorderColor: Constants.white,
                              textColor: Constants.secondaryOrange,
                              onFieldSubmitted: (value) {
                                print("Mot de passe soumis: $value");
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
                                        // ignore: avoid_print
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
                                        context.go('/');
                                        // ignore: avoid_print
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
