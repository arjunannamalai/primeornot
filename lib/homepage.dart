// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String str = "";
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
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 18),
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
                  Text(
                    str,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    int num = int.parse(textEditingController.text);
                    if (num == 1) {
                      str = "1 is neither prime nor composite number";
                    } else if (prime(num)) {
                      str = "${textEditingController.text} is prime number";
                    } else {
                      str =
                          "${textEditingController.text} is not a prime number";
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
