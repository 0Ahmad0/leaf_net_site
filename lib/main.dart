import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'features/app.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    /// init ScreenUtil For Responsive Design
    ScreenUtil.ensureScreenSize()
  ]);
  runApp(
    LeafNetApp(),
  );
}
