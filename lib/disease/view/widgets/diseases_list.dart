import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:milovet/disease/data/models/disease_model.dart';
import 'package:milovet/disease/view/widgets/disease_item.dart';

class DiseasesList extends StatelessWidget {
  const DiseasesList(this._diseases, {super.key});
  final List<DiseaseModel> _diseases;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _diseases.length,
      itemBuilder: (_, index) => Padding(
        padding:  EdgeInsets.only(top: 8.0.h, bottom: 8.h),
        child: DiseaseItem(_diseases[index]),
      ),);
  }
}
