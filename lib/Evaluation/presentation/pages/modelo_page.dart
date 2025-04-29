import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/Evaluation/presentation/providers/modelo_provider.dart';
import 'package:to_do_list_app/Global/presentation/components/buttons.dart';
import 'package:to_do_list_app/Global/presentation/components/cards.dart';
import 'package:to_do_list_app/Global/presentation/components/generals.dart';
import 'package:to_do_list_app/Global/presentation/styles/colors.dart';
import 'package:to_do_list_app/Global/presentation/styles/fonts.dart';
import 'package:to_do_list_app/Global/presentation/styles/properties.dart';

class ModeloPage extends StatefulWidget {
  const ModeloPage({super.key});

  @override
  State<ModeloPage> createState() => _ModeloPageState();
}

class _ModeloPageState extends State<ModeloPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final modeloProvider = context.read<ModeloProvider>();
      modeloProvider.getModelos();
    });
  }

  @override
  Widget build(BuildContext context) {
    final modeloProvider = context.watch<ModeloProvider>();
    Future<void> _refreshModels() async {
      await modeloProvider.getModelos();
    }

    return Scaffold(
        backgroundColor: cTransparent,
        body: CustomRefreshIndicator(
          onRefresh: _refreshModels,
          child: Flex(
            direction: Axis.vertical,
            spacing: medRadius,
            children: [
              Expanded(
                  child: modeloProvider.getModelosData.length <= 0 &&
                          modeloProvider.getModelosLoading
                      ? Center(child: CustomCircularProgressIndicator())
                      : modeloProvider.getModelosData.length <= 0 &&
                              !modeloProvider.getModelosLoading
                          ? Flex(
                              direction: Axis.vertical,
                              spacing: medRadius,
                              children: [
                                  Center(
                                    child: CustomCard(
                                        color: cWhiteHover,
                                        child: Flex(
                                          spacing: medRadius,
                                          direction: Axis.vertical,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
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
                                                style: pTituloPrincipalFont
                                                    .copyWith(color: cError),
                                              ),
                                            ),
                                            SizedBox(
                                              child: Text(
                                                textAlign: TextAlign.center,
                                                overflow: TextOverflow.visible,
                                                maxLines: null,
                                                softWrap: true,
                                                '${modeloProvider.getModelosMensaje}',
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
                                      style:
                                          pTabsBtnsFont.copyWith(color: cBlack),
                                    ),
                                    onPressed: _refreshModels,
                                  )
                                ])
                          : ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: modeloProvider.getModelosData.length,
                              itemBuilder: (_, i) => CustomCard(
                                  color: cWhiteInactive,
                                  child: Flex(
                                    spacing: smlRadius,
                                    direction: Axis.horizontal,
                                    children: [
                                      Expanded(
                                        child: Flex(
                                          spacing: smlRadius,
                                          direction: Axis.vertical,
                                          children: [
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                '${modeloProvider.getModelosData[i].nombre}',
                                                overflow: TextOverflow.visible,
                                                maxLines: null,
                                                softWrap: true,
                                                style: pImportantesFont,
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                '${modeloProvider.getModelosData[i].descripcion}',
                                                overflow: TextOverflow.visible,
                                                maxLines: null,
                                                softWrap: true,
                                                style: pMinusculoFont,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      CustomIconButton(
                                          variant: 'secondary',
                                          color: cError,
                                          onPressed: () {},
                                          icon: const Icon(Icons.delete))
                                    ],
                                  ))))
            ],
          ),
        ));
  }
}
