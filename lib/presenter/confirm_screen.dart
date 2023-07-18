import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConfirmScreen extends StatefulWidget {
  const ConfirmScreen({super.key, required this.amount, required this.visitDay, required this.account, required this.department, required this.purpose, required this.representative});

  final String amount;
  final String visitDay;
  final String account;
  final String department;
  final String purpose;
  final String representative;

  @override
  State<StatefulWidget> createState() => _ConfirmScreen();
}

class _ConfirmScreen extends State<ConfirmScreen> {
  @override
  Widget build(BuildContext context) {
    initItemView(String titleText, String text) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 15, 0, 5),
            child: Text(
              titleText,
              style: const TextStyle(color: Color(0xff808080)),
            ),
          ),
          Text(
            text,
            style: const TextStyle(color: Colors.white),
          )
        ],
      );
    }

    return Scaffold(
        body: Stack(
          children: [
            Container(
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.all(0),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/background_alfa.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  AppBar(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    title: const Text(
                      "Взнос наличных в BYN",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 18,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                            child: Text("ДОКУМЕНТ",
                                style: const TextStyle(color: Color(0xff808080))),
                          ),
                          const Divider(color: Color(0xff808080)),
                          Text("№1 от 16.07.2023", style: const TextStyle(color: Colors.white)),
                          initItemView("Сумма взноса", "${widget.amount},00 BYN" ),
                          initItemView("Дата визита", widget.visitDay),
                          initItemView("Счет", widget.account),
                          initItemView("Отделение", widget.department),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                            child: Text("НАЗНАЧЕНИЕ ВЗНОСА",
                                style: const TextStyle(color: Color(0xff808080))),
                          ),
                          const Divider(color: Color(0xff808080)),
                          Text(widget.purpose, style: const TextStyle(color: Colors.white)),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                            child: Text("ПРЕДСТАВИТЕЛЬ",
                                style: const TextStyle(color: Color(0xff808080))),
                          ),
                          const Divider(color: Color(0xff808080)),
                          Text(widget.representative, style: const TextStyle(color: Colors.white)),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 100, 0, 20),
                              child: Card(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(50, 0, 50, 10),
                                      child: Text(
                                          "Для подтверждения платежей введите одноразовый код из SMS",
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    const Divider(color: Color(0xff808080)),
                                    Padding(padding: EdgeInsets.fromLTRB(12, 5, 12, 0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Expanded(child: Text("SMS-код")),
                                        MaterialButton(
                                          onPressed: () {},
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.zero,
                                            side: BorderSide(color: Color(0xff808080), width: 1),
                                          ),
                                          // padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                          child: Text(
                                            "Получить код",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              fontStyle: FontStyle.normal,
                                            ),
                                          ),
                                          textColor: Color(0xff000000),
                                          height: 50,
                                          minWidth: 80,
                                        )
                                      ],
                                    ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ),
                          MaterialButton(
                            onPressed: () {},
                            color: Color(0xffef3939),
                            elevation: 0,
                            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            child: Text(
                              "Подтвердить",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                            textColor: Color(0xffffffff),
                            height: 55,
                            minWidth: MediaQuery.of(context).size.width,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));

  }
}
