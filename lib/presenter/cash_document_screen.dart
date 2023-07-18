import 'package:alfa_mobile/domain/get_account_use_case.dart';
import 'package:alfa_mobile/presenter/widgets/input_data_item.dart';
import 'package:alfa_mobile/service/models/account_entity.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

import '../dictionary_type.dart';
import 'confirm_screen.dart';
import 'dictionary_screen.dart';

class CashFirstStepScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CashFirstStepScreen();
}

class _CashFirstStepScreen extends State<CashFirstStepScreen> {
  String? amountValue;
  String? departmentValue;
  String? purposeValue;
  String? representativeValue;
  String? calendarValue;
  String? contractNumberValue;
  String? contractDateValue;
  AccountEntity? accountEntity;
  GetAccountUseCase getAccountUseCase = GetAccountUseCase();

  initAccount() {
    getAccountUseCase.getAccount().then((it) {
      setState(() {
        accountEntity = it;
      });
    }).catchError((Object obj) {
      switch (obj.runtimeType) {
        case DioError:
          print('error - ${(obj as DioError).error}');
          break;
        default:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (accountEntity == null) {
      initAccount();
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
                leading: IconButton(
                  icon: const Icon(
                    Icons.close,
                    color: Color(0xffffffff),
                    size: 24,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              const Divider(color: Color(0xff808080)),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.fromLTRB(12, 12, 12, 0),
                padding: const EdgeInsets.all(0),
                width: MediaQuery.of(context).size.width,
                height: 150,
                decoration: BoxDecoration(
                  color: const Color(0x33ffffff),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(color: Color(0x4d9e9e9e), width: 1),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      accountEntity?.name?.toString() ?? "",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(12, 12, 12, 0),
                      child: Text(
                        accountEntity?.account?.toString() ?? "",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(12, 12, 12, 0),
                      child: Text(
                        "${accountEntity?.amount?.toString() ?? ""} BYN",
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: ListView(
                children: [
                  Container(
                      color: Colors.white,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                            child: InputDataItem(
                              labelText: "Сумма взноса, BYN",
                              inputValue: amountValue,
                              onTextChangedAction: (String text) {
                                amountValue = text;
                              },
                              inputFormatter: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              textInputType: TextInputType.number,
                            ),
                          ),
                          InputDataItem(
                            labelText: "Дата визита",
                            inputValue: calendarValue,
                            iconAction: () {
                              showCalendarDatePicker2Dialog(
                                context: context,
                                config:
                                    CalendarDatePicker2WithActionButtonsConfig(),
                                dialogSize: const Size(325, 400),
                              ).then((value) => {
                                    setState(() {
                                      calendarValue = DateFormat('dd.MM.yyyy')
                                          .format(value!.first!);
                                    })
                                  });
                            },
                          ),
                          InputDataItem(
                            labelText: "Отделение",
                            inputValue: departmentValue,
                            iconAction: () {
                              _navigateAndDisplaySelection(
                                      context, DictionaryType.departments)
                                  .then((value) {
                                setState(() {
                                  departmentValue = value;
                                });
                              });
                            },
                          ),
                          TextField(
                            controller: TextEditingController(
                                text: representativeValue),
                            textAlign: TextAlign.start,
                            maxLines: 1,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color(0xff000000),
                            ),
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  icon: SvgPicture.asset(
                                      "assets/images/icons_grey_ic_list.svg"),
                                  onPressed: () {
                                    _navigateAndDisplaySelection(context,
                                            DictionaryType.representatives)
                                        .then((value) {
                                      setState(() {
                                        representativeValue = value;
                                      });
                                    });
                                  },
                                ),
                                disabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                labelText: "Представитель",
                                labelStyle: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                                contentPadding:
                                    EdgeInsets.fromLTRB(12, 0, 12, 0)),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            width: MediaQuery.of(context).size.width,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Color(0x20000000),
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.zero,
                              border: Border.all(
                                  color: Color(0x20000000), width: 0),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.fromLTRB(12, 2, 0, 2),
                              child: Text(
                                "НАЗНАЧЕНИЕ ВЗНОСА",
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                            child: InputDataItem(
                              labelText: "Тип назначения",
                              inputValue: purposeValue,
                              iconAction: () {
                                _navigateAndDisplaySelection(
                                        context, DictionaryType.purpose)
                                    .then((value) {
                                  setState(() {
                                    purposeValue = value;
                                  });
                                });
                              },
                            ),
                          ),
                          InputDataItem(
                            labelText: "№ договора",
                            inputValue: contractNumberValue,
                            onTextChangedAction: (String text) {
                              contractNumberValue = text;
                            },
                          ),
                          InputDataItem(
                            labelText: "Дата договора",
                            inputValue: contractDateValue,
                            iconAction: () {
                              showCalendarDatePicker2Dialog(
                                context: context,
                                config:
                                    CalendarDatePicker2WithActionButtonsConfig(),
                                dialogSize: const Size(325, 400),
                              ).then((value) => {
                                    setState(() {
                                      contractDateValue =
                                          DateFormat('dd.MM.yyyy')
                                              .format(value!.first!);
                                    })
                                  });
                            },
                          ),
                        ],
                      )),
                ],
              )),
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ConfirmScreen(
                              amount: amountValue ?? "",
                              visitDay: calendarValue ?? "",
                              account: accountEntity?.account ?? "",
                              department: departmentValue ?? "",
                              purpose: purposeValue ?? "",
                              representative: representativeValue ?? "",
                            )),
                  );
                },
                color: Color(0xffef3939),
                elevation: 0,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  "Отправить",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                textColor: Color(0xffffffff),
                height: 55,
                minWidth: MediaQuery.of(context).size.width,
              ),
            ],
          ),
        ),
      ],
    ));
  }

  Future<String> _navigateAndDisplaySelection(
      BuildContext context, DictionaryType type) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => DictionaryScreen(
                type: type,
              )),
    );
    return result;
  }
}
