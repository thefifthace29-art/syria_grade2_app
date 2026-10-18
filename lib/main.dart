import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A4D2E),
        centerTitle: true,
        elevation: 3,
        title: const Text(
          'سِراج',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Color(0xFFD4AF37),
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

            // 2. بطاقة ترحيبية وإرشادية
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
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.school_rounded, color: Color(0xFF0A4D2E), size: 22),
                  SizedBox(width: 10),
                  Text(
                    'تطبيق تعليمي تربوي للصف الثاني الابتدائي',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF0A4D2E)),
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

            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                'الأقسام الرئيسية:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF0A4D2E)),
              ),
            ),

            const SizedBox(height: 12),

            // الأقسام الرئيسية
            _buildSectionCard(
              context,
              title: 'العربية لغتي',
              subtitle: 'الكتاب المدرسي، التحضير، الأنشطة، والامتحانات',
              icon: Icons.menu_book_rounded,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ArabicSubjectPage()),
                );
              },
            ),
            _buildSectionCard(
              context,
              title: 'الرياضيات',
              subtitle: 'الأعداد والحساب والأشكال الهندسية وفق المنهاج',
              icon: Icons.calculate_rounded,
              onTap: () {
                _showPendingSnackBar(context, 'الرياضيات');
              },
            ),
            _buildSectionCard(
              context,
              title: 'متابعة الطلاب',
              subtitle: 'سجل الحضور والتقييم والملاحظات التربوية',
              icon: Icons.groups_rounded,
              onTap: () {
                _showPendingSnackBar(context, 'متابعة الطلاب');
              },
            ),
            _buildSectionCard(
              context,
              title: 'التحضير',
              subtitle: 'الخطط الدرسية والتحضير اليومي للمواد',
              icon: Icons.assignment_rounded,
              onTap: () {
                _showPendingSnackBar(context, 'التحضير');
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showPendingSnackBar(BuildContext context, String title) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('قسم $title - سنتناول تفاصيله القادمة معاً', style: const TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF0A4D2E),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  Widget _buildSectionCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        elevation: 2,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onTap,
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

// ==========================================
// شاشة قسم: العربية لغتي والتفريعات الأربعة
// ==========================================
class ArabicSubjectPage extends StatelessWidget {
  const ArabicSubjectPage({super.key});

  final String arabicBookUrl = "https://drive.google.com/file/d/1xNmT0d2mk0wqbTsnt4a8iL_98h4mh3Gh/view?usp=drivesdk";

  Future<void> _openBookUrl(BuildContext context) async {
    final Uri url = Uri.parse(arabicBookUrl);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('تعذر فتح رابط الكتاب'),
            backgroundColor: Color(0xFF0A4D2E),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A4D2E),
        elevation: 2,
        iconTheme: const IconThemeData(color: Color(0xFFD4AF37)),
        title: const Text(
          'العربية لغتي',
          style: TextStyle(
            color: Color(0xFFD4AF37),
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'أقسام مادة العربية لغتي:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0A4D2E),
              ),
            ),
            const SizedBox(height: 15),
            
            // 1. الكتاب المدرسي المربوط بالرابط المباشر
            _buildSubSectionCard(
              context,
              title: 'الكتاب المدرسي',
              subtitle: 'كتاب العربية لغتي - الصف الثاني الابتدائي (فتح الكتاب عبر Drive)',
              icon: Icons.menu_book_rounded,
              onTap: () => _openBookUrl(context),
            ),

            // 2. قسم تحضير الدروس
            _buildSubSectionCard(
              context,
              title: 'تحضير الدروس',
              subtitle: 'الخطط والأهداف الإجرائية والوسائل المتبعة لكل درس',
              icon: Icons.assignment_rounded,
              onTap: () {
                _showInfoDialog(
                  context,
                  'تحضير الدروس',
                  'هنا ستجد الخطط الدرسية الجاهزة والمنظمة وفق الوحدات والدروس.',
                );
              },
            ),

            // 3. قسم أنشطة شفهية وكتابية
            _buildSubSectionCard(
              context,
              title: 'أنشطة شفهية وكتابية',
              subtitle: 'تدريبات القراءة، التعبير الشفهي، والإملاء لكل درس',
              icon: Icons.edit_note_rounded,
              onTap: () {
                _showInfoDialog(
                  context,
                  'أنشطة شفهية وكتابية',
                  'تمارين تفاعلية وتدريبات قراءة وإملاء مخصصة لكل درس من دروس الكتاب.',
                );
              },
            ),

            // 4. توليد أوراق عمل واسئلة مذاكرات وامتحانات
            _buildSubSectionCard(
              context,
              title: 'توليد أوراق عمل وامتحانات',
              subtitle: 'توليد نماذج مذاكرات واختبارات وأوراق عمل لكل درس',
              icon: Icons.description_rounded,
              onTap: () {
                _showInfoDialog(
                  context,
                  'توليد أوراق عمل وامتحانات',
                  'نظام يتيح للمعلم والولي أمر توليد اختبارات وأوراق عمل مخصصة.',
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubSectionCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        elevation: 2,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onTap,
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
                        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Color(0xFF0A4D2E)),
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

  void _showInfoDialog(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFFFDFBF7),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(
          title,
          style: const TextStyle(color: Color(0xFF0A4D2E), fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        content: Text(
          content,
          style: const TextStyle(fontSize: 14, color: Colors.black87),
          textAlign: TextAlign.center,
        ),
        actions: [
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0A4D2E),
                foregroundColor: const Color(0xFFD4AF37),
              ),
              onPressed: () => Navigator.pop(context),
              child: const Text('تم'),
            ),
          )
        ],
      ),
    );
  }
}
