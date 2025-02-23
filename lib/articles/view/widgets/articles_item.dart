import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:milovet/articles/data/models/artticles_model.dart';
import 'package:milovet/shared/color_manager.dart';

class ArticlesItem extends StatelessWidget {
  ArticlesItem(this.article,{super.key});
  ArticlesModel article;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 264.h,
      width: 215.w,
      decoration: BoxDecoration(
        color: ColorManager.primaryColor,
        borderRadius: BorderRadius.circular(25.sp),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25.0),
            child: Image.network(
              article.imageUrl,
              width: 214.w,
              height: 185.h,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(height: 15.h,),
          Padding(
            padding: EdgeInsets.only(left: 14.w),
            child: SizedBox(
              height: 36.11.h,
              //width: 178.29.w,
              child: Text(
                article.description,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 12.5.sp,
                  fontWeight: FontWeight.w400,
                ),
                ),
            ),
          ),
        ],
      ),
    );
  }
}
