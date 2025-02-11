import 'dart:developer';
import 'dart:io';

import 'package:agoris_admin/utils/route_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:agoris_admin/common/db_constants.dart';

import 'package:agoris_admin/data/core/api_constants.dart';

import 'package:agoris_admin/data/repositories/auth_repository_impl.dart';
import 'package:agoris_admin/data/repositories/products_repository_impl.dart';

import 'package:agoris_admin/domain/repositories/auth_repository.dart';
import 'package:agoris_admin/domain/repositories/products_repository.dart';

import 'package:agoris_admin/presentation/blocs/auth/auth_bloc.dart';
import 'package:agoris_admin/presentation/blocs/products/products_bloc.dart';

import 'package:agoris_admin/presentation/journeys/auth/login.dart';
import 'package:agoris_admin/presentation/journeys/home/dashboard.dart';
import 'package:agoris_admin/presentation/journeys/home/market_place.dart';

import 'package:agoris_admin/utils/route_middleware.dart';
import 'package:agoris_admin/utils/router.dart';
import 'package:agoris_admin/utils/my_bloc_observer.dart';

import 'package:agoris_admin/di/injector.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';
import 'package:pedantic/pedantic.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

  // setUrlStrategy(PathUrlStrategy()); // Enables path-based URLs

  // unawaited(di.init());
  await(di.init());

  Bloc.observer = MyBlocObserver();

  // final path = await getApplicationDocumentsDirectory();
  // Hive.init(path.path);
  //
  // await Hive.openBox(
  //   DBConstants.appBoxName,
  // );

  runApp(
      MultiRepositoryProvider(
        providers: [
          RepositoryProvider<AuthRepository>(
            create: (_) => AuthRepositoryImpl(dataSource: di.inject()),
          ),
          RepositoryProvider<ProductsRepository>(
            create: (_) => ProductsRepositoryImpl(dataSource: di.inject()),
          )
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<AuthBloc>(
              create: (_) => AuthBloc(repository: di.inject()),
            ),
            BlocProvider<ProductsBloc>(
              create: (_) => ProductsBloc(repository: di.inject()),
            ),
          ],
          child: const AgorisAdmin(),
        ),
      )
  );

}

class AgorisAdmin extends StatefulWidget {

  const AgorisAdmin({Key? key}) : super(key: key);

  @override
  State<AgorisAdmin> createState() => _AgorisAdminState();
}

class _AgorisAdminState extends State<AgorisAdmin> {

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 1328),
      minTextAdapt: true,
      ensureScreenSize: true,
      splitScreenMode: true,
      builder: (_, child){
        return MaterialApp(
          title: "Agoris Admin",
          key: navigatorKey,
          debugShowCheckedModeBanner: false,
          navigatorObservers: [
            AppRouteObserver(
              onNavigationAttempt: (routeName) {
                final authState = context.read<AuthBloc>().state;
                if (authState is! AuthStateAuthenticated && routeName == '/dashboard') {
                  log('Redirecting unauthorized user to login.');
                  return '/login';
                }
                return null;
              },
            ),
          ],
          // navigatorObservers: [
          //   RoutingMiddleware(onNavigationAttempt: (route, previousRoute){
          //     if(route?.settings.name == '/dashboard'){
          //       //intercept and handle unauthorized navigation
          //       log('Attempted to navigate to protected route ==> /dashboard');
          //     }
          //   })
          // ],
          home: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state){
              log('auth state built:\t$state');
              if(state is AuthStateAuthenticated){
                return const Dashboard();
              }
              // return const Login();
              return const Dashboard();
            },
          ),

          // home: Login(),

          // home: Scaffold(
          //   appBar: AppBar(title: Text("Debug Page")),
          //   body: Center(child: Text("This is a debug page")),
          // ),

          onGenerateRoute: AppRouter.generateRoute,
        );
      }
    );
  }

}