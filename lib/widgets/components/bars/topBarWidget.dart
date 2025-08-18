import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../utils/constants.dart';

class TopBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String pathProfil;

  const TopBarWidget({
    super.key,
    required this.pathProfil,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      backgroundColor: Constants.lightest,
      title: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Image de profil avec padding
            GestureDetector(
              onTap: () {
                context.go('/profil');
              },
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  image: DecorationImage(
                    image: AssetImage(pathProfil),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // Logo au centre
            Expanded(
              child: Center(
                child: Image.asset(
                  Constants.logo,
                  height: 100,
                  width: 100,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            // Bouton paramètres
            IconButton(
              icon: SvgPicture.asset(
                Constants.parameterIcon,
                height: 24,
                width: 24,
              ),
              tooltip: 'Paramètres',
              onPressed: () {
                context.go('/settings');
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
