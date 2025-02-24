import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:milovet/articles/data/models/artticles_model.dart';
import 'package:milovet/articles/view/widgets/articles_list.dart';
import 'package:milovet/disease/data/models/disease_model.dart';
import 'package:milovet/disease/view/widgets/diseases_list.dart';
import 'package:milovet/shared/color_manager.dart';

class HomeTabOwner extends StatelessWidget {
  HomeTabOwner({super.key});
  List<ArticlesModel> articles = List.generate(
      50,
      (index) => ArticlesModel(
          id: 'id',
          imageUrl:
              'https://img.freepik.com/premium-photo/purple-purple-background-with-text-that-says-no_1239820-105974.jpg',
          description: 'Snakebites kill tens thousands of africans a year.'));
            List<DiseaseModel> diseases = List.generate(
      50,
      (index) => DiseaseModel(
          id: 'id',
          imageUrl:
              'https://img.freepik.com/premium-photo/purple-purple-background-with-text-that-says-no_1239820-105974.jpg',
          description: 'More animal species aregetting COVID-19 for the first time.'));
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      child: SizedBox(
        height: 800.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 25.h),
              child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/chat_with_milo.png'))),
                  width: 358.w,
                  height: 141.h,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 17.h,
                        left: 33.w,
                        child: Column(
                          children: [
                            SizedBox(
                              width: 216.w,
                              height: 54.h,
                              child: Text(
                                'Is Your Pet Feeling Unwell? We’re Here to Help!',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                            ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: ColorManager.white),
                                child: Text(
                                  'Chat with Milo Now!',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        fontWeight: FontWeight.w800,
                                        color: ColorManager.primaryColor,
                                      ),
                                ))
                          ],
                        ),
                      ),
                      PositionedDirectional(
                          end: 23.w,
                          child: Image.asset(
                            'assets/images/person.png',
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
