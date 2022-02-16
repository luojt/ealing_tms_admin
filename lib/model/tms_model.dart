import 'package:ealing_tms_admin/model/tms_config_model.dart';

///TMS
class TMSModel {
  String id = "";
  String createTime = "";
  String startTime = "";
  String createById = "";
  String deleted = "";
  String tmsName = "";
  String tmsTitle = "";

  ///模版列表
  List<TMSConfigModel> list = <TMSConfigModel>[];
}
