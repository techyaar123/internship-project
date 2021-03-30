import 'package:assignmentui/src/screens/secondScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            color: Colors.blue[900],
            height: MediaQuery.of(context).size.height * 1,
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Stack(children: [
              Positioned(
                  top: -190,
                  left: -10,
                  child: SvgPicture.asset(
                    'assets/Circles.svg',
                    height: 410,
                  )),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 20, left: 30),
                                child: Text(
                                  'Control',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                              Text(
                                'Panel',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ],
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5, right: 20),
                            child: Stack(children: [
                              CircleAvatar(
                                radius: 32,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  maxRadius: 30,
                                  // backgroundImage: NetworkImage(
                                  //     'https://www.fillmurray.com/300/300'),
                                ),
                              ),
                              Positioned(
                                top: -1,
                                right: -1,
                                child: Icon(
                                  Icons.circle,
                                  size: 20,
                                  color: Colors.pink[300],
                                ),
                              )
                            ]),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(28),
                            topRight: Radius.circular(28))),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 30, top: 20),
                                child: Text(
                                  'All Rooms',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.58,
                              child: GridView.count(
                                crossAxisCount: 2,
                                scrollDirection: Axis.vertical,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 15,
                                children: [
                                  buildCard('assets/bed.svg', 'Bed room',
                                      '4 Lights', context),
                                  buildCard('assets/room.svg', 'Living room',
                                      '2 Lights', context),
                                  buildCard('assets/kitchen.svg', 'Kitchen',
                                      '5 Lights', context),
                                  buildCard('assets/bathtube.svg', 'Bathroom',
                                      '1 Lights', context),
                                  buildCard('assets/house.svg', 'Outdoor',
                                      '5 Lights', context),
                                  buildCard('assets/balcony.svg', 'Balcony',
                                      '2 Lights', context),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 80,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10, top: 10),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 100,
                          ),
                          SvgPicture.asset(
                            'assets/bulb.svg',
                            height: 32,
                          ),
                          SizedBox(
                            width: 53,
                          ),
                          SvgPicture.asset(
                            'assets/Icon feather-home.svg',
                            height: 32,
                          ),
                          SizedBox(
                            width: 51,
                          ),
                          SvgPicture.asset(
                            'assets/Icon feather-settings.svg',
                            height: 32,
                          ),
                          SizedBox(
                            width: 78,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }

  Widget buildCard(
      String images, String title, String description, BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) =>
                SecondScreen(title.trim(), description.trim())));
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35),
        ),
        child: Row(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 0, top: 30),
                  child: SvgPicture.asset(
                    images,
                    height: 35,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    description,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
