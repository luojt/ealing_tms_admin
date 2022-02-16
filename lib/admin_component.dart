import 'package:device_preview/device_preview.dart';
import 'package:ealing_tms_admin/app_component.dart';
import 'package:ealing_tms_admin/preview_list_add_widget.dart';
import 'package:ealing_tms_admin/provider/tms_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'edit_area_widget.dart';

class AdminComponent extends StatelessWidget {
  const AdminComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider<TmsProvider>(
        create: (context) => TmsProvider(context: context),
        child: Consumer<TmsProvider>(
          builder: (_, provider, __) {
            return Row(
              children: [
                SizedBox(
                  width: 1080,
                  child: DevicePreview(
                    enabled: true,
                    builder: (context) =>
                        AppComponent(provider), // Wrap your app
                  ),
                ),
                Expanded(
                  child: Material(
                    child: SizedBox(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          PreviewListAddWidget(provider),
                          Expanded(
                            child: EditAreaWidget(provider),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

              ],
            );
          },
        ),
      ),
    );
  }
}
