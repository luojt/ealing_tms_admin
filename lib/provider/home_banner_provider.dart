import 'package:ealing_tms_admin/model/tms_content_item.dart';
import 'package:ealing_tms_admin/utils/object_util.dart';
import 'package:flutter/material.dart';
class HomeBannerProvider with ChangeNotifier {
  List<TMSContentItem> bannerList = <TMSContentItem>[];

  double progress = 0.0;

  double aspectRatio=1.0;

  bool get hasData => bannerList.isNotEmpty;

  Key? bannerKey;
  HomeBannerProvider(List<TMSContentItem> bannerList){
    progress = 0;
    this.bannerList = bannerList;
    bannerKey = hasData ? ObjectKey(bannerList.first) : null;
    // 取第一个 banner 的宽高值作为显示值
    if(ObjectUtil.isNotEmpty(bannerList)) {
      aspectRatio = 3/2;
    }
  }


}
