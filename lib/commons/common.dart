import 'package:flutter/material.dart';
Color pink=Colors.pink;

void changescreen(BuildContext context,Widget widget)

{
 Navigator.push(context, MaterialPageRoute(builder: (context)=>widget));
}
void changescreenReplacement(BuildContext context,Widget widget)

{
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>widget));
}