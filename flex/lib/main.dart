import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:flex/bloc/photo_bloc.dart';
import 'package:flex/infrastruture/repo.dart';
import 'package:flex/view/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:utils/utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );
  HydratedBlocOverrides.runZoned(() => runApp(const MyApp()), storage: storage);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Dio plugin = Dio();
    plugin.interceptors.add(RetryInterceptor(
        dio: plugin,
        logPrint: print,
        retries: 3,
        retryDelays: const [
          Duration(seconds: 1),
          Duration(seconds: 2),
          Duration(seconds: 3)
        ]));

    return RepositoryProvider(
      create: (context) => NasaApiImpl(DioClient(plugin: plugin)),
      child: BlocProvider(
        create: (context) => PhotoBloc(context.read<NasaApiImpl>())
          ..add(const PhotoEvent.retrievePhotos()),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const HomeView(),
        ),
      ),
    );
  }
}
