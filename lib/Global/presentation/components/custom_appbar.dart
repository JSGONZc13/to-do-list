import 'package:flutter/material.dart';
import 'package:to_do_list_app/Global/presentation/styles/colors.dart';
import 'package:to_do_list_app/Global/presentation/styles/fonts.dart';

PreferredSizeWidget customAppBar(
    {required BuildContext context, required String title}) {
  return AppBar(
    leading: Navigator.canPop(context)
        ? IconButton(
            icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        : null,
    title: Text(
      title,
      style: pTituloPrincipalFont,
    ),
    backgroundColor: cWhite, // si quieres definirlo también
    surfaceTintColor: cWhite,
    elevation: 0, // sin sombra, opcional
  );
}
