import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/main.dart';

class HiveMethods {

  void handleHive(BuildContext context,  detailes) {
    List<dynamic> moviesList = myBox!.get("key3", defaultValue: []);
    
    // تحقق إذا كان العنصر موجود مسبقاً
    bool isExist = moviesList.any((item) => item["id"] == detailes.id.toString());

    if (isExist) {
      // عرض دايلوج تأكيد الحذف
      AwesomeDialog(
        context: context,
        dialogType: DialogType.question,
        animType: AnimType.rightSlide,
        title: 'عنصر موجود مسبقاً',
        desc: 'هل تريد حذف هذا العنصر من المفضلة؟',
        btnCancelText: 'لا',
        btnOkText: 'نعم',
        btnCancelOnPress: () {},
        btnOkOnPress: () {
          // حذف العنصر من القائمة
          moviesList.removeWhere((item) => item["id"] == detailes.id.toString());
          myBox!.put("key3", moviesList);
          
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('تم الحذف من المفضلة'),
              duration: Duration(seconds: 2),
            ),
          );
        },
      )..show();
    } else {
      // إضافة العنصر الجديد
      moviesList.add({
    "id": detailes.id.toString(),
    "name": detailes.name,
    // "vote_average": detailes.voteAverage.toString(), // تعديل الاسم هنا
    // "original_language": detailes.original_language,
    // "overview": detailes.overview,
    "poster_path": detailes.profile_path,
  });
      
      myBox!.put("key3", moviesList);
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('تم الإضافة إلى المفضلة'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }
}