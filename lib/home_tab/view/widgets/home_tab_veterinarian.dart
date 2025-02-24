import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:milovet/articles/data/models/artticles_model.dart';
import 'package:milovet/articles/view/widgets/articles_list.dart';
import 'package:milovet/disease/data/models/disease_model.dart';
import 'package:milovet/disease/view/widgets/diseases_list.dart';

class HomeTabVeterinarian extends StatelessWidget {
  HomeTabVeterinarian({super.key});
  List<ArticlesModel> articles = List.generate(
      50,
      (index) => ArticlesModel(
          id: 'id',
          imageUrl:
              'https://img.freepik.com/premium-photo/purple-purple-background-with-text-that-says-no_1239820-105974.jpg',
          description: 'description'));
            List<DiseaseModel> diseases = List.generate(
      50,
      (index) => DiseaseModel(
          id: 'id',
          imageUrl:
              'https://img.freepik.com/premium-photo/purple-purple-background-with-text-that-says-no_1239820-105974.jpg',
          description: 'description'));
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      child: SizedBox(
        height: 800.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 25.h),
              child: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/chat_with_milo.png'))),
                  width: 358.w,
                  height: 141.h,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 38.h,
                        left: 38.w,
                        child: SizedBox(
                          width: 216.w,
                          child: Text(
                            'A Pet Needs Your Expertise!',
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 20.0.sp
                            )
                          ),
                        )
                      ),
                      PositionedDirectional(
                          end: 23.w,
                          child: Image.asset(
                            'assets/images/doctor.png',
                            height: 140.h,
                            width: 110.w,
                          ))
                    ],
                  )),
            ),
            SizedBox(
              height: 15.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 17.0.w),
                  child: Text(
                    'Popular Articles',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                SizedBox(
                  height: 14.h,
                ),
                SizedBox(height: 245.5.h, child: ArticlesList(articles)),
                SizedBox(
                  height: 15.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 17.0.w),
                  child: Text(
                    'Disease',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 18.0.w),
                  child: SizedBox(
                    height: 285.h,
                    width: 357.w,
                    child: DiseasesList(diseases)),
                )
                  ,
              ], 
            )
          ], 
        ),
      ),
    );
  }
}