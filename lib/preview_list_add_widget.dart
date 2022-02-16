import 'package:ealing_tms_admin/model/tms_config_model.dart';
import 'package:ealing_tms_admin/provider/tms_provider.dart';
import 'package:flutter/material.dart';

import 'model/tms_content_item.dart';
import 'model/tms_type.dart';

class PreviewListAddWidget extends StatelessWidget {
  final TmsProvider tmsProvider;

  const PreviewListAddWidget(this.tmsProvider, {Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("编辑列表区域"),
        TextButton(
          onPressed: () {


            showDialog<Null>(
              context: context,
              builder: (BuildContext context) {
                return SimpleDialog(
                  title: Text('选择'),
                  children: <Widget>[
                    SimpleDialogOption(
                      child: Text('首页轮播图'),
                      onPressed: () {
                        TMSConfigModel tm = TMSConfigModel(name: "首页轮播图",type:TmsType.ealingmom_home_banner.name);
                        tm.list.add(TMSContentItem("", "name", "", "", "https://imgcdn.ealingbox.com/static/2022/1/10/CA2E7FCD0234EE6E.jpg"));
                        tmsProvider.tmsModel.list.add(tm);
                        tmsProvider.updateSelected(tmsProvider.tmsModel.list.length-1);
                        Navigator.of(context).pop();
                      },
                    ),
                    SimpleDialogOption(
                      child: Text('首页分类'),
                      onPressed: () {
                        TMSConfigModel tm = TMSConfigModel(name: "首页分类",type:TmsType.ealingmom_home_icon.name);
                        tm.list.add(TMSContentItem("", "name", "", "", "https://imgcdn.ealingbox.com/static/2022/1/6/4BF8F0FA695FC002.png"));
                        tmsProvider.tmsModel.list.add(tm);
                        tmsProvider.updateSelected(tmsProvider.tmsModel.list.length-1);
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );


            },
          child: Text("新增"),
        ),
        Expanded(
          child: Container(
            width: 300,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    tmsProvider.updateSelected(index);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    color: tmsProvider.selected == index
                        ? Colors.red
                        : Colors.white,
                    height: 50,
                    child: Text(
                      tmsProvider.tmsModel.list[index].name,
                      style: TextStyle(
                        color: tmsProvider.selected == index
                            ? Colors.white
                            : Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ),
                );
              },
              itemCount: tmsProvider.tmsModel.list.length,
            ),
          ),
        ),
      ],
    );
  }
}
