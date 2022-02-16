import 'package:device_preview/device_preview.dart';
import 'package:ealing_tms_admin/provider/tms_provider.dart';
import 'package:ealing_tms_admin/tms_widget.dart';
import 'package:ealing_tms_admin/utils/size_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'model/tms_model.dart';

class AppComponent extends StatelessWidget {
  final TmsProvider tmsProvider;

  const AppComponent(
    this.tmsProvider, {
    Key? key,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: AppSize.designSize,
      builder: () {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          useInheritedMediaQuery: true,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          home: MyHomePage(tmsProvider),
        );
      },
    );
  }
}
