import 'dependency_injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

GetIt getIt = GetIt.instance;

@InjectableInit()
Future<void> configuteInjection() async {
  getIt.init(environment: Environment.prod);
}
