import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../data/models/lectura.dart';
import '../../../domain/theme/theme.dart';
import '../../shared/constants/sizes.dart';

class Lectura_card extends StatelessWidget {
  const Lectura_card({
    super.key,
    required this.lectura,
  });

  final Lectura lectura;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppTheme.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 4,
            blurRadius: 5,
            offset: const Offset(0, 0), // changes position of shadow
          )
        ],
      ),
      child: Column(children: [
        Row(
          children: [
            const Text(
              'CÓDIGO: ',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            Text(lectura.code,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
            const Spacer(),
            Text(
              '${lectura.id.toString().padLeft(2, '0')} ',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
          ],
        ),
        gapH6,
        Row(children: [
          Text(
            'RESULTADO: ',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: lectura.isOk == 1 ? AppTheme.green : AppTheme.red),
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
            child: Text(
              lectura.isOk == 1 ? "ADELANTE" : "ERROR",
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
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            Text(DateFormat("dd-MM-yyyy").format(lectura.fecha),
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
          ],
        ),
      ]),
    );
  }
}
