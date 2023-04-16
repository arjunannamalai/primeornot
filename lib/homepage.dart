// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String str = "";
  String str1 = "";
  List<int> result = [];
  Color textcolor = Colors.black;
  Color hintcolor = Color.fromARGB(255, 74, 74, 74);
  Color bgcolor = Colors.white;
  TextEditingController textEditingController = TextEditingController();

  bool prime(int num) {
    //int num = int.parse(textEditingController.text);
    if (num == 1) {
      print("1 is neither prime nor composite");
      return false;
    } else {
      for (var i = 2; i <= num / i; ++i) {
        if (num % i == 0) {
          return false;
        }
      }
      return true;
    }
  }

  List<int> factors(int n) {
    for (int i = 1; i <= n; i++) {
      if (n % i == 0) {
        result.add(i);
      }
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Prime or Not",
          style: TextStyle(
            color: Colors.black,
            //fontWeight: //fontWeight.bold,
            fontSize: 26,
          ),
        ),
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0, bottom: 18),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: textEditingController,
                        style: TextStyle(color: textcolor, fontSize: 24),
                        decoration: InputDecoration(
                          labelText: "Enter a Number",
                          labelStyle: TextStyle(
                              //fontWeight: //fontWeight.w400,
                              color: hintcolor,
                              fontSize: 24),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                                width: 1.5, color: Colors.grey),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                                width: 1.5, color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        int num = int.parse(textEditingController.text);
                        if (num < 1 || num > 1000000000000) {
                          setState(() {
                            str =
                                "Please use positive non-zero integers less than 10,000,000,000,000";
                            str1 =
                                "(13 digits max and no commas for thousand separators)";
                          });
                        } else {
                          setState(
                            () {
                              result = [];
                              str1 =
                                  " Factors of ${textEditingController.text}:";
                              //int num = int.parse(textEditingController.text);
                              if (num == 1) {
                                result = [1];
                                str = "1 is neither prime nor composite number";
                              } else if (prime(num)) {
                                str =
                                    "${textEditingController.text} is prime number";
                                factors(num);
                              } else {
                                str =
                                    "${textEditingController.text} is a composite number";
                                factors(num);
                              }
                            },
                          );
                        }
                      },
                      child: Center(
                        child: Container(
                          width: 200,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.blue,
                          ),
                          child: const Center(
                            child: Text(
                              "Check Prime",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                //fontWeight: //fontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          str,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            //fontWeight: //fontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      str1,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        //fontWeight: //fontWeight.w500,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 18.0, bottom: 18),
                      child: SizedBox(
                        width: width,
                        height: width - 20,

                        child: SingleChildScrollView(
                          //keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                          child: Wrap(
                            alignment: WrapAlignment.start,
                            spacing: 14.0,
                            runSpacing: 10.0,
                            children: List<Widget>.generate(result.length,
                                (int index) {
                              return Chip(
                                backgroundColor: Colors.white,
                                label: Text(
                                  result[index].toString(),
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                ),
                              );
                            }),
                          ),
                        ),
                        // child: ListView.builder(
                        //   itemCount: result.length,
                        //   itemBuilder: (BuildContext context, int index) {
                        //     return Container(
                        //       height: 50,
                        //       child: Center(
                        //           child: Text(
                        //         '${result[index]}',
                        //         style: TextStyle(
                        //           color: Colors.black,
                        //           fontSize: 24,
                        //         ),
                        //       )),
                        //     );
                        //   },
                        // ),
                        // child: GridView.count(
                        //   crossAxisCount: 5,
                        //   children: List.generate(result.length, (index) {
                        //     return Center(
                        //       child: Text(
                        //         result[index].toString(),
                        //         //'$index',
                        //         style: Theme.of(context).textTheme.headline5,
                        //       ),
                        //     );
                        //   }),
                        // ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
