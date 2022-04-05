import 'package:flutter/material.dart';

class AcademyYearScreen extends StatelessWidget {
  const AcademyYearScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const academicYears = ['2020/2021', '2021/2022', '2022/2023'];
    return Scaffold(
      body: Center(
          child: ListView.separated(
              itemBuilder: (context, index) => ListTile(
                    title: Text(academicYears[index]),
                  ),
              separatorBuilder: (_, __) => const Divider(),
              itemCount: academicYears.length)),
    );
  }
}
