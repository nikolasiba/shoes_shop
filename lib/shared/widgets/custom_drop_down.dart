import 'package:flutter/material.dart';
import 'package:shoes_shop/shared/util/responsive.dart';

class CustomDropDownButtom extends StatefulWidget {
  const CustomDropDownButtom(
      {super.key,
      required this.list,
      required this.selectedValue,
      this.borderColor,
      this.textColor,
      this.backgroundColor,
      required this.onChanged});

  final List list;
  final void Function(dynamic) onChanged;
  final Color? borderColor;
  final Color? textColor;
  final String selectedValue;
  final Color? backgroundColor;
  @override
  State<CustomDropDownButtom> createState() => _CustomDropDownButtomState();
}

class _CustomDropDownButtomState extends State<CustomDropDownButtom> {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return Container(
      padding:
          const EdgeInsets.only(top: 20, left: 18.0, right: 18, bottom: 10.0),
      width: responsive.width * .9,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border:
              Border.all(width: 2, color: widget.borderColor ?? Colors.grey),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: DropdownButton(
            dropdownColor: widget.backgroundColor ?? Colors.white,
            underline: const SizedBox(),
            style: TextStyle(
              color: widget.textColor ?? Colors.black,
            ),
            focusColor: widget.backgroundColor ?? Colors.white,

            //decoration: const InputDecoration(border: InputBorder.none),
            value: widget.selectedValue,
            onChanged: widget.onChanged,
            isExpanded: true,
            items: widget.list.map<DropdownMenuItem>((value) {
              return DropdownMenuItem(
                value: value.descripcion,
                child: Text(value.descripcion!),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
