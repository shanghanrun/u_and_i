import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime firstDay = DateTime.now();
  void onHeartPressed() {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            color: Colors.white,
            height: 300,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (DateTime date) {
                setState(() {
                  firstDay = date;
                });
              },
            ),
          ),
        );
      },
      barrierDismissible: true,
    );
    // setState(() {
    //   firstDay = firstDay.subtract(Duration(days: 1));
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: SafeArea(
          top: true,
          bottom: false,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _DDay(onHeartPressed: onHeartPressed, firstDay: firstDay),
                const _CoupleImage(),
              ])),
    );
  }
}

class _DDay extends StatelessWidget {
  final GestureTapCallback onHeartPressed;
  final DateTime firstDay; // named parameter이다. 값은 상위에서 넣어 준다.

  const _DDay({required this.onHeartPressed, required this.firstDay});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(children: [
      const SizedBox(height: 16),
      Text('U&I', style: textTheme.displayLarge),
      const SizedBox(height: 16),
      Text('우리 처음 만난 날', style: textTheme.bodyLarge),
      Text('${firstDay.year}.${firstDay.month}.${firstDay.day}',
          style: textTheme.bodyMedium),
      const SizedBox(height: 16),
      IconButton(
        iconSize: 60,
        icon: const Icon(Icons.favorite, color: Colors.red),
        onPressed: onHeartPressed,
      ),
      const SizedBox(height: 16),
      Text('D+${DateTime.now().difference(firstDay).inDays + 1}',
          style: textTheme.displayMedium),
    ]);
  }
}

class _CoupleImage extends StatelessWidget {
  const _CoupleImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Image.asset('images/middle_image.png',
            height: MediaQuery.of(context).size.height / 2),
      ),
    );
  }
}
