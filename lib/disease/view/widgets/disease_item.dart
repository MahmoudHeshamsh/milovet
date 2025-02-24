import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:milovet/disease/data/models/disease_model.dart';
import 'package:milovet/shared/color_manager.dart';

class DiseaseItem extends StatelessWidget {
  const DiseaseItem(this._diseaseModel, {super.key});
  final DiseaseModel _diseaseModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110.0.h,
      width: 356.91.w,
      decoration: BoxDecoration(
        color: ColorManager.primaryColor,
        borderRadius: BorderRadius.circular(25.sp),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25.0.sp),
            child: Image.network(
              _diseaseModel.imageUrl,
              height: 110.h,
              width: 160.32.w,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 21.w),
            child: SizedBox(
              height: 69.h,
              width: 164.w,
              child: Center(
                child: Text(
                  _diseaseModel.description,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 12.5.sp,
                        fontWeight: FontWeight.w400,
                      ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
