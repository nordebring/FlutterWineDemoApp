import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oktoast/oktoast.dart';
import 'config/router/app_router.dart';
import 'config/themes/app_theme.dart';
import 'domain/repositories/api_repository.dart';
import 'locator.dart';
import 'presentation/cubits/remote/remote_login_cubit.dart';
import 'presentation/cubits/remote/remote_openai_cubit.dart';
import 'presentation/cubits/remote/remote_wines_cubit.dart';
import 'utils/constants/strings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => RemoteLoginCubit(
                  locator<ApiRepository>(),
                )),
        BlocProvider(
          create: (context) => RemoteWinesCubit(
            locator<ApiRepository>(),
          )..getMyWines(),
        ),
        BlocProvider(
          create: (context) => RemoteOpenAiCubit(
            locator<ApiRepository>(),
          ),
        )
      ],
      child: OKToast(
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerDelegate: appRouter.delegate(),
          routeInformationParser: appRouter.defaultRouteParser(),
          title: appTitle,
          theme: AppTheme.light,
        ),
      ),
    );
  }
}
