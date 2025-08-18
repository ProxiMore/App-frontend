import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:proximore/utils/constants.dart';
import 'package:proximore/widgets/components/buttons/icon_button.dart';

class NewTextPage extends StatelessWidget {
  const NewTextPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController bodyController = TextEditingController();

    return Scaffold(
      backgroundColor: Constants.lightest,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Column(
            children: [
              TopBar(),
              const SizedBox(height: 30),
              // 🧻 TITLE TEXT INPUT 🧻
              TextField(
                controller: titleController,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  color: Constants.primaryBlue,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Ajouter un titre",
                ),
              ),
              const SizedBox(height: 20),
              // 🧻 BODY TEXT INPUT 🧻
              Expanded(
                child: TextField(
                  controller: bodyController,
                  // Lignes illimitées
                  maxLines: null,
                  // Prend toute la hauteur disponible
                  expands: true,
                  textAlignVertical: TextAlignVertical.top,
                  keyboardType: TextInputType.multiline,
                  style: const TextStyle(
                    fontFamily: 'Paralucent',
                    fontSize: 16,
                    color: Constants.primaryBlue,
                  ),
                  decoration: const InputDecoration(
                    alignLabelWithHint: true,
                    border: InputBorder.none,
                    hintText: "Rédigez votre texte ici...",
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

class TopBar extends StatelessWidget {
  const TopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            UIIconButton(
              icon: Constants.closeIcon,
              color: Constants.primaryBlue,
              size: 28,
              callback: () {
                context.pop();
              },
            ),
            Image(
              width: 160,
              image: AssetImage(Constants.logo),
            ),
            UIIconButton(
              icon: Constants.validationIcon,
              color: Constants.primaryBlue,
              size: 28,
              callback: () {
                context.pop();
              },
            ),
          ],
        ),
        Text(
          'Éditeur de texte',
          style: TextStyle(
            fontSize: 16,
            color: Constants.primaryBlue,
          ),
        ),
      ],
    );
  }
}
