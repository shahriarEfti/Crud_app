import 'package:crud_rest_api_assignment/Screens/ProductGridViewScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CrudApp extends StatelessWidget {
  const CrudApp ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Crud App',

      theme:_lightThemeData(),
      darkTheme: _darkThemeData(),
      themeMode: ThemeMode.system,
     debugShowCheckedModeBanner: false,
      home: ProductGridView(),

    );

  }
}
ThemeData _lightThemeData(){
  return ThemeData(
    brightness: Brightness.light,
      inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.purple),
          ),
          errorBorder:  OutlineInputBorder(
            borderSide:  BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red)
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green)
          )
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          fixedSize: Size.fromWidth(double.maxFinite),
          padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
          backgroundColor: Colors.purple,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),

          ),),
      )
  );
}
ThemeData _darkThemeData(){
  return ThemeData(
    brightness: Brightness.dark,
      inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.purple),
          ),
          errorBorder:  OutlineInputBorder(
            borderSide:  BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red)
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green)
          )
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          fixedSize: Size.fromWidth(double.maxFinite),
          padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
          backgroundColor: Colors.purple,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),

          ),),
      )
  );
}