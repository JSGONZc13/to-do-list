import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/Company/presentation/provider/company_provider.dart';
import 'package:to_do_list_app/Global/presentation/components/buttons.dart';
import 'package:to_do_list_app/Global/presentation/components/cards.dart';
import 'package:to_do_list_app/Global/presentation/routes/routes.dart';
import 'package:to_do_list_app/Global/presentation/styles/colors.dart';
import 'package:to_do_list_app/Global/presentation/styles/fonts.dart';
import 'package:to_do_list_app/Global/presentation/styles/properties.dart';

class CompanyPage extends StatefulWidget {
  const CompanyPage({super.key});

  @override
  State<CompanyPage> createState() => _CompanyPageState();
}

class _CompanyPageState extends State<CompanyPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final companyProvider = context.read<CompanyProvider>();

    companyProvider.getCompanies();
  }

  @override
  Widget build(BuildContext context) {
    final companyProvider = context.watch<CompanyProvider>();
    return Scaffold(
      backgroundColor: cTransparent,
      body: Flex(
        direction: Axis.vertical,
        spacing: medRadius,
        children: [
          Expanded(
              child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: companyProvider.companiesData.length,
            itemBuilder: (_, i) => CustomCard(
              color: cWhiteInactive,
              child: Flex(
                direction: Axis.vertical,
                spacing: medRadius,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${companyProvider.companiesData[i].name}'),
                  Text('${companyProvider.companiesData[i].address}'),
                ],
              ),
            ),
          )),
          Container(
            width: double.infinity,
            child: CustomButton(
              variant: 'main',
              onPressed: () {
                Navigator.pushNamed(context, PageRoutes.addCompany);
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
