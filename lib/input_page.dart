import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/results_page.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'content_card.dart';

const Color activeColor = Color(0xFF343d56);
const Color inactiveColor = Color(0xFF374046);
const Icon iconMale = Icon(
  FontAwesomeIcons.mars,
  size: 60,
);
const Icon iconFemale = Icon(
  FontAwesomeIcons.venus,
  size: 60,
);

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 160;
  int weight = 50;
  int age = 20;
  Color maleColor = inactiveColor;
  Color femaleColor = inactiveColor;

  void add() {
    setState(() {
      weight++;
      print(weight);
    });
  }

  void updateColor(Gender selectedGender) {
    // female=1 ,male =2
    if (selectedGender == Gender.female) {
      if (femaleColor == inactiveColor) {
        femaleColor = activeColor;
        maleColor = inactiveColor;
      } else {
        femaleColor = inactiveColor;
      }
    }
    if (selectedGender == Gender.male) {
      if (maleColor == inactiveColor) {
        maleColor = activeColor;
        femaleColor = inactiveColor;
      } else {
        maleColor = inactiveColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI Calculator'),
      ),
      body: ListView(
        children: [
          // choose gender
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColor(Gender.female);
                      });
                    },
                    child: ReusableCard(
                      femaleColor,
                      ContentCard(iconFemale, 'FEMALE'),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColor(Gender.male);
                      });
                    },
                    child: ReusableCard(
                      maleColor,
                      ContentCard(iconMale, 'MALE'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // choose height
          Expanded(
            flex: 2,
            child: ReusableCard(
                activeColor,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: TextStyle(color: Color(0xFF8D8E98), fontSize: 20),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 50,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'cm',
                          style:
                              TextStyle(color: Color(0xFF8D8E98), fontSize: 20),
                        ),
                      ],
                    ),
                    Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 220,
                        activeColor: Color(0xFFe44877),
                        inactiveColor: Color(0xFF8D8E98),
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.toInt();
                          });
                        })
                  ],
                )),
          ),
          // weight and age
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: ReusableCard(
                    activeColor,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style:
                              TextStyle(color: Color(0xFF8D8E98), fontSize: 20),
                        ),
                        Text(
                          weight.toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 50,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RawMaterialButton(
                              elevation: 0,
                              child: Icon(FontAwesomeIcons.plus),
                              fillColor: Color(0xFF8D8E98),
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              constraints: BoxConstraints.tightFor(
                                  width: 60, height: 60),
                              shape: CircleBorder(),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            RawMaterialButton(
                              elevation: 0,
                              child: Icon(FontAwesomeIcons.minus),
                              fillColor: Color(0xFF8D8E98),
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              constraints: BoxConstraints.tightFor(
                                  width: 60, height: 60),
                              shape: CircleBorder(),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ReusableCard(
                      activeColor,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: TextStyle(
                                color: Color(0xFF8D8E98), fontSize: 20),
                          ),
                          Text(
                            age.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 50,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RawMaterialButton(
                                elevation: 0,
                                child: Icon(FontAwesomeIcons.plus),
                                fillColor: Color(0xFF8D8E98),
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                constraints: BoxConstraints.tightFor(
                                    width: 60, height: 60),
                                shape: CircleBorder(),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              RawMaterialButton(
                                elevation: 0,
                                child: Icon(FontAwesomeIcons.minus),
                                fillColor: Color(0xFF8D8E98),
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                                constraints: BoxConstraints.tightFor(
                                    width: 60, height: 60),
                                shape: CircleBorder(),
                              )
                            ],
                          )
                        ],
                      )),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Color(0xFFe44877),
              child: TextButton(
                onPressed: () {
                  CalculatorBrain calc = CalculatorBrain(weight, height);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultsPage(
                        calc.calculateBMI(),
                        calc.getResult(),
                        calc.getInterpretation()
                      ),
                    ),
                  );
                },
                child: Text(
                  'CALCULATE',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RoundedButton extends StatelessWidget {
  final Icon icon;
  final Function onPressed;
  RoundedButton(this.icon, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0,
      child: icon,
      fillColor: Color(0xFF8D8E98),
      onPressed: () {},
      constraints: BoxConstraints.tightFor(width: 60, height: 60),
      shape: CircleBorder(),
    );
  }
}
