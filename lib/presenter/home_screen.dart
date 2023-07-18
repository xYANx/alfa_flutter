import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'cash_document_screen.dart';

class HomeMenuScreen extends StatelessWidget {
  const HomeMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    initIconView(String path, String text, VoidCallback? onPressAction) {
      return Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              IconButton(
                onPressed: onPressAction,
                icon: SvgPicture.asset(
                  path,
                ),
              ),
              Text(
                text,
                style: const TextStyle(color: Colors.white),
              )
            ],
          ));
    }

    return Scaffold(
        body: DefaultTabController(
      length: 3,
      child: Container(
        margin: const EdgeInsets.all(0),
        padding: const EdgeInsets.fromLTRB(0, 24, 0, 0),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background_alfa.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                ///***If you have exported images you must have to copy those images in assets/images directory.
                IconButton(
                  icon: SvgPicture.asset(
                      "assets/images/icons_ic_hide_password.svg"),
                  onPressed: () {},
                ),
                Expanded(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 56,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                          child: Text(
                            "ООО 'Системные Технологии'",
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontSize: 12,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                        Text(
                          "Создать",
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 20,
                            color: Color(0xffffffff),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  padding: EdgeInsets.zero,
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: Color(0x1f000000),
                    shape: BoxShape.circle,
                    border: Border.all(color: Color(0x4d9e9e9e), width: 1),
                  ),
                  child: const Icon(
                    Icons.question_answer,
                    color: Color(0xffffffff),
                    size: 20,
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 12, 0),
                  padding: EdgeInsets.all(0),
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: Color(0x1f000000),
                    shape: BoxShape.circle,
                    border: Border.all(color: Color(0x4d9e9e9e), width: 1),
                  ),
                  child: const Icon(
                    Icons.settings,
                    color: Color(0xffffffff),
                    size: 20,
                  ),
                ),
              ],
            ),
            const Divider(
              color: Color(0x55ffffff),
              height: 16,
              thickness: 0,
              indent: 12,
              endIndent: 12,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(12, 0, 12, 12),
              padding: EdgeInsets.all(0),
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                color: Color(0x33ffffff),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(6.0),
                border: Border.all(color: Color(0x4d9e9e9e), width: 1),
              ),
              child: DefaultTabController(
                length: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const TabBar(
                      tabs: [
                        Tab(
                          text: "РУБЛЕВЫЕ",
                        ),
                        Tab(
                          text: "ВАЛЮТНЫЕ",
                        ),
                        Tab(
                          text: "ДРУГИЕ",
                        )
                      ],
                      indicatorColor: Colors.white,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        initIconView(
                            "assets/images/icons_documents_ic_payment_salary.svg",
                            "Зарплата",
                            null),
                        initIconView(
                            "assets/images/icons_documents_ic_payment_credit.svg",
                            "Кредит",
                            null),
                        initIconView(
                            "assets/images/icons_documents_ic_doc_required.svg",
                            "Требование",
                            null),
                        initIconView(
                            "assets/images/icons_documents_ic_acceptance.svg",
                            "Акцепт",
                            null),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        initIconView(
                            "assets/images/icons_documents_ic_payment_arbitrary.svg",
                            "Письмо",
                            null),
                        initIconView(
                            "assets/images/icons_documents_ic_acceptance.svg",
                            "Справка",
                            null),
                        initIconView(
                            "assets/images/icons_documents_ic_reservation.svg",
                            "Брони",
                            null),
                        initIconView(
                            "assets/images/icons_documents_ic_doc_required.svg",
                            "Наличка", () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CashFirstStepScreen()),
                          );
                        }),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const TabBar(
              tabs: [
                Tab(
                  text: "ШАБЛОНЫ",
                ),
                Tab(
                  text: "ЧАСТЫЕ",
                ),
                Tab(
                  text: "ЧЕРНОВИКИ",
                )
              ],
              indicatorColor: Colors.white,
            ),
            Expanded(
              flex: 1,
              child: ListView(
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.all(0),
                shrinkWrap: false,
                physics: ScrollPhysics(),
                children: [],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
