
import 'package:ealing_tms_admin/model/tms_content_item.dart';

///模版模型
class TMSConfigModel{

  TMSConfigModel({this.name="", this.type=""});
  String name = "";
  String type = "";

  List<TMSContentItem> list = <TMSContentItem>[];


}
