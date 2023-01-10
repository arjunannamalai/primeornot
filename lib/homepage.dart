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

    print("prime");
    print(num);
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Prime or Not",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w600, fontSize: 26),
        ),
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
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
                            fontWeight: FontWeight.w400,
                            color: hintcolor,
                            fontSize: 24),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide:
                              const BorderSide(width: 1.5, color: Colors.grey),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide:
                              const BorderSide(width: 1.5, color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      str,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    str1,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w500),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0, bottom: 18),
                    child: Container(
                      width: width,
                      height: width,
                      // child: Wrap(
                      //   spacing: 6.0,
                      //   runSpacing: 6.0,
                      //   children:
                      //       List<Widget>.generate(result.length, (int index) {
                      //     return Chip(
                      //       label: Text(result[index].toString()),
                      //     );
                      //   }),
                      // ),

                      // child: ListView.builder(
                      //   itemCount: result.length,
                      //   itemBuilder: (BuildContext context, int index) {
                      //     return Container(
                      //       height: 50,
                      //       child: Center(child: Text('${result[index]}')),
                      //     );
                      //   },
                      // ),
                      child: Text("$result"),
                      // child: GridView.count(
                      //   crossAxisCount: 5,
                      //   children: List.generate(result.length, (index) {
                      //     return Center(
                      //       child: Text(
                      //         '$index',
                      //         style: Theme.of(context).textTheme.headline5,
                      //       ),
                      //     );
                      //   }),
                      // ),
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    result = [];
                    str1 = " Factors of ${textEditingController.text}:";
                    int num = int.parse(textEditingController.text);
                    if (num == 1) {
                      result = [1];
                      str = "1 is neither prime nor composite number";
                    } else if (prime(num)) {
                      str = "${textEditingController.text} is prime number";
                    } else {
                      str =
                          "${textEditingController.text} is a composite number";
                      print(factors(num));
                    }
                  });
                },
                child: Container(
                  width: width - 10,
                  height: width * 0.18,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.blue,
                  ),
                  child: const Center(
                    child: Text(
                      "Check Prime",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
