import 'package:flutter/material.dart';

import 'package:my_first_crypto_app/authfirebase/flutterfire.dart';
import 'package:my_first_crypto_app/globalconst/global_const.dart';
import 'package:my_first_crypto_app/pages/home_view.dart';
import 'package:my_first_crypto_app/widgets/button.dart';

class AuthProject extends StatefulWidget {
  const AuthProject({super.key});

  @override
  State<AuthProject> createState() => _AuthProjectState();
}

class _AuthProjectState extends State<AuthProject> {
  TextEditingController _emailField = TextEditingController();
  TextEditingController _passwordField = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              opacity: 1.0,
              image: AssetImage("assets/images/background.jpg"),
              fit: BoxFit.cover,
            )),
        child: Column(
          children: [
            SizedBox(
              height: PageSize.height20*2,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: PageSize.width20,top: PageSize.height10*2),
                  child: Text(
                    "Lets begin journey",
                    style: TextStyle(color: Colors.white, fontSize: 45),
                  ),
                ),
                SizedBox(
                  height: PageSize.height15,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  margin: EdgeInsets.only(left: PageSize.width20),
                  child: Text(
                    "If you dont need account, please first register",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 150,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: PageSize.width10),
                    child: Text(
                      "CRYPTO APP",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.blueGrey.withOpacity(0.280),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: TextField(
                            controller: _emailField,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Email is here...",
                              hintStyle: TextStyle(
                                color: Colors.black54,
                              ),
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.blueGrey[700],
                              ),
                              labelStyle: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: TextField(
                            obscureText: true,
                            controller: _passwordField,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Password is here..",
                              hintStyle: TextStyle(
                                color: Colors.black54,
                              ),
                              prefixIcon: Icon(
                                Icons.password,
                                color: Colors.blueGrey[700],
                              ),
                              labelStyle: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: PrimaryTextButton(
                                button: TextButton(
                                    onPressed: () async {
                                      bool shouldNavigate = await register(
                                          _emailField.text,
                                          _passwordField.text);
                                      if (shouldNavigate) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    HomeView()));
                                      }
                                    },
                                    child: PrimaryText(
                                      title: "REGISTER",
                                      textColor: Colors.white,
                                    )))),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: PrimaryTextButton(
                                button: TextButton(
                                    onPressed: () async {
                                      bool shouldNavigate = await signIn(
                                          _emailField.text,
                                          _passwordField.text);
                                      if (shouldNavigate) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    HomeView()));
                                      }
                                    },
                                    child: PrimaryText(
                                        title: "LOGIN",
                                        textColor: Colors.white)))),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
