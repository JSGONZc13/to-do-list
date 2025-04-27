import 'package:flutter/material.dart';
import 'package:to_do_list_app/Global/presentation/components/custom_appbar.dart';
import 'package:to_do_list_app/Global/presentation/styles/colors.dart';
import 'package:to_do_list_app/Global/presentation/styles/fonts.dart';

class AddCompanyPage extends StatefulWidget {
  const AddCompanyPage({super.key});

  @override
  State<AddCompanyPage> createState() => _AddCompanyPageState();
}

class _AddCompanyPageState extends State<AddCompanyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhite,
      appBar: customAppBar(context: context, title: 'Add Company'),
      body: Center(
        child: Text('Add Company', style: pResaltadoFont),
      ),
    );
  }
}
