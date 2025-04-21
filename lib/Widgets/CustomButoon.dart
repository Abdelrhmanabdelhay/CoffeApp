import 'package:flutter/material.dart';
import 'package:untitled1/colors.dart';
class CustomButton extends StatelessWidget {
 final VoidCallback onTab;
 final String title;
  const CustomButton({super.key,required this.title,required this.onTab});

  @override
  Widget build(BuildContext context) {
    return  Material(
      color: xprimaryColor,
      borderRadius: BorderRadius.circular(15),
      child: InkWell(
        onTap: onTab,
        borderRadius: BorderRadius.circular(15),
        child: SizedBox(
          height: 55,
          width: double.infinity,
          child: Center(
            child: Text(title,style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),),
          ),
        ),
      ),
    );
  }
}
