import 'package:alpha_test/presentation/lecturas/widgets/lectura_card.dart';
import 'package:alpha_test/presentation/shared/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../data/models/lectura.dart';

import '../../domain/theme/theme.dart';
import 'bloc/lecturas_bloc.dart';

class LecturasHistoricoScreen extends StatefulWidget {
  const LecturasHistoricoScreen({Key? key}) : super(key: key);

  @override
  State<LecturasHistoricoScreen> createState() =>
      _LecturasHistoricoScreenState();
}

class _LecturasHistoricoScreenState extends State<LecturasHistoricoScreen> {
  @override
  void initState() {
    context.read<LecturasBloc>().add(LecturasLoad());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Text('LecturasHistoricoScreen'),
          ),
      body: BlocBuilder<LecturasBloc, LecturasState>(
        builder: (context, state) {
          if (state.status == LecturasStatus.loading) {
            return const CircularProgressIndicator(
                backgroundColor: AppTheme.greyLight);
          } else if (state.status == LecturasStatus.failure) {
            return const Center(
                child: Text("No se han podido obtener las lecturas."));
          } else {
            if (state.items.isEmpty) {
              return const Center(child: Text("No hay lecturas"));
            }

            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                gapH12,
                Flexible(
                  child: ListView.builder(
                    itemCount: state.items.length,
                    itemBuilder: (context, index) {
                      final Lectura lectura = state.items[index];

                      return Lectura_card(lectura: lectura);
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
