import 'package:ealing_tms_admin/model/tms_content_item.dart';
import 'package:ealing_tms_admin/provider/home_category_provider.dart';
import 'package:flutter/material.dart';
import 'edge_insets_button_widget.dart';
import 'network_image_widget.dart';

class HomeCategoryItem extends StatelessWidget {
  final TMSContentItem model;

  final VoidCallback onPressed;
  final HomeCategoryProvider categoryProvider;
  HomeCategoryItem(this.categoryProvider,{required this.model, required this.onPressed});


  @override
  Widget build(BuildContext context) {
    return Container(
      width: categoryProvider.itemWidth,
      child: EdgeInsetsButton(
        image: NetworkRImage(
          width: categoryProvider.itemImageWidth,
          height: categoryProvider.itemImageWidth,
          imageURL: model.imgUrl,
        ),
        space: categoryProvider.itemContentSpace,
        text: Text(
          model.name,
          style: categoryProvider.textStyle,
          maxLines: 2,
          textAlign: TextAlign.center,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
