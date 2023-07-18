import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'home_screen.dart';

void main() => runApp(const BottomNavigationBarExampleApp());

class BottomNavigationBarExampleApp extends StatelessWidget {
  const BottomNavigationBarExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BottomNavigationBarExample(),
    );
  }
}

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;
  String passwordIcon = "assets/images/icons_ic_show_password.svg";
  String userName = "";
  String userPassword = "";
  bool passwordIconValue = true;
  UnderlineInputBorder inputBorder = const UnderlineInputBorder(
    borderSide: BorderSide(color: Color(0x53ffffff), width: 1),
  );

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background_alfa.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                    padding: const EdgeInsets.fromLTRB(79, 83, 79, 80),
                    child: SvgPicture.asset(
                      "assets/images/alfa_logo_text.svg",
                      width: 202,
                      height: 36,
                    )),
                Padding(
                  padding: const EdgeInsets.fromLTRB(45, 42, 45, 0),
                  child: TextField(
                    controller: TextEditingController(text: userName),
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    onChanged: (text) {
                      userName = text;
                    },
                    cursorColor: Colors.white,
                    style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 16,
                        color: Colors.white),
                    decoration: InputDecoration(
                      disabledBorder: inputBorder,
                      focusedBorder: inputBorder,
                      enabledBorder: inputBorder,
                      labelText: "Логин",
                      labelStyle: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                        color: Color(0xcbffffff),
                      ),
                      fillColor: const Color(0xfff2f2f3),
                      contentPadding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(45, 8, 45, 0),
                  child: TextField(
                    controller: TextEditingController(text: userPassword),
                    obscureText: passwordIconValue,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    onChanged: (text) {
                      userPassword = text;
                    },
                    cursorColor: Colors.white,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 16,
                      color: Color(0xffffffff),
                    ),
                    decoration: InputDecoration(
                      disabledBorder: inputBorder,
                      focusedBorder: inputBorder,
                      enabledBorder: inputBorder,
                      labelText: "Пароль",
                      labelStyle: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                        color: Color(0xcbffffff),
                      ),
                      fillColor: const Color(0xfff2f2f3),
                      suffixIcon: IconButton(
                        icon: SvgPicture.asset(passwordIcon),
                        onPressed: () {
                          setState(() {
                            if (passwordIconValue) {
                              passwordIcon =
                                  "assets/images/icons_ic_hide_password.svg";
                            } else {
                              passwordIcon =
                                  "assets/images/icons_ic_show_password.svg";
                            }
                            passwordIconValue = !passwordIconValue;
                          });
                        },
                      ),
                      contentPadding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(45, 16, 45, 0),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeMenuScreen()),
                      );
                    },
                    color: const Color(0xffee342f),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    padding: const EdgeInsets.all(16),
                    textColor: const Color(0xffffffff),
                    height: 40,
                    minWidth: MediaQuery.of(context).size.width,
                    child: const Text(
                      "Войти",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 24, 0, 0),
                  child: Text(
                    "Забыли логин или пароль?",
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 15,
                      color: Color(0x81acacac),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 24, 0, 0),
                  child: Text(
                    "Зарегистироваться",
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 15,
                      color: Color(0x81acacac),
                    ),
                  ),
                ),
              ],
            ),
            MaterialButton(
              onPressed: () {},
              color: const Color(0x33ffffff),
              elevation: 0,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
              padding: const EdgeInsets.all(16),
              textColor: const Color(0xffffffff),
              height: 47,
              minWidth: MediaQuery.of(context).size.width,
              child: const Text(
                "Открыть счет",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xff0d213e),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: const Color(0xff0d213e),
            icon:
                SvgPicture.asset("assets/images/icons_ic_bottom_nav_home.svg"),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            backgroundColor: const Color(0xff0d213e),
            icon: SvgPicture.asset(
                "assets/images/icons_ic_bottom_nav_cources.svg"),
            label: 'Курсы',
          ),
          BottomNavigationBarItem(
            backgroundColor: const Color(0xff0d213e),
            icon: SvgPicture.asset("assets/images/icons_ic_live_chat.svg"),
            label: 'Чат',
          ),
          BottomNavigationBarItem(
            backgroundColor: const Color(0xff0d213e),
            icon: SvgPicture.asset("assets/images/icons_ic_map_dep.svg"),
            label: 'Контакты',
          )
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
