import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'core/data/datasource/configuration/locator.dart';
import 'features/app.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    /// init ScreenUtil For Responsive Design
    ScreenUtil.ensureScreenSize(),
    /// To init Storage
    GetStorage.init()
  ]);

  /// To Register In Git IT
  setupLocator();


  runApp(
    LeafNetApp(),
  );
}

