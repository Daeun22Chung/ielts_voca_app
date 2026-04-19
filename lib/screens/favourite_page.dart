import 'package:flutter/material.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  final List<Map<String, dynamic>> favouriteWords = [
    {
      'word': 'implement',
      'pronunciation': '/ˈɪmplɪment/',
      'partOfSpeech': 'VERB',
      'meaning': '시행하다, 실행하다',
      'synonyms': ['execute', 'carry out', 'apply'],
      'example': '"The government will implement new policies next year."',
      'tag': 'IELTS',
      'isFlipped': false,
    },
    {
      'word': 'facilitate',
      'pronunciation': '/fəˈsɪlɪteɪt/',
      'partOfSpeech': 'VERB',
      'meaning': '용이하게 하다, 촉진하다',
      'synonyms': ['enable', 'assist', 'promote'],
      'example':
          '"Good infrastructure facilitates economic growth in developing regions."',
      'tag': 'IELTS',
      'isFlipped': false,
    },
    {
      'word': 'substantial',
      'pronunciation': '/səbˈstænʃəl/',
      'partOfSpeech': 'ADJECTIVE',
      'meaning': '상당한, 실질적인',
      'synonyms': ['significant', 'considerable', 'notable'],
      'example':
          '"There has been a substantial rise in renewable energy usage worldwide."',
      'tag': 'IELTS',
      'isFlipped': false,
    },
    {
      'word': 'deteriorate',
      'pronunciation': '/dɪˈtɪəriəreɪt/',
      'partOfSpeech': 'VERB',
      'meaning': '악화되다, 저하되다',
      'synonyms': ['worsen', 'decline', 'degrade'],
      'example':
          '"Air quality continues to deteriorate in heavily industrialised cities."',
      'tag': 'IELTS',
      'isFlipped': false,
    },
    {
      'word': 'allocate',
      'pronunciation': '/ˈæləkeɪt/',
      'partOfSpeech': 'VERB',
      'meaning': '배분하다, 할당하다',
      'synonyms': ['assign', 'distribute', 'apportion'],
      'example':
          '"Governments must allocate sufficient funds to public healthcare systems."',
      'tag': 'IELTS 6.5',
      'isFlipped': false,
    },
    {
      'word': 'sustainable',
      'pronunciation': '/səˈsteɪnəbl/',
      'partOfSpeech': 'ADJECTIVE',
      'meaning': '지속 가능한',
      'synonyms': ['viable', 'renewable', 'eco-friendly'],
      'example':
          '"Sustainable farming practices help preserve natural resources for future generations."',
      'tag': 'IELTS 6.5',
      'isFlipped': false,
    },
    {
      'word': 'prominent',
      'pronunciation': '/ˈprɒmɪnənt/',
      'partOfSpeech': 'ADJECTIVE',
      'meaning': '두드러진, 저명한',
      'synonyms': ['notable', 'leading', 'distinguished'],
      'example':
          '"She became a prominent figure in the field of environmental science."',
      'tag': 'IELTS 7',
      'isFlipped': false,
    },
    {
      'word': 'consequently',
      'pronunciation': '/ˈkɒnsɪkwəntli/',
      'partOfSpeech': 'ADVERB',
      'meaning': '결과적으로, 따라서',
      'synonyms': ['therefore', 'as a result', 'thus'],
      'example':
          '"The factory was shut down; consequently, hundreds of workers lost their jobs."',
      'tag': 'IELTS 6.5',
      'isFlipped': false,
    },
    {
      'word': 'migration',
      'pronunciation': '/maɪˈɡreɪʃən/',
      'partOfSpeech': 'NOUN',
      'meaning': '이주, 이동',
      'synonyms': ['movement', 'relocation', 'displacement'],
      'example':
          '"Mass migration to urban areas has led to overcrowding in many cities."',
      'tag': 'IELTS 8',
      'isFlipped': false,
    },
    {
      'word': 'infrastructure',
      'pronunciation': '/ˈɪnfrəstrʌktʃər/',
      'partOfSpeech': 'NOUN',
      'meaning': '기반 시설, 인프라',
      'synonyms': ['framework', 'foundation', 'system'],
      'example':
          '"Investing in infrastructure is essential for long-term economic development."',
      'tag': 'IELTS 8',
      'isFlipped': false,
    },
  ];

  void _toggleFlip(int index) {
    setState(() {
      favouriteWords[index]['isFlipped'] = !favouriteWords[index]['isFlipped'];
    });
  }

  void _removeFavorite(int index) {
    setState(() {
      favouriteWords.removeAt(index);
    });
  }

  void _showAddWordDialog() {
    final wordController = TextEditingController();
    final meaningController = TextEditingController();
    final synonymsController = TextEditingController();
    final exampleController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    final List<String> selectedPosList = []; // 품사 선택 리스트

    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '단어 추가하기',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              '나만의 단어를 추가하여 학습하세요',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.close, size: 20),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // 단어 * (필수)
                  _dialogLabel('단어', required: true),
                  TextFormField(
                    controller: wordController,
                    decoration: _inputDecoration('예: substantial'),
                    validator: (v) =>
                        (v == null || v.trim().isEmpty) ? '단어를 입력하세요' : null,
                  ),
                  const SizedBox(height: 16),

                  // 품사 부분 교체
                  _dialogLabel('품사'),
                  StatefulBuilder(
                    builder: (context, setStateDialog) {
                      const posList = [
                        ('NOUN', 'Noun (명사)'),
                        ('VERB', 'Verb (동사)'),
                        ('ADJECTIVE', 'Adjective (형용사)'),
                        ('ADVERB', 'Adverb (부사)'),
                        ('PHRASE', 'Phrase (구)'),
                      ];
                      return Wrap(
                        spacing: 5,
                        runSpacing: 5,
                        children: posList.map((pos) {
                          final isSelected = selectedPosList.contains(pos.$1);
                          return GestureDetector(
                            onTap: () {
                              setStateDialog(() {
                                isSelected
                                    ? selectedPosList.remove(pos.$1)
                                    : selectedPosList.add(pos.$1);
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: isSelected ? Colors.blue : Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: isSelected
                                      ? Colors.blue
                                      : Colors.grey.shade300,
                                ),
                              ),
                              child: Text(
                                pos.$2,
                                style: TextStyle(
                                  fontSize: 13,
                                  color: isSelected
                                      ? Colors.white
                                      : Colors.black54,
                                  fontWeight: isSelected
                                      ? FontWeight.w600
                                      : FontWeight.normal,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  // 뜻 * (필수)
                  _dialogLabel('뜻 (한국어)', required: true),
                  TextFormField(
                    controller: meaningController,
                    decoration: _inputDecoration('예: 상당한, 실질적인'),
                    validator: (v) =>
                        (v == null || v.trim().isEmpty) ? '뜻을 입력하세요' : null,
                  ),
                  const SizedBox(height: 16),

                  // 동의어 (선택)
                  _dialogLabel('동의어'),
                  TextFormField(
                    controller: synonymsController,
                    decoration: _inputDecoration(
                      '쉼표로 구분: considerable, significant',
                    ),
                  ),
                  const SizedBox(height: 16),

                  // 예문 (선택)
                  _dialogLabel('예문'),
                  TextFormField(
                    controller: exampleController,
                    decoration: _inputDecoration(
                      '예: There has been a substantial...',
                    ),
                    maxLines: 3,
                  ),
                  const SizedBox(height: 24),

                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => Navigator.pop(context),
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            side: BorderSide(color: Colors.grey.shade300),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            '취소',
                            style: TextStyle(color: Colors.black87),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            if (!formKey.currentState!.validate()) return;
                            final synonyms =
                                synonymsController.text.trim().isEmpty
                                ? <String>[]
                                : synonymsController.text
                                      .split(',')
                                      .map((s) => s.trim())
                                      .where((s) => s.isNotEmpty)
                                      .toList();
                            setState(() {
                              favouriteWords.add({
                                'word': wordController.text.trim(),
                                'pronunciation': '',
                                'partOfSpeech': selectedPosList.join(
                                  ', ',
                                ), // 예: "NOUN, VERB"
                                'meaning': meaningController.text.trim(),
                                'synonyms': synonyms,
                                'example': exampleController.text.trim(),
                                'tag': 'MY',
                                'isFlipped': false,
                              });
                            });
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            '추가하기',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _dialogLabel(String text, {bool required = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: RichText(
        text: TextSpan(
          text: text,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
          children: required
              ? const [
                  TextSpan(
                    text: ' *',
                    style: TextStyle(color: Colors.red),
                  ),
                ]
              : [],
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(fontSize: 13, color: Colors.grey),
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.blue),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: TextButton.icon(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.chevron_left, color: Colors.black87),
          label: Text(
            '뒤로',
            style: TextStyle(color: Colors.black87, fontSize: 14),
          ),
        ),
        leadingWidth: 80,
        title: Text(
          '즐겨찾기',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              _showAddWordDialog();
            },
            icon: Icon(Icons.add, color: Colors.black87),
          ),
        ],
      ),
      body: favouriteWords.isEmpty ? _buildEmptyState() : _buildWordList(),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.star_border_rounded,
            size: 72,
            color: Colors.grey.shade300,
          ),
          SizedBox(height: 20),
          Text(
            '즐겨찾기한 단어가 없습니다',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 8),
          Text(
            '학습 중 별표 아이콘을 눌러 단어를 저장하세요',
            style: TextStyle(fontSize: 13, color: Colors.grey),
          ),
          SizedBox(height: 28),
          OutlinedButton.icon(
            onPressed: () {
              _showAddWordDialog();
            },
            icon: Icon(Icons.add, size: 18),
            label: Text('단어 추가하기'),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.black87,
              side: BorderSide(color: Colors.grey.shade300),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWordList() {
    return ListView.separated(
      padding: EdgeInsets.all(16),
      itemCount: favouriteWords.length,
      separatorBuilder: (_, _) => SizedBox(height: 12),
      itemBuilder: (context, index) {
        final word = favouriteWords[index];
        final isFlipped = word['isFlipped'] as bool;

        return GestureDetector(
          onTap: () => _toggleFlip(index),
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: 400),
            transitionBuilder: (child, animation) {
              final rotate = Tween(begin: 1.0, end: 0.0).animate(animation);
              return AnimatedBuilder(
                animation: rotate,
                child: child,
                builder: (context, child) {
                  final angle = rotate.value * 3.14159;
                  final isFront = angle < 1.57;
                  return Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(
                      isFront ? angle : angle - 3.14159,
                    ),
                    child: child,
                  );
                },
              );
            },
            child: isFlipped
                ? _buildBackCard(word, index)
                : _buildFrontCard(word, index),
          ),
        );
      },
    );
  }

  // 앞면 카드 (단어 정보)
  Widget _buildFrontCard(Map<String, dynamic> word, int index) {
    return Container(
      key: ValueKey('front_${word['word']}'),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                word['word'],
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(width: 8),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.volume_up,
                    color: Colors.blue,
                    size: 16,
                  ),
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: () => _removeFavorite(index),
                child: Icon(Icons.star_rounded, color: Colors.amber, size: 26),
              ),
            ],
          ),
          SizedBox(height: 4),
          Text(
            word['pronunciation'],
            style: TextStyle(fontSize: 13, color: Colors.grey),
          ),
          SizedBox(height: 10),
          Text(
            word['partOfSpeech'],
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
              letterSpacing: 1.2,
            ),
          ),
          SizedBox(height: 6),
          Text(
            word['meaning'],
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 12),
          Wrap(
            spacing: 6,
            children: (word['synonyms'] as List<String>)
                .map((s) => _chip(s))
                .toList(),
          ),
        ],
      ),
    );
  }

  // 뒷면 카드 (예문)
  Widget _buildBackCard(Map<String, dynamic> word, int index) {
    return Container(
      key: ValueKey('back_${word['word']}'),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'ACADEMIC EXAMPLE',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: Colors.white70,
                  letterSpacing: 1.2,
                ),
              ),
              SizedBox(width: 8),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Text('🇬🇧', style: TextStyle(fontSize: 12)),
                    SizedBox(width: 4),
                    Text(
                      word['tag'],
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.volume_up,
                    color: Colors.blue,
                    size: 16,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Text(
            word['example'],
            style: TextStyle(
              fontSize: 17,
              color: Colors.white,
              fontStyle: FontStyle.italic,
              height: 1.6,
            ),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                word['word'],
                style: TextStyle(fontSize: 13, color: Colors.white54),
              ),
              GestureDetector(
                onTap: () => _toggleFlip(index),
                child: Row(
                  children: [
                    Icon(
                      Icons.flip_camera_android,
                      size: 14,
                      color: Colors.white70,
                    ),
                    SizedBox(width: 4),
                    Text(
                      '닫기',
                      style: TextStyle(fontSize: 12, color: Colors.white70),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _chip(String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Text(label, style: TextStyle(fontSize: 12, color: Colors.black54)),
    );
  }
}
