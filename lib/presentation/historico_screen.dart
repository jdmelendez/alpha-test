import 'package:alpha_test/domain/blocs/tickets/tickets_bloc.dart';
import 'package:alpha_test/presentation/shared/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../data/models/ticket.dart';
import '../domain/blocs/tickets/tickets_bloc.dart';
import '../domain/theme/theme.dart';

class HistoricoScreen extends StatelessWidget {
  const HistoricoScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Text('HistoricoScreen'),
          ),
      body: BlocBuilder<TicketsBloc, TicketsState>(
        builder: (context, state) {
          if (state.status == TicketsStatus.loading) {
            return CircularProgressIndicator(
                backgroundColor: AppTheme.greyLight);
          } else if (state.status == TicketsStatus.failure) {
            return Text(
                "No se han podido obtener los tickets de acceso al evento");
          } else {
            return ListView.builder(
              itemCount: state.items.length,
              itemBuilder: (context, index) {
                final Ticket ticket = state.items[index];

                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppTheme.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 4,
                        blurRadius: 5,
                        offset:
                            const Offset(0, 0), // changes position of shadow
                      )
                    ],
                  ),
                  child: Column(children: [
                    Row(
                      children: [
                        const Text(
                          'CÓDIGO: ',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                        Text(ticket.code,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400)),
                        const Spacer(),
                        Text(
                          '${ticket.id.toString().padLeft(2, '0')} ',
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    gapH6,
                    Row(children: [
                      Text(
                        'RESULTADO: ',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: ticket.state == 1
                                ? AppTheme.green
                                : AppTheme.red),
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                        child: Text(
                          ticket.state == 1 ? "ADELANTE" : "ERROR",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: AppTheme.white,
                              fontSize: 11,
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    ]),
                    gapH4,
                    Row(
                      children: [
                        Text(
                          'FECHA: ',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                        Text(
                            ticket.fechaLectura != null
                                ? DateFormat("DD-MM-YYYY")
                                    .format(ticket.fechaLectura!)
                                : '-',
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ]),
                );
              },
            );
          }
        },
      ),
    );
  }
}
