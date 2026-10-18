import 'package:flutter/material.dart';

void main() {
  runApp(const SyriaGrade2App());
}

class SyriaGrade2App extends StatelessWidget {
  const SyriaGrade2App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'أبطال الصف الثاني',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F8FF),
      appBar: AppBar(
        title: const Text(
          'أبطال الصف الثاني الابتدائي 🇸🇾',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            const Text(
              'أهلاً بك يا بطل! اختر المادة لنبدأ التعلم:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.teal),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 25),
            Expanded(
              child: ListView(
                children: [
                  _buildSubjectCard(
                    context,
                    title: 'اللغة العربية',
                    icon: Icons.menu_book_rounded,
                    color: Colors.orange,
                    subtitle: 'حروف، كلمات، وقراءة ممتعة',
                  ),
                  const SizedBox(height: 15),
                  _buildSubjectCard(
                    context,
                    title: 'الرياضيات',
                    icon: Icons.calculate_rounded,
                    color: Colors.blue,
                    subtitle: 'الأعداد، الجمع، والطرح',
                  ),
                  const SizedBox(height: 15),
                  _buildSubjectCard(
                    context,
                    title: 'العلوم والتربية الوطنية',
                    icon: Icons.eco_rounded,
                    color: Colors.green,
                    subtitle: 'اكتشف العالم من حولك',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubjectCard(
    BuildContext context, {
    required String title,
    required IconData icon,
    required Color color,
    required String subtitle,
  }) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('قريباً: قسم $title!', style: const TextStyle(fontSize: 16)),
              backgroundColor: color,
              duration: const Duration(seconds: 1),
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [color.withOpacity(0.85), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                child: Icon(icon, size: 35, color: color),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      subtitle,
                      style: TextStyle(fontSize: 14, color: Colors.white.withOpacity(0.9)),
                      
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
