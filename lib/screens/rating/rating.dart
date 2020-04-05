import 'package:flutter/material.dart';
import 'package:project/widgets/rating/1_star_rating.dart';
import 'package:project/widgets/rating/2_stars_rating.dart';
import 'package:project/widgets/rating/3_stars_rating.dart';
import 'package:project/widgets/rating/4_stars_rating.dart';
import 'package:project/widgets/rating/5_stars_rating.dart';


class RatingScreen extends StatefulWidget {
  @override
  _RatingScreenState createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  bool oneStarRating = false;
  bool twoStarsRating = false;
  bool threeStarsRating = false;
  bool fourStarsRating = false;
  bool fiveStarsRating = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe8f0f2),
      appBar: AppBar(
        title: Text('التقييم'),
        backgroundColor: Colors.blue[200],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('0', style: TextStyle(fontWeight: FontWeight.bold)),
              GestureDetector(
                child: Icon(oneStarRating == false
                    ? Icons.star_border
                    : Icons.star, size: 35),
                onTap: (){
                  setState(() {
                    oneStarRating =! oneStarRating;
                    twoStarsRating = false;
                    threeStarsRating = false;
                    fourStarsRating = false;
                    fiveStarsRating = false;
                  });
                },
              ),


              GestureDetector(
                child: Icon(twoStarsRating == false
                    ? Icons.star_border
                    : Icons.star, size: 35),
                onTap: (){
                  setState(() {
                    twoStarsRating =! twoStarsRating;
                    oneStarRating = true;
                    threeStarsRating = false;
                    fourStarsRating = false;
                    fiveStarsRating = false;
                  });
                },
              ),


              GestureDetector(
                child: Icon(threeStarsRating == false
                    ? Icons.star_border
                    : Icons.star, size: 35),
                onTap: (){
                  setState(() {
                    threeStarsRating =! threeStarsRating;
                    oneStarRating = true;
                    twoStarsRating = true;
                    fourStarsRating = false;
                    fiveStarsRating = false;
                  });
                },
              ),


              GestureDetector(
                child: Icon(fourStarsRating == false
                    ? Icons.star_border
                    : Icons.star, size: 35),
                onTap: (){
                  setState(() {
                    fourStarsRating =! fourStarsRating;
                    oneStarRating = true;
                    twoStarsRating = true;
                    threeStarsRating = true;
                    fiveStarsRating = false;
                  });

                },
              ),


              GestureDetector(
                child: Icon(fiveStarsRating == false
                    ? Icons.star_border
                    : Icons.star, size: 35),
                onTap: (){
                  setState(() {
                    fiveStarsRating =! fiveStarsRating;
                    oneStarRating = true;
                    twoStarsRating = true;
                    threeStarsRating = true;
                    fourStarsRating = true;
                  });
                },
              ),


              Text('5', style: TextStyle(fontWeight: FontWeight.bold))
            ],
          ),
          InkWell(
            onTap: (){

            },
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                color: Colors.blue[200],
                height: 50,
                child: Center(
                  child: Text('ارسل تقييمك'),
                ),
              ),
            ),
          )
        ],
      )
    );
  }
}
