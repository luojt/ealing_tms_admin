import 'package:ealing_tms_admin/model/tms_type.dart';
import 'package:ealing_tms_admin/provider/home_banner_provider.dart';
import 'package:ealing_tms_admin/provider/home_category_provider.dart';
import 'package:ealing_tms_admin/provider/tms_provider.dart';
import 'package:flutter/material.dart';
import 'component/home_banner_component.dart';
import 'component/home_category_component.dart';

class MyHomePage extends StatefulWidget {
  final TmsProvider tmsProvider;

  const MyHomePage(this.tmsProvider, {Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> slivers = <Widget>[];
  @override
  Widget build(BuildContext context) {
    slivers.clear();

    for (int i = 0; i < widget.tmsProvider.tmsModel.list.length; i++) {
      if (widget.tmsProvider.tmsModel.list[i].type ==
          TmsType.ealingmom_home_banner.name) {
        /// banner provider
        HomeBannerProvider bannerProvider = HomeBannerProvider( widget.tmsProvider.tmsModel.list[i].list,);

        slivers.add(HomeBannerComponent(bannerProvider));
        // slivers.add(SliverToBoxAdapter(child: Container(child: Text("轮播图·"),),));
      } else if (widget.tmsProvider.tmsModel.list[i].type ==
          TmsType.ealingmom_home_icon.name) {
        /// category provider
        HomeCategoryProvider categoryProvider = HomeCategoryProvider(widget.tmsProvider.tmsModel.list[i].list);

        slivers.add(HomeCategoryComponent(categoryProvider));
      }

    }
    return Scaffold(
      body: CustomScrollView(
        slivers: slivers,
      ),
    );
  }
}
