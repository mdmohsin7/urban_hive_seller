import 'package:appwrite/appwrite.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class ServiceLocator {
  static void init() {
    sl.registerSingleton<Client>(
      Client()
        ..setProject(dotenv.env['AW_PROJECT_ID'])
        ..setEndpoint("https://cloud.appwrite.io/v1"),
    );
  }
}
