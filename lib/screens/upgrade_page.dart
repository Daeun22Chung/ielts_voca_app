import 'package:flutter/material.dart';

class UpgradePage extends StatefulWidget {
  const UpgradePage({super.key});

  @override
  State<UpgradePage> createState() => _UpgradePageState();
}

class _UpgradePageState extends State<UpgradePage> {
  int _selectedPeriod = 3; // 기본값: 3개월
  String _selectedPlan = 'pro'; // 기본값: Pro

  final _prices = {
    1: {'lite': '₩2,900', 'pro': '₩7,900'},
    3: {'lite': '₩2,436', 'pro': '₩6,636'},
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // 여기 추가
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Unlock IELTS\n6.5+ Vocabulary',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              const Text(
                'British pronunciation + Academic expressions',
                style: TextStyle(fontSize: 13, color: Colors.grey),
              ),
              const SizedBox(height: 22),
              _buildTabs(),
              const SizedBox(height: 20),
              _buildPlanCard(
                plan: 'lite',
                price: _prices[_selectedPeriod]!['lite']!,
                features: ['기본 단어 학습', '영국식 발음', '단어 직접 추가'],
              ),
              _buildMostPopularBadge(),
              _buildPlanCard(
                plan: 'pro',
                price: _prices[_selectedPeriod]!['pro']!,
                features: ['기본 단어 학습', '영국식 발음', '단어 직접 추가', '발음 듣기 기능 확장'],
              ),
              const SizedBox(height: 4),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Start 1-Day Free Trial',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Start Learning',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                '자동 갱신됩니다. 언제든지 취소할 수 있습니다.\nPro 플랜 사용자 같은 단어장을 즐겨찾기 하면 구독이 필요합니다.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 11, color: Colors.grey),
              ),
              const SizedBox(height: 24),
              _buildStats(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabs() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(3),
      child: Row(
        children: [
          _tab('일간', 1),
          _tab('3개월  Save 16%', 3, saveHighlight: true),
        ],
      ),
    );
  }

  Widget _tab(String label, int value, {bool saveHighlight = false}) {
    final isSelected = _selectedPeriod == value;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _selectedPeriod = value),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            boxShadow: isSelected
                ? [BoxShadow(color: Colors.black12, blurRadius: 4)]
                : [],
          ),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: isSelected ? Colors.black87 : Colors.grey,
              ),
              children: saveHighlight
                  ? [
                      const TextSpan(text: '3개월  '),
                      TextSpan(
                        text: 'Save 16%',
                        style: TextStyle(
                          color: isSelected ? Colors.blue : Colors.grey,
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ]
                  : [TextSpan(text: label)],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPlanCard({
    required String plan,
    required String price,
    required List<String> features,
  }) {
    final isSelected = _selectedPlan == plan;
    return GestureDetector(
      onTap: () => setState(() => _selectedPlan = plan),
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 0),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey.shade200,
            width: isSelected ? 2 : 1.5,
          ),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              plan == 'lite' ? 'Lite' : 'Pro',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: price,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: Colors.blue,
                    ),
                  ),
                  const TextSpan(
                    text: ' /월',
                    style: TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            ...features.map(
              (f) => Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Row(
                  children: [
                    const Icon(Icons.check, size: 15, color: Colors.blue),
                    const SizedBox(width: 8),
                    Text(
                      f,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 6),
            Center(
              child: RadioGroup<String>(
                groupValue: _selectedPlan,
                onChanged: (v) => setState(() => _selectedPlan = v!),
                child: Radio<String>(
                  value: plan,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMostPopularBadge() {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Text(
          'Most Popular',
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildStats() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const [
        _StatItem(value: '🇬🇧', label: 'British\nPronunciation'),
        _StatItem(value: '6.5+', label: 'IELTS Target\nScore'),
        _StatItem(value: '1,200+', label: 'Academic\nVocabulary'),
      ],
    );
  }
}

class _StatItem extends StatelessWidget {
  final String value;
  final String label;
  const _StatItem({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 11, color: Colors.grey),
        ),
      ],
    );
  }
}
