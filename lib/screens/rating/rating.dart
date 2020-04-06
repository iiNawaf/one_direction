import 'package:flutter/material.dart';
import 'package:project/providers/auth_provider.dart';
import 'package:provider/provider.dart';

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
  int chosenRating = 0;
  int userRating;
  bool isLoading = false;

  @override
  void initState() {
    userRating = Provider.of<AuthProvider>(context, listen: false).userRating;
    chosenRating = userRating;
    if (chosenRating == 5) {
      oneStarRating = true;
      twoStarsRating = true;
      threeStarsRating = true;
      fourStarsRating = true;
      fiveStarsRating = true;
    } else if (chosenRating == 4) {
      oneStarRating = true;
      twoStarsRating = true;
      threeStarsRating = true;
      fourStarsRating = true;
    } else if (chosenRating == 3) {
      oneStarRating = true;
      twoStarsRating = true;
      threeStarsRating = true;
    } else if (chosenRating == 2) {
      oneStarRating = true;
      twoStarsRating = true;
    } else if (chosenRating == 1) {
      oneStarRating = true;
    } else {
      oneStarRating = false;
      twoStarsRating = false;
      threeStarsRating = false;
      fourStarsRating = false;
      fiveStarsRating = false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe8f0f2),
      appBar: AppBar(
        title: Text('التقييم'),
        backgroundColor: Colors.blue[200],
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      child: Icon(
                        oneStarRating == false ? Icons.star_border : Icons.star,
                        size: 50,
                        color: Colors.yellow[700],
                      ),
                      onTap: () {
                        setState(() {
                          oneStarRating = !oneStarRating;
                          twoStarsRating = false;
                          threeStarsRating = false;
                          fourStarsRating = false;
                          fiveStarsRating = false;
                          if (oneStarRating) {
                            chosenRating = 1;
                          } else {
                            chosenRating = 0;
                          }
                        });
                      },
                    ),
                    GestureDetector(
                      child: Icon(
                        twoStarsRating == false ? Icons.star_border : Icons.star,
                        size: 50,
                        color: Colors.yellow[700],
                      ),
                      onTap: () {
                        setState(() {
                          twoStarsRating = !twoStarsRating;
                          oneStarRating = true;
                          threeStarsRating = false;
                          fourStarsRating = false;
                          fiveStarsRating = false;
                          if (twoStarsRating) {
                            chosenRating = 2;
                          } else {
                            chosenRating = 1;
                          }
                        });
                      },
                    ),
                    GestureDetector(
                      child: Icon(
                        threeStarsRating == false ? Icons.star_border : Icons.star,
                        size: 50,
                        color: Colors.yellow[700],
                      ),
                      onTap: () {
                        setState(() {
                          threeStarsRating = !threeStarsRating;
                          oneStarRating = true;
                          twoStarsRating = true;
                          fourStarsRating = false;
                          fiveStarsRating = false;
                          if (threeStarsRating) {
                            chosenRating = 3;
                          } else {
                            chosenRating = 2;
                          }
                        });
                      },
                    ),
                    GestureDetector(
                      child: Icon(
                        fourStarsRating == false ? Icons.star_border : Icons.star,
                        size: 50,
                        color: Colors.yellow[700],
                      ),
                      onTap: () {
                        setState(() {
                          fourStarsRating = !fourStarsRating;
                          oneStarRating = true;
                          twoStarsRating = true;
                          threeStarsRating = true;
                          fiveStarsRating = false;
                          if (fourStarsRating) {
                            chosenRating = 4;
                          } else {
                            chosenRating = 3;
                          }
                        });
                      },
                    ),
                    GestureDetector(
                      child: Icon(
                        fiveStarsRating == false ? Icons.star_border : Icons.star,
                        size: 50,
                        color: Colors.yellow[700],
                      ),
                      onTap: () {
                        setState(() {
                          fiveStarsRating = !fiveStarsRating;
                          oneStarRating = true;
                          twoStarsRating = true;
                          threeStarsRating = true;
                          fourStarsRating = true;
                          if (fiveStarsRating) {
                            chosenRating = 5;
                          } else {
                            chosenRating = 4;
                          }
                        });
                      },
                    ),
                  ],
                ),
                InkWell(
                  onTap: chosenRating == 0
                      ? null
                      : userRating == chosenRating
                          ? null
                          : () async {
                              try {
                                setState(() {
                                  isLoading = true;
                                });
                                final authProvider = Provider.of<AuthProvider>(context, listen: false);
                                final userId = authProvider.loggedinUser.userId;
                                await authProvider.setUserRating(userId, chosenRating);
                                setState(() {
                                  isLoading = false;
                                });
                                showDialog(
                                  context: context,
                                  builder: (ctx) => AlertDialog(
                                    content: Container(
                                      width: MediaQuery.of(context).size.width * 0.6,
                                      height: 100,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Icon(
                                            Icons.favorite,
                                            color: Colors.red,
                                            size: 40,
                                          ),
                                          SizedBox(height: 20),
                                          Text("شكراً لك على التقييم"),
                                        ],
                                      ),
                                    ),
                                    actions: <Widget>[
                                      FlatButton(
                                        child: Text("إغلاق"),
                                        onPressed: () => Navigator.of(context).pop(),
                                      ),
                                    ],
                                  ),
                                );
                              } catch (e) {
                                print(e);
                                setState(() {
                                  isLoading = false;
                                });
                              }
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
            ),
    );
  }
}
