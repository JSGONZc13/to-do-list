import 'package:flutter/material.dart';
import 'package:to_do_list_app/Company/presentation/add_company.dart';
import 'package:to_do_list_app/Global/presentation/components/buttons.dart';
import 'package:to_do_list_app/Global/presentation/components/cards.dart';
import 'package:to_do_list_app/Global/presentation/styles/colors.dart';
import 'package:to_do_list_app/Global/presentation/styles/fonts.dart';
import 'package:to_do_list_app/Global/presentation/styles/properties.dart';

class CompanyPage extends StatefulWidget {
  const CompanyPage({super.key});

  @override
  State<CompanyPage> createState() => _CompanyPageState();
}

class _CompanyPageState extends State<CompanyPage> {
  bool _hasLoaded = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Solo ejecuta la lógica una vez para evitar múltiples llamados
    if (!_hasLoaded) {
      // Aquí puedes agregar la lógica que deseas ejecutar una sola vez
      _hasLoaded = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cTransparent,
      body: Flex(
        direction: Axis.vertical,
        spacing: medRadius,
        children: [
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                CustomCard(
                  color: cWhiteHover,
                  child: Text(
                    'Company',
                    style: pImportantesFont,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            child: CustomButton(
              variant: 'main',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddCompanyPage(),
                  ),
                );
              },
              child: Flex(
                spacing: medRadius,
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add, color: cWhite),
                  Text('New Company',
                      style: pTabsBtnsFont.copyWith(color: cWhite)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
