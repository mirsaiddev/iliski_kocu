import 'package:flutter/material.dart';
import 'package:iliski_kocu/widgets/my_textfield.dart';

class BottomDropdown extends StatefulWidget {
  BottomDropdown({
    Key? key,
    required this.options,
    required this.onSelected,
    required this.selecteds,
  }) : super(key: key);

  final List options;
  final List selecteds;
  final Function(String) onSelected;

  @override
  State<BottomDropdown> createState() => _BottomDropdownState();
}

class _BottomDropdownState extends State<BottomDropdown> {
  String? searchText;

  @override
  Widget build(BuildContext context) {
    List options = this.widget.options.where((element) => element.toLowerCase().contains(searchText ?? '')).toList();
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: SafeArea(
        top: false,
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.75,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          padding: EdgeInsets.all(10).add(EdgeInsets.only(top: 20)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: MyTextField(
                      padding: EdgeInsets.zero,
                      labelText: 'Ara',
                      onChanged: (val) {
                        setState(() {
                          searchText = val.toLowerCase();
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.close),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  itemCount: options.length,
                  separatorBuilder: (context, index) {
                    return Divider(height: 10);
                  },
                  itemBuilder: (context, index) {
                    bool selected = widget.selecteds.contains(options[index]);
                    return Column(
                      children: [
                        ListTile(
                          // color: MyColors.greyLightest2,
                          onTap: () {
                            Navigator.pop(context);
                            widget.onSelected(options[index]);
                          },
                          title: Text(options[index]),
                          trailing: selected ? Icon(Icons.check) : null,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
