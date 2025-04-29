import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/Global/presentation/components/buttons.dart';
import 'package:to_do_list_app/Global/presentation/components/custom_appbar.dart';
import 'package:to_do_list_app/Global/presentation/provider/system_provider.dart';
import 'package:to_do_list_app/Global/presentation/routes/routes.dart';
import 'package:to_do_list_app/Global/presentation/styles/colors.dart';
import 'package:to_do_list_app/Global/presentation/styles/fonts.dart';
import 'package:to_do_list_app/Global/presentation/styles/properties.dart';

class AddCompanyPage extends StatefulWidget {
  const AddCompanyPage({super.key});

  @override
  State<AddCompanyPage> createState() => _AddCompanyPageState();
}

class _AddCompanyPageState extends State<AddCompanyPage> {
  @override
  Widget build(BuildContext context) {
    final systemProvider = context.watch<SystemProvider>();

    return Scaffold(
      backgroundColor: cWhite,
      appBar: customAppBar(context: context, title: 'Add Company'),
      body: Column(
        children: [
          Center(
            child: Text('Add Company', style: pResaltadoFont),
          ),
          Container(
            width: double.infinity,
            child: CustomButton(
              variant: 'main',
              onPressed: () {
                systemProvider.setIndex(PageRoutes.company);
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  PageRoutes.initial,
                  (Route<dynamic> route) => false,
                );
              },
              child: Flex(
                spacing: medRadius,
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add, color: cWhite),
                  Text('Go menu', style: pTabsBtnsFont.copyWith(color: cWhite)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
