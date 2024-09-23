import 'package:flutter/material.dart';
import 'package:jaifulfood_k6/page/data/allfooddata.dart';
import 'package:jaifulfood_k6/page/favoriteProvide.dart';
import 'package:provider/provider.dart';

class FoodWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Food List')),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: List.generate(Food.foods.length, (index) {
              String food = Food.foods[index];
              bool isFavorite = favoriteProvider.isFavorite(food);

              return InkWell(
                onTap: () {},
                child: Container(
                  width:
                      MediaQuery.of(context).size.width / 1.0, // ปรับให้เหมาะสม
                  height: MediaQuery.of(context).size.height / 4.5,
                  margin: EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10), // เพิ่มระยะห่างแนวนอนและแนวตั้ง
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        blurRadius: 4,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Padding(
                    // เพิ่ม Padding เพื่อเว้นระยะห่างภายใน Container
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          child: Image.asset(
                            "assets/${food}.jpg", // ใช้ข้อมูลจากคลาส Food
                            height: 120,
                            width: MediaQuery.of(context).size.width / 1.4,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    food, // ใช้ข้อมูลจากคลาส Food
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    Food.typefood[
                                        index], // ใช้ข้อมูลจากคลาส Food
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black45,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Color(0xFFFF2F08),
                                        size: 20,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        Food.review1[
                                            index], // ใช้ข้อมูลจากคลาส Food
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        Food.review2[
                                            index], // ใช้ข้อมูลจากคลาส Food
                                        style: TextStyle(
                                          color: Colors.black45,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Row(
                                      children: [
                                        IconButton(
                                          icon: Icon(
                                            isFavorite
                                                ? Icons.favorite
                                                : Icons.favorite_border,
                                            color: Colors.red,
                                          ),
                                          onPressed: () {
                                            if (isFavorite) {
                                              favoriteProvider
                                                  .removeFavorite(food);
                                            } else {
                                              favoriteProvider
                                                  .addFavorite(food);
                                            }
                                          },
                                        ),
                                        Icon(
                                          Icons.location_on,
                                          color: Color(0xFFFF2F08),
                                          size: 20,
                                        ),
                                        SizedBox(width: 2),
                                        Text(
                                          Food.location[
                                              index], // ใช้ข้อมูลจากคลาส Food
                                          style: TextStyle(
                                            color: Colors.black45,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
