import 'package:ealing_tms_admin/model/tms_content_item.dart';
import 'package:ealing_tms_admin/provider/tms_provider.dart';
import 'package:ealing_tms_admin/widget/network_image_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'model/tms_config_model.dart';
import 'model/tms_type.dart';

class EditAreaWidget extends StatelessWidget {
  final TmsProvider tmsProvider;

  const EditAreaWidget(this.tmsProvider, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TMSConfigModel tmsConfigModel =
        tmsProvider.tmsModel.list[tmsProvider.selected];

    if (tmsConfigModel.type == TmsType.ealingmom_home_banner.name) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text("编辑区"),
          TextButton(
            onPressed: () {
              tmsConfigModel.list.add(TMSContentItem("", "", "", "", "https://imgcdn.ealingbox.com/static/2022/1/10/501FC16065895F94.jpg"));
              tmsProvider.updateConfigModel(tmsConfigModel);
            },
            child: Text("新增"),
          ),
          Expanded(
            child: Container(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 50),
                        child: Row(
                          children: [
                            const Text(
                              "name:",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              tmsConfigModel.list[index].name,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            const Text(
                              "link:",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              tmsConfigModel.list[index].jumpUrl,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      NetworkRImage(
                        width: 300,
                        imageURL: tmsConfigModel.list[index].imgUrl,
                      ),
                    ],
                  );
                },
                itemCount: tmsConfigModel.list.length,
              ),
            ),
          ),
        ],
      );
    } else if (tmsConfigModel.type == TmsType.ealingmom_home_icon.name) {
      return Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text("编辑区"),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    tmsConfigModel.list.add(TMSContentItem("", "name", "", "", "https://imgcdn.ealingbox.com/static/2022/1/6/4BF8F0FA695FC002.png"));
                    tmsProvider.updateConfigModel(tmsConfigModel);
                  },
                  child: Text("新增"),
                ),
                TextButton(
                  onPressed: () {
                    tmsProvider
                        .updateConfigModel(tmsConfigModel);
                  },
                  child: Text("确定"),
                ),
              ],
            ),
            Expanded(
              child: Container(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 50,
                                child: Text(
                                  "name:",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.only(right: 50),
                                  height: 48,
                                  decoration: BoxDecoration(
                                      //设置上下左右四个边框样式
                                      border: Border.all(
                                        color: Colors.black, //边框颜色
                                        width: 2.0, //边框粗细
                                      ),
                                      color: Colors.white,
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(4)),
                                  child: CupertinoTextField(
                                    textAlignVertical: TextAlignVertical.center,
                                    placeholderStyle: const TextStyle(
                                        color: Colors.black, fontSize: 14),
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      height: 1.2,
                                    ),
                                    keyboardType: TextInputType.text,
                                    decoration: null,
                                    cursorColor: Colors.blue,
                                    maxLength: 15,
                                    controller: TextEditingController(
                                        text: tmsConfigModel.list[index].name),
                                    onChanged: (value) {
                                      tmsConfigModel.list[index].name = value;

                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 50,
                                child: Text(
                                  "link:",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.only(right: 50),
                                  height: 48,
                                  decoration: BoxDecoration(
                                      //设置上下左右四个边框样式
                                      border: Border.all(
                                        color: Colors.black, //边框颜色
                                        width: 2.0, //边框粗细
                                      ),
                                      color: Colors.white,
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(4)),
                                  child: CupertinoTextField(
                                    textAlignVertical: TextAlignVertical.center,
                                    placeholderStyle: const TextStyle(
                                        color: Colors.black, fontSize: 14),
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      height: 1.2,
                                    ),
                                    keyboardType: TextInputType.text,
                                    decoration: null,
                                    cursorColor: Colors.blue,
                                    maxLength: 15,
                                    controller: TextEditingController(
                                        text:
                                            tmsConfigModel.list[index].jumpUrl),
                                    onChanged: (value) {
                                      tmsConfigModel.list[index].jumpUrl =
                                          value;

                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 50,
                                child: Text(
                                  "image:",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              NetworkRImage(
                                width: 100,
                                height: 100,
                                imageURL: tmsConfigModel.list[index].imgUrl,
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                  itemCount: tmsConfigModel.list.length,
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return Container(
        color: Colors.blue,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: const [
            Text("编辑区"),
            Text("name"),
            Text("link"),
          ],
        ),
      );
    }
  }
}
