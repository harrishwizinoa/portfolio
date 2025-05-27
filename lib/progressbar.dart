import 'package:flutter/material.dart';


class ProgressBarScreen extends StatefulWidget {
  @override
  _ProgressBarScreenState createState() => _ProgressBarScreenState();
}

class _ProgressBarScreenState extends State<ProgressBarScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<double>> _animations;

  final List<_PieData> data = [
    _PieData('C', 40, '40%', Colors.red),
    _PieData('C++', 40, '40%', Colors.green),
    _PieData('Java', 45, '45%', Colors.blue),
    _PieData('Flutter', 70, '70%', Colors.purple),
    _PieData('Dart', 65, '65%', Colors.orange),
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animations = data.asMap().entries.map((entry) {
      int index = entry.key;
      return Tween<double>(begin: 0.0, end: entry.value.value / 100).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(
            index * 0.2, // Staggered start for each bar
            1.0,
            curve: Curves.easeInOut,
          ),
        ),
      );
    }).toList();

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return SkillProgressBar(
                  skill: data[index].name,
                  percentage: _animations[index].value,
                  percentageText: data[index].percentage,
                  color: data[index].color,
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class SkillProgressBar extends StatelessWidget {
  final String skill;
  final double percentage;
  final String percentageText;
  final Color color;

  const SkillProgressBar({
    required this.skill,
    required this.percentage,
    required this.percentageText,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          skill,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white),
        ),
        SizedBox(height: 8),
        Stack(
          children: [
            Container(
              height: 20,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            FractionallySizedBox(
              widthFactor: percentage,
              child: Container(
                height: 20,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  percentageText,
                  style: TextStyle(
                    color: percentage > 0.5 ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _PieData {
  final String name;
  final double value;
  final String percentage;
  final Color color;

  _PieData(this.name, this.value, this.percentage, this.color);
}