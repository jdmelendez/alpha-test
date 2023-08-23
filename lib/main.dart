import 'package:alpha_test/data/repositories/lecturas_repository.dart';
import 'package:alpha_test/data/repositories/tickets_repository.dart';
import 'package:alpha_test/presentation/home_scren.dart';
import 'package:alpha_test/presentation/scaner/bloc/scaner_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/dio/dio_client.dart';
import 'domain/blocs/tickets/tickets_bloc.dart';
import 'domain/router/router.dart';
import 'domain/theme/theme.dart';
import 'domain/theme/themeData.dart';
import 'presentation/lecturas/lecturas/lecturas_bloc.dart';

void main() async {
  DioClient dio = DioClient();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<TicketsRepository>(
            create: (context) => TicketsRepository()),
        RepositoryProvider<LecturasRepository>(
            create: (context) => LecturasRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
          // Se cargan los tickets al levantar la aplicación
          BlocProvider<TicketsBloc>(
              lazy: false,
              create: (context) =>
                  TicketsBloc(ticketsRepository: TicketsRepository())
                    ..add(TicketsLoad())),
          BlocProvider<LecturasBloc>(
              lazy: false,
              create: (context) =>
                  LecturasBloc(lecturasRepository: LecturasRepository())),
          BlocProvider<ScanerBloc>(
              lazy: false,
              create: (context) => ScanerBloc(
                    lecturasRepository: LecturasRepository(),
                    ticketsRepository: TicketsRepository(),
                  )),
        ],
        child: MaterialApp.router(
          routeInformationProvider: appRouter.routeInformationProvider,
          routeInformationParser: appRouter.routeInformationParser,
          routerDelegate: appRouter.routerDelegate,
          debugShowCheckedModeBanner: false,
          title: 'Alpha',
          theme: themeData,
          builder: (context, child) {
            return child!;
          },
        ),
      ),
    );
  }
}
