import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class InputDataItem extends StatelessWidget {
  const InputDataItem({super.key, this.inputValue, this.labelText, this.iconAction, this.textInputType, this.inputFormatter, this.onTextChangedAction});

  final String? inputValue;
  final String? labelText;
  final VoidCallback? iconAction;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatter;
  final Function(String)? onTextChangedAction;

  @override
  Widget build(BuildContext context) {
    IconButton? iconWidget = null;
    if(iconAction != null) {
      iconWidget = IconButton(
        icon: SvgPicture.asset("assets/images/icons_grey_ic_list.svg"),
        onPressed: iconAction,
      );
    }
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 12),
          child: TextField(
            inputFormatters: inputFormatter,
            keyboardType: textInputType,
            readOnly: iconAction != null,
            controller: TextEditingController(text: inputValue),
            textAlign: TextAlign.start,
            maxLines: 1,
            onChanged: onTextChangedAction,
            cursorColor: Colors.white,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xff000000),
            ),
            decoration: InputDecoration(
                suffixIcon: iconWidget,
                disabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                labelText: labelText,
                labelStyle: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
                contentPadding: EdgeInsets.fromLTRB(12, 0, 12, 0)
            ),
          ),
        ),
        const Divider(color: Color(0xff808080)),
      ],
    );
  }
}