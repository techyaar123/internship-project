import 'package:assignmentui/src/screens/firstScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SecondScreen extends StatefulWidget {
  @override
  String _title;
  String _description;

  SecondScreen(this._title, this._description);
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  SequenceAnimation sequenceAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
    );
    sequenceAnimation = SequenceAnimationBuilder()
        .addAnimatable(
            animatable: Tween<double>(begin: 160, end: 190),
            from: Duration(seconds: 0),
            to: Duration(seconds: 2),
            tag: 'title',
            curve: Curves.easeInOut)
        .addAnimatable(
            animatable: Tween<double>(begin: 0, end: 1),
            from: Duration(seconds: 0),
            to: Duration(seconds: 2),
            tag: 'Opacity')
        .addAnimatable(
            animatable: Tween<double>(begin: 300, end: 0),
            from: Duration(seconds: 1),
            to: Duration(seconds: 3),
            tag: 'slide')
        .addAnimatable(
            animatable: Tween<double>(begin: 0, end: 20),
            from: Duration(seconds: 1),
            to: Duration(seconds: 2),
            tag: 'lamb')
        .addAnimatable(
            animatable: Tween<double>(begin: 90, end: 135),
            from: Duration(seconds: 2),
            to: Duration(seconds: 3),
            tag: 'bulb')
        .addAnimatable(
            animatable: Tween<double>(begin: 0, end: 15),
            from: Duration(seconds: 0),
            to: Duration(seconds: 2),
            tag: 'container')
        .animate(_controller);
    _controller.forward();
  }

  int _value = 100;
  Color colorCircle = Colors.yellow;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            color: Colors.blue[900],
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Stack(
              children: [
                Positioned(
                  top: -190,
                  left: 10,
                  child: RotationTransition(
                    turns: Tween(begin: 0.0, end: 0.5).animate(_controller),
                    child: SvgPicture.asset(
                      'assets/Circles.svg',
                      height: 410,
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 0, left: 20),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                FirstScreen()));
                                  },
                                  child: SvgPicture.asset(
                                    'assets/Icon ionic-md-arrow-round-back.svg',
                                    height: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 80),
                                    child: Text(
                                      widget._title.replaceFirst('room', ' '),
                                      style: TextStyle(
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      'Room',
                                      style: TextStyle(
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            width: 70,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      AnimatedBuilder(
                        animation: _controller,
                        builder: (context, child) {
                          return Container(
                            color: Colors.transparent,
                            padding: EdgeInsets.all(10),
                            height: 70,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                SizedBox(
                                  width: sequenceAnimation['slide'].value,
                                ),
                                buildContainer(
                                  Colors.white,
                                  Colors.blue[900],
                                  'Main Light',
                                  'assets/surface1.svg',
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                buildContainer(
                                  Colors.black38,
                                  Colors.white,
                                  'Desk Lights',
                                  'assets/furniture-and-household.svg',
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                buildContainer(
                                  Colors.white,
                                  Colors.blue[900],
                                  'Bed lights',
                                  'assets/bed2.svg',
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      AnimatedBuilder(
                        animation: _controller,
                        builder: (context, child) {
                          return SizedBox(
                            height: sequenceAnimation['container'].value,
                          );
                        },
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(28),
                              topRight: Radius.circular(28),
                            )),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(24.0),
                                    child: Text(
                                      'Intensity',
                                      style: TextStyle(
                                          color: Colors.blue[900],
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  SvgPicture.asset(
                                    'assets/solution2.svg',
                                    height: 27,
                                  ),
                                  Expanded(
                                      child: Slider(
                                    value: _value.toDouble(),
                                    min: 0,
                                    max: 100,
                                    activeColor: Colors.yellow,
                                    onChanged: (double newvalue) {
                                      setState(() {
                                        _value = newvalue.round();
                                      });
                                    },
                                    inactiveColor: Colors.yellow,
                                  )),
                                  SvgPicture.asset(
                                    'assets/solution.svg',
                                    height: 33,
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(24),
                                    child: Text(
                                      'Colors',
                                      style: TextStyle(
                                          color: Colors.blue[900],
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 20),
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          colorCircle = Colors.red;
                                        });
                                      },
                                      child: CircleAvatar(
                                        backgroundColor: Colors.red[200],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 13),
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          colorCircle = Colors.green;
                                        });
                                      },
                                      child: CircleAvatar(
                                        backgroundColor: Colors.green[200],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 13),
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          colorCircle = Colors.blue;
                                        });
                                      },
                                      child: CircleAvatar(
                                        backgroundColor: Colors.blue[200],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 13),
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          colorCircle = Colors.purple;
                                        });
                                      },
                                      child: CircleAvatar(
                                        backgroundColor: Colors.purple[500],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 13),
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          colorCircle = Colors.yellow;
                                        });
                                      },
                                      child: CircleAvatar(
                                        backgroundColor: Colors.yellow[200],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 13),
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          colorCircle = Colors.brown;
                                        });
                                      },
                                      child: CircleAvatar(
                                        backgroundColor: Colors.brown[200],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 10,
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(48),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black12,
                                              blurRadius: 20),
                                        ],
                                      ),
                                      child: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        child: SvgPicture.asset('assets/+.svg'),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(24),
                                    child: Text(
                                      'Scenes',
                                      style: TextStyle(
                                          color: Colors.blue[900],
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 30,
                                      ),
                                      buildContainerScenes(
                                          Colors.orange[200],
                                          'assets/solution1.svg',
                                          'Birthday',
                                          20),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      buildContainerScenes(Colors.purple[200],
                                          'assets/solution1.svg', 'Party', 35)
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 30,
                                      ),
                                      buildContainerScenes(Colors.blue[200],
                                          'assets/solution1.svg', 'Relax', 37),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      buildContainerScenes(Colors.green[200],
                                          'assets/solution1.svg', 'Fun', 48)
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 80,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(color: Colors.black12, blurRadius: 20),
                          ],
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
                ),
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Positioned(
                      top: sequenceAnimation['title'].value,
                      left: 40,
                      child: Text(
                        widget._description,
                        style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange.withOpacity(
                                sequenceAnimation['Opacity'].value)),
                      ),
                    );
                  },
                ),
                Positioned(
                  top: 300,
                  left: 330,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(48),
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 20),
                      ],
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 20,
                      child:
                          SvgPicture.asset('assets/Icon awesome-power-off.svg'),
                    ),
                  ),
                ),
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Positioned(
                      top: sequenceAnimation['bulb'].value,
                      left: 300,
                      child: CircleAvatar(
                        backgroundColor:
                            colorCircle.withOpacity(_value.toDouble() * .01),
                        radius: 10,
                        child: Container(),
                      ),
                    );
                  },
                ),
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Positioned(
                      top: sequenceAnimation['lamb'].value,
                      left: 240,
                      child: SvgPicture.asset(
                        'assets/Group 38.svg',
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container buildContainerScenes(
      Color colorContainer, String svgpicture, String title, int height) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: colorContainer,
        borderRadius: BorderRadius.circular(14),
        shape: BoxShape.rectangle,
      ),
      child: Row(
        children: [
          SizedBox(
            width: 10,
          ),
          SvgPicture.asset(
            svgpicture,
            color: Colors.white,
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            title,
            style: TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: height.toDouble(),
          ),
        ],
      ),
    );
  }

  Container buildContainer(
      Color colorContainer, Color color, String title, String svgpicture) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: colorContainer,
        borderRadius: BorderRadius.circular(14),
        shape: BoxShape.rectangle,
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            svgpicture,
            color: color,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            title,
            style: TextStyle(
                color: color, fontSize: 15, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 8,
          ),
        ],
      ),
    );
  }
}
