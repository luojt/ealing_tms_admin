import 'package:ealing_tms_admin/model/tms_content_item.dart';
import 'package:ealing_tms_admin/provider/home_category_provider.dart';
import 'package:flutter/material.dart';

import 'home_category_item.dart';

class HomeCategoryBody extends StatelessWidget {
  HomeCategoryProvider categoryProvider;
  HomeCategoryBody(this.categoryProvider);
  @override
  Widget build(BuildContext context) {
    List<TMSContentItem> categoryList = categoryProvider.categoryList;
    return Container(
      height: categoryProvider.sectionHeight,
      child: ListView.separated(
        padding: EdgeInsets.fromLTRB(
          categoryProvider.sectionMargin,
          0,
          categoryProvider.sectionMargin,
          0,
        ),
        key: categoryProvider.categoryKey,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) =>
            SizedBox(width: categoryProvider.itemSpace),
        itemBuilder: (context, index) {
          TMSContentItem model = categoryList[index];
          return Container(
            child: HomeCategoryItem(
              categoryProvider,
              model: model,
              onPressed: () => null,
            ),
          );
        },
        itemCount: categoryList.length,
      ),
    );
  }
}
