import 'dart:core';
import 'package:flutter/material.dart';

String? selectedBreed = 'akita';

class CustomDropDown extends StatefulWidget {
  const CustomDropDown({Key? key, required this.anyList}) : super(key: key);
  final List<String> anyList;

  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      height: 60,
      child: InputDecorator(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: DropdownButton<String>(
          padding: const EdgeInsets.only(left: 4),
          value: selectedBreed,
          items: widget.anyList.map((String breed) {
            return DropdownMenuItem<String>(
              value: breed,
              child: Text(breed),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
               selectedBreed = newValue!; 
          
              
            });
          },
          underline: Container(), // Alt çizgiyi kaldır
        ),
      ),
    );
  }
}
