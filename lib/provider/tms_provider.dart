
import 'package:ealing_tms_admin/model/tms_config_model.dart';
import 'package:ealing_tms_admin/model/tms_content_item.dart';
import 'package:ealing_tms_admin/model/tms_model.dart';
import 'package:ealing_tms_admin/model/tms_type.dart';
import 'package:flutter/cupertino.dart';


class TmsProvider with ChangeNotifier {
  TMSModel tmsModel = TMSModel();

  /// 上下文
  BuildContext context;

  TmsProvider({required this.context}){
    tmsModel.tmsName = "首页";

    TMSConfigModel tmsConfigModel = TMSConfigModel();
    tmsConfigModel.name = "首页轮播图";
    tmsConfigModel.type = TmsType.ealingmom_home_banner.name;
    tmsConfigModel.list = <TMSContentItem>[];
    tmsConfigModel.list.add(TMSContentItem("", "", "", "",
        "https://imgcdn.ealingbox.com/static/2022/1/10/501FC16065895F94.jpg"));
    tmsConfigModel.list.add(TMSContentItem("", "", "", "",
        "https://imgcdn.ealingbox.com/static/2022/1/11/1D1F53D93155F243.jpg"));
    tmsConfigModel.list.add(TMSContentItem("", "", "", "",
        "https://imgcdn.ealingbox.com/static/2022/1/10/CA2E7FCD0234EE6E.jpg"));
    tmsModel.list.add(tmsConfigModel);

    TMSConfigModel tmsConfigModel2 = TMSConfigModel();
    tmsConfigModel2.name = "首页分类";
    tmsConfigModel2.type = TmsType.ealingmom_home_icon.name;
    tmsConfigModel2.list = <TMSContentItem>[];
    tmsConfigModel2.list.add(TMSContentItem("", "Check In", "", "",
        "https://imgcdn.ealingbox.com/static/2021/11/22/8FDBEBCF1B91048F.gif"));
    tmsConfigModel2.list.add(TMSContentItem("", "New Arrivals", "", "",
        "https://imgcdn.ealingbox.com/static/2022/1/6/4BF8F0FA695FC002.png"));
    tmsConfigModel2.list.add(TMSContentItem("", "Best Sellers", "", "",
        "https://imgcdn.ealingbox.com/static/2022/1/6/1345125D30DBBC7C.png"));
    tmsConfigModel2.list.add(TMSContentItem("", "Free Shipping", "", "",
        "https://imgcdn.ealingbox.com/static/2022/1/6/0404E0FA331BCAA1.png"));
    tmsModel.list.add(tmsConfigModel2);

  }

  int selected = 0;

  updateSelected(int selected){
   this.selected = selected;
   notifyListeners();
  }

  updateConfigModel(TMSConfigModel tmsConfigModel){
    tmsModel.list[selected] = tmsConfigModel;
    notifyListeners();
  }

}