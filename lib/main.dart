import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';

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
// شاشة قسم: العربية لغتي
// ==========================================
class ArabicSubjectPage extends StatelessWidget {
  const ArabicSubjectPage({super.key});

  Future<void> _openOfflinePdf(BuildContext context) async {
    try {
      final ByteData data = await rootBundle.load('assets/books/arabic_book.pdf');
      final Directory tempDir = await getTemporaryDirectory();
      final File tempFile = File('${tempDir.path}/arabic_book.pdf');
      await tempFile.writeAsBytes(data.buffer.asUint8List(), flush: true);

      if (context.mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PdfViewerPage(
              filePath: tempFile.path,
              title: 'كتاب العربية لغتي',
            ),
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('يرجى التأكد من مسار رفع ملف الكتاب الـ PDF في المستودع'),
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
            
            // 1. الكتاب المدرسي المباشر بدون إنترنت
            _buildSubSectionCard(
              context,
              title: 'الكتاب المدرسي',
              subtitle: 'تصفح كتاب العربية لغتي كاملاً بدون إنترنت (Offline)',
              icon: Icons.menu_book_rounded,
              onTap: () => _openOfflinePdf(context),
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

// ==========================================
// شاشة عرض الـ PDF المدمجة للتصفح
// ==========================================
class PdfViewerPage extends StatefulWidget {
  final String filePath;
  final String title;

  const PdfViewerPage({
    super.key,
    required this.filePath,
    required this.title,
  });

  @override
  State<PdfViewerPage> createState() => _PdfViewerPageState();
}

class _PdfViewerPageState extends State<PdfViewerPage> {
  int _totalPages = 0;
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A4D2E),
        iconTheme: const IconThemeData(color: Color(0xFFD4AF37)),
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Color(0xFFD4AF37),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          if (_totalPages > 0)
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  '${_currentPage + 1} / $_totalPages',
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
            ),
        ],
      ),
      body: PDFView(
        filePath: widget.filePath,
        enableSwipe: true,
        swipeHorizontal: false,
        autoSpacing: true,
        pageFling: true,
        onRender: (pages) {
          setState(() {
            _totalPages = pages ?? 0;
          });
        },
        onPageChanged: (page, total) {
          setState(() {
            _currentPage = page ?? 0;
          });
        },
      ),
    );
  }
}
