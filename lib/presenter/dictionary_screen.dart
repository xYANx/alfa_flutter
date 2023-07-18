import 'package:alfa_mobile/domain/get_analytic_data_use_case.dart';
import 'package:alfa_mobile/service/models/analytic_entity.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import '../dictionary_type.dart';

class DictionaryScreen extends StatefulWidget {
  const DictionaryScreen({super.key, required this.type});

  final DictionaryType type;

  @override
  State<StatefulWidget> createState() => _DepartmentScreen();
}

class _DepartmentScreen extends State<DictionaryScreen> {
  List<AnalyticEntity> departments = [];
  String titleName = "";
  GetAnalyticDataUseCase analyticDataUseCase = GetAnalyticDataUseCase();

  initAnalyticData() {
    Future<List<AnalyticEntity>>? result;
    if(widget.type == DictionaryType.departments) {
      titleName = "Отделения";
      result = analyticDataUseCase.getDepartments();
    } else if (widget.type == DictionaryType.purpose){
      titleName = "Назначение взноса";
      result = analyticDataUseCase.getPurposes();
    } else if (widget.type == DictionaryType.representatives){
      titleName = "Представители";
      result = analyticDataUseCase.getRepresentatives();
    }
    result?.then((it) {
      setState(() {
        departments = it;
      });
    }).catchError((Object obj) {
      // non-200 error goes here.
      switch (obj.runtimeType) {
        case DioError:
        // Here's the sample to get the failed response error code and message
          final res = (obj as DioError).response;
          print('error - ${(obj as DioError).error}');
          // logger.e("Got error : ${res.statusCode} -> ${res.statusMessage}");
          break;
        default:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    if(departments.isEmpty) {
      initAnalyticData();
    }

    departmentItem(AnalyticEntity entity) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(12, 5, 12, 3),
            child: TextButton(
              onPressed: () {}, child: Text(entity.name.toString()),
            ),
          ),
          const Divider(color: Color(0xff808080))
        ],
      );
    }
    List<Widget> widgetsList = [];
    departments.forEach((element) {
      widgetsList.add(departmentItem(element));
    });

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
                title: Text(
                  titleName,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 18,
                    color: Color(0xffffffff),
                  ),
                ),
              ),
              Expanded(
                  child: Container(
                      color: Colors.white,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: ListView.separated(
                        itemCount: departments.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                              alignment: Alignment.centerLeft,
                              child: ListTile(
                                onTap: (){
                                  Navigator.pop(context, departments[index].name);
                                },
                                title: Text(departments[index].name.toString()),
                              )
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) => const Divider(color: Color(0xff808080)),
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