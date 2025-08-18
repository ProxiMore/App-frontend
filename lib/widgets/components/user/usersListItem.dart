import 'package:flutter/material.dart';
import 'package:proximore/utils/constants.dart';

class UsersListItem extends StatelessWidget {
  final String imagePath;
  final String nom;
  final String prenom;
  final VoidCallback? onMessage;

  const UsersListItem({
    Key? key,
    required this.imagePath,
    required this.nom,
    required this.prenom,
    this.onMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Image à gauche
          Container(
            width: 60.0,
            height: 60.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 12.0),
          // Texte titre et auteur
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nom,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  prenom,
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          // Icônes à droite
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.message),
                onPressed: onMessage ?? () {},
                color: Constants.primaryBlue,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
