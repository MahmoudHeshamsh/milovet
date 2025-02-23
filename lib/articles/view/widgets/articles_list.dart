import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:milovet/articles/data/models/artticles_model.dart';
import 'package:milovet/articles/view/widgets/articles_item.dart';

class ArticlesList extends StatelessWidget {
  ArticlesList(this._articles,{super.key});
  List<ArticlesModel> _articles;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: _articles.length,
      itemBuilder: (_, index) => Padding(
        padding:  EdgeInsets.only(right: 14.0.w, left: 14.w),
        child: ArticlesItem(_articles[index]),
      ),);
  }
}
