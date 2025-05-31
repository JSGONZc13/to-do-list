import 'package:flutter/material.dart';
import 'package:to_do_list_app/Global/presentation/components/buttons.dart';
import 'package:to_do_list_app/Global/presentation/components/cards.dart';
import 'package:to_do_list_app/Global/presentation/styles/colors.dart';
import 'package:to_do_list_app/Global/presentation/styles/fonts.dart';
import 'package:to_do_list_app/Global/presentation/styles/properties.dart';

class ErrorResponse extends StatelessWidget {
  const ErrorResponse({
    super.key,
    required this.errorMessage,
    this.onPressed,
  });

  final String errorMessage;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Flex(direction: Axis.vertical, spacing: medRadius, children: [
      Center(
        child: CustomCard(
            color: cWhiteHover,
            child: Flex(
              spacing: medRadius,
              direction: Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error_outline,
                  size: xxlRadius,
                  color: cError,
                ),
                SizedBox(
                  child: Text(
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.visible,
                    maxLines: null,
                    softWrap: true,
                    '¡Error!',
                    style: pTituloPrincipalFont.copyWith(color: cError),
                  ),
                ),
                SizedBox(
                  child: Text(
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.visible,
                    maxLines: null,
                    softWrap: true,
                    '${errorMessage}',
                    style: pBaseFont,
                  ),
                )
              ],
            )),
      ),
      CustomButton(
        variant: 'secondary',
        child: Text(
          'Volver a intentar',
          style: pTabsBtnsFont.copyWith(color: cBlack),
        ),
        onPressed: onPressed,
      )
    ]);
  }
}
