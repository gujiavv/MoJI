import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:water_ripple/page/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, @required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Memo',
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.blueGrey.shade900,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      home: const HomePage(),
    );
  }
}



 // return Scaffold(
    //   appBar: AppBar(
    //     //title: const Text('appBar'),
    //     title: const Text('Memo'),
    //   ),
    //   body: Container(),
    // body: Center(
    //   child: Container(
    //     color: Colors.white,
    //     height: 200,
    //     width: 414,
    //     child: const TextField(
    //       obscureText: true, //设置成密码框
    //       showCursor: true,
    //       cursorColor: Colors.cyan,
    //       cursorWidth: 5,
    //       toolbarOptions: ToolbarOptions(
    //         copy: true,
    //         cut: true,
    //         paste: true,
    //         selectAll: true,
    //       ),
    //       decoration: InputDecoration(
    //         fillColor: Color(0x30cccccc),
    //         filled: true,
    //         enabledBorder: OutlineInputBorder(
    //           borderSide: BorderSide(
    //             color: Color(0x00FF0000),
    //           ),
    //           borderRadius: BorderRadius.all(
    //             Radius.circular(100),
    //           ),
    //         ),
    //         hintText: 'QQ号/手机号/邮箱',
    //         focusedBorder: OutlineInputBorder(
    //           borderSide: BorderSide(
    //             color: Color(0x00000000),
    //           ),
    //           borderRadius: BorderRadius.all(Radius.circular(100)),
    //         ),
    //       ),
    //     ),
    //   ),
    // ),
    // );
    // return Scaffold(
    // body: Container(
    //   height: 300,
    //   width: 300,
    //   child: TextField(
    //     decoration: InputDecoration(
    //icon: Icon(Icons.person),
    // labelText: '姓名:'),
    // helperText: '用户名长度为6-10个字母',
    // hintText: '请输入用户名',
    // hintStyle: TextStyle(color: Colors.grey),
    // errorText: '用户名输入错误',
    // errorStyle: TextStyle(fontSize: 12),
    // errorMaxLines: 1,
    // errorBorder: OutlineInputBorder(
    //   borderSide: BorderSide(color: Colors.red),
    // ),
    //   ),
    // ),
    // child: RichText(
    //   text: TextSpan(
    //       style: DefaultTextStyle.of(context).style,
    //       children: <InlineSpan>[
    //         const TextSpan(
    //           text: '老孟',
    //           style: TextStyle(
    //             color: Colors.red,
    //             fontSize: 16,
    //           ),
    //         ),
    //         const TextSpan(
    //             text: ',',
    //             style: TextStyle(
    //               color: Colors.blueAccent,
    //               fontSize: 16,
    //             )),
    //         TextSpan(
    //           text: '一个有态度的程序员',
    //           style: const TextStyle(
    //             color: Colors.blueAccent,
    //             fontSize: 16,
    //           ),
    //           recognizer: TapGestureRecognizer()
    //             ..onTap = () {
    //               print('TapGestureRecognizer');
    //             },
    //         ),
    //       ]),
    // ),
    //   ),
    // );