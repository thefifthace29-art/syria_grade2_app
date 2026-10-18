import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('ar', null);
  runApp(const SirajApp());
}

class SirajApp extends StatelessWidget {
  const SirajApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'سِراج',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: const Color(0xFFFDFBF7), // بيج فاتح راقي
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0A4D2E), // أخضر ملكي
          primary: const Color(0xFF0A4D2E),
          secondary: const Color(0xFFD4AF37), // ذهبي
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // قائمة حكم متجددة يومياً
  final List<String> _wisdomList = [
    "العلمُ نورٌ يضيءُ طريقَ المستقبَل.",
    "مَن فَتَحَ مَدرَسَةً، أغلَقَ سِجناً.",
    "اطلبوا العلمَ مِنَ المَهدِ إِلى اللَّحدِ.",
    "القراءةُ للقلبِ كالرياضةِ للجسمِ.",
    "بالعِلمِ وتَقوى اللهِ تَرتقي الأُمَمُ.",
    "مَن صَبَرَ ظَفِرَ، ومَن جَدَّ وَجَدَ.",
    "خيرُ جَليسٍ في الزَّمانِ كِتابُ."
  ];

  String getTodayWisdom() {
    int dayOfYear = DateTime.now().difference(DateTime(DateTime.now().year, 1, 1)).inDays;
    return _wisdomList[dayOfYear % _wisdomList.length];
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('EEEE، d MMMM yyyy', 'ar').format(now);
    String formattedTime = DateFormat('hh:mm a', 'ar').format(now);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A4D2E), // أخضر ملكي
        centerTitle: true,
        elevation: 3,
        title: const Text(
          'سِراج',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Color(0xFFD4AF37), // ذهبي
            letterSpacing: 1.2,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 1. الترويسة الترحيبية والبطاقة التعريفية
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: const Color(0xFF0A4D2E),
                borderRadius: BorderRadius.circular(18),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 3),
                  )
                ],
                border: Border.all(color: const Color(0xFFD4AF37), width: 1.5),
              ),
              child: Column(
                children: [
                  const Text(
                    '﴿ وَقُل رَّبِّ زِدْنِي عِلْمًا ﴾',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFD4AF37),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'سِراج',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFD4AF37),
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'سِراج .. رفيقك في التعلم',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Divider(color: Color(0xFFD4AF37), height: 20, thickness: 0.8),
                  Text(
                    'إعداد وتصميم: مُعتز محمد الأحمد',
                    style: TextStyle(fontSize: 14, color: Colors.white.withOpacity(0.9)),
                  ),
                  const SizedBox(height: 2),
                  const Text(
                    'مدرسةُ الأندلس الثالثة',
                    style: TextStyle(fontSize: 13, color: Color(0xFFD4AF37)),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 15),

            // 2. بطاقة الوقت والتاريخ
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: const Color(0xFFD4AF37).withOpacity(0.5)),
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 5)
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.calendar_today_rounded, color: Color(0xFF0A4D2E), size: 20),
                      const SizedBox(width: 8),
                      Text(
                        formattedDate,
                        style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF0A4D2E)),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.access_time_rounded, color: Color(0xFFD4AF37), size: 20),
                      const SizedBox(width: 5),
                      Text(
                        formattedTime,
                        style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF0A4D2E)),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // 3. بطاقة حكمة اليوم
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F2EB),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: const Color(0xFFD4AF37), width: 1),
              ),
              child: Row(
                children: [
                  const Icon(Icons.format_quote_rounded, color: Color(0xFFD4AF37), size: 28),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'حكمة اليوم:',
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF0A4D2E)),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          getTodayWisdom(),
                          style: const TextStyle(fontSize: 14, fontStyle: FontStyle.italic, color: Colors.black87),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            const Alignment(
              alignment: Alignment.centerRight,
              child: Text(
                'الأقسام الرئيسية:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF0A4D2E)),
              ),
            ),

            const SizedBox(height: 12),

            // 4. الأقسام الرئيسية الأربعة
            _buildSectionCard(
              context,
              title: 'العربية لغتي',
              subtitle: 'الدروس والوحدات القرائية والقواعد وفق المنهاج',
              icon: Icons.menu_book_rounded,
            ),
            _buildSectionCard(
              context,
              title: 'الرياضيات',
              subtitle: 'الأعداد والحساب والأشكال الهندسية وفق المنهاج',
              icon: Icons.calculate_rounded,
            ),
            _buildSectionCard(
              context,
              title: 'متابعة الطلاب',
              subtitle: 'سجل الحضور والتقييم والملاحظات التربوية',
              icon: Icons.groups_rounded,
            ),
            _buildSectionCard(
              context,
              title: 'التحضير',
              subtitle: 'الخطط الدرسية والتحضير اليومي للمواد',
              icon: Icons.assignment_rounded,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        elevation: 2,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('قسم $title - سنتناول تقسيم المنهاج الخاص به معاً', style: const TextStyle(color: Colors.white)),
                backgroundColor: const Color(0xFF0A4D2E),
                duration: const Duration(seconds: 1),
              ),
            );
          },
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFD4AF37).withOpacity(0.4), width: 1),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0A4D2E),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, color: const Color(0xFFD4AF37), size: 28),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF0A4D2E)),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: const TextStyle(fontSize: 12, color: Colors.black54),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.arrow_forward_ios_rounded, color: Color(0xFFD4AF37), size: 18),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
