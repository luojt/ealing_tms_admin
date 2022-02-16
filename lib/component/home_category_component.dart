import 'package:ealing_tms_admin/provider/home_category_provider.dart';
import 'package:ealing_tms_admin/widget/home_category_body.dart';
import 'package:ealing_tms_admin/widget/scroll_indicator_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeCategoryComponent extends StatelessWidget {
  final HomeCategoryProvider homeCategoryProvider;

  const HomeCategoryComponent(this.homeCategoryProvider);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ChangeNotifierProvider<HomeCategoryProvider>(
        create: (context) => homeCategoryProvider,
        child: Consumer<HomeCategoryProvider>(
          builder: (_, provider, __) {
            return Container(
              padding: const EdgeInsets.only(top: 16),
              child: Column(
                children: [
                  HomeCategoryBody(provider),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
