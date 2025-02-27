
import 'package:calculater/components/my_button.dart';
import 'package:calculater/constent.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  var UserInput = '';
  var Answer = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10 ),
          child: Column(

            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Align(alignment: Alignment.bottomRight,
                          child: Text(UserInput.toString(),style: TextStyle(fontSize: 30,color: Colors.white),)),
                      SizedBox(height: 15,),
                      Text(Answer.toString(),style: TextStyle(fontSize: 30,color: Colors.white),)
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,

                child: Column(
                  children: [
                    Row(
                      children: [
                        MyButton(tital:"AC", onPress: (){
                          UserInput = '';
                          Answer = '';
                          setState(() {

                          });
                        },),
                        MyButton(tital: "+/-",onPress: (){
                          UserInput += "+/-";
                          setState(() {

                          });
                        }),
                        MyButton(tital:"%",onPress: (){
                          UserInput += "%";
                          setState(() {

                          });
                        }),
                        MyButton(tital:"/",onPress: (){
                          UserInput += "/";
                          setState(() {

                          });
                        } ,color: Color(0xffffa00a)),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(tital:"7", onPress: (){
                          UserInput += "7";
                          setState(() {

                          });
                        },),
                        MyButton(tital: "8",onPress: (){
                          UserInput += "8";
                          setState(() {

                          });
                        }),
                        MyButton(tital:"9",onPress: (){
                          UserInput += "9";
                          setState(() {

                          });
                        }),
                        MyButton(tital:"x",onPress: (){
                          UserInput += "x";
                          setState(() {

                          });
                        } ,color: Color(0xffffa00a)),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(tital:"4", onPress: (){
                          UserInput += "4";
                          setState(() {

                          });
                        },),
                        MyButton(tital: "5",onPress: (){
                          UserInput += "5";
                          setState(() {

                          });
                        }),
                        MyButton(tital:"6",onPress: (){
                          UserInput += "6";
                          setState(() {

                          });
                        }),
                        MyButton(tital:"-",onPress: (){
                          UserInput += "-";
                          setState(() {

                          });
                        } ,color: Color(0xffffa00a)),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(tital:"1", onPress: (){
                          UserInput += "1";
                          setState(() {

                          });
                        },),
                        MyButton(tital: "2",onPress: (){
                          UserInput += "2";
                          setState(() {

                          });
                        }),
                        MyButton(tital:"3",onPress: (){
                          UserInput += "3";
                          setState(() {

                          });
                        }),
                        MyButton(tital:"+",onPress: (){
                          UserInput += "+";
                          setState(() {

                          });
                        } ,color: Color(0xffffa00a)),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(tital:"0", onPress: (){
                          UserInput += "0";
                          setState(() {

                          });
                        },),
                        MyButton(tital: ".",onPress: (){
                          UserInput += ".";
                          setState(() {

                          });
                        }),
                        MyButton(tital:"DEL",onPress: (){
                          UserInput = UserInput.substring(0, UserInput.length - 1);
                          setState(() {

                          });
                        }),
                        MyButton(tital:"=",onPress: (){
                          equalPress();
                          setState(() {

                          });
                        } ,color: Color(0xffffa00a)),
                      ],
                    ),

                  ],
                ),
              ),


              SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );
  }

  // void equalPress() {
  //   Parser p = Parser();
  //   Expression expression =p.parse(UserInput);
  //   ContextModel contextModel = ContextModel();
  //
  //   double eval = expression.evaluate(EvaluationType.REAL, ContextModel);
  //   Answer = eval.toString();
  // }
  void equalPress() {

    String input = UserInput.replaceAll("x", "*"); // Fix multiplication symbol

    Parser p = Parser();
    Expression expression = p.parse(input);
    ContextModel contextModel = ContextModel();

    double eval = expression.evaluate(EvaluationType.REAL, contextModel);

    setState(() {
      Answer = eval.toString(); // Update UI with the result
    });
  }


}




