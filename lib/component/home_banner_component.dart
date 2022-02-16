import 'package:ealing_tms_admin/model/tms_content_item.dart';
import 'package:ealing_tms_admin/provider/home_banner_provider.dart';
import 'package:ealing_tms_admin/widget/banner_view_widget.dart';
import 'package:ealing_tms_admin/widget/network_image_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class HomeBannerComponent extends StatelessWidget {
  final HomeBannerProvider bannerProvider;

  const HomeBannerComponent(this.bannerProvider);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ChangeNotifierProvider<HomeBannerProvider>(
        create: (context) => bannerProvider,
        child: Consumer<HomeBannerProvider>(
          builder: (_, provider, __) {
            return Container(
              padding: const EdgeInsets.only(
                top: 4,
              ),
              child: ClipRRect(
                child: AspectRatio(
                  aspectRatio: bannerProvider.aspectRatio,
                  child: BannerView(
                    key: bannerProvider.bannerKey,
                    data: bannerProvider.bannerList,
                    itemBuilder: (index, model) {
                      return NetworkRImage(
                        width: 300,
                        imageURL: (model as TMSContentItem).imgUrl,
                      );
                    },

                    // onScrolled: bannerProvider.handleScroll,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
