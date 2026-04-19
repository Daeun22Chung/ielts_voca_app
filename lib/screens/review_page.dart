import 'package:flutter/material.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({super.key});

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  int? selectedIndex;
  final int correctIndex = 2; // 정답 인덱스

  final List<String> choices = [
    '현대의, 동시대의',
    '애매한, 모호한',
    '용이하게 하다, 촉진하다', // 정답
    '급증하다, 확산하다',
  ];

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
          '1 / 50',
          style: TextStyle(fontSize: 14, color: Colors.black54),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(6),
          child: LinearProgressIndicator(
            value: 6 / 20,
            backgroundColor: Colors.grey.shade200,
            color: Colors.blue,
            minHeight: 6,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Card(
                elevation: 3,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // 안내 문구
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '다음 단어의 뜻을 고르세요',
                          style: TextStyle(fontSize: 14, color: Colors.black54),
                        ),
                      ),

                      SizedBox(height: 25),

                      // 단어
                      Text(
                        'facilitate',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 6),

                      // 발음
                      Text(
                        '/fəˈsɪlɪteɪt/',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),

                      SizedBox(height: 36),

                      // 선택지
                      ...List.generate(choices.length, (index) {
                        return _choiceButton(index);
                      }),
                      // 선택지 아래에 피드백 메시지 추가
                      SizedBox(height: 8),

                      if (selectedIndex != null)
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                          decoration: BoxDecoration(
                            color: selectedIndex == correctIndex
                                ? Colors.green.shade50
                                : Colors.red.shade50,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            selectedIndex == correctIndex
                                ? '정답입니다! 🎉'
                                : '아쉽습니다. 다시 학습해보세요.',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: selectedIndex == correctIndex
                                  ? Colors.green.shade700
                                  : Colors.red.shade700,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // 하단 버튼
          Container(
            padding: EdgeInsets.fromLTRB(24, 12, 24, 24),
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Colors.grey.shade200)),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 52,
                        child: ElevatedButton.icon(
                          onPressed: selectedIndex == null ? null : () {},
                          icon: Text(
                            '다음',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                          label: Icon(Icons.chevron_right, color: Colors.white),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            disabledBackgroundColor: Colors.blue.shade200,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  selectedIndex == null
                      ? '선택지를 고르세요'
                      : '다음 버튼을 누르면 학습 완료로 표시됩니다',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _choiceButton(int index) {
    final isSelected = selectedIndex == index;
    final isCorrect = index == correctIndex;
    final isAnswered = selectedIndex != null;

    Color borderColor = Colors.grey.shade300;
    Color bgColor = Colors.white;
    Color textColor = Colors.black87;

    if (isAnswered) {
      if (isCorrect) {
        borderColor = Colors.green;
        bgColor = Colors.green.shade50;
        textColor = Colors.green.shade700;
      } else if (isSelected && !isCorrect) {
        borderColor = Colors.red;
        bgColor = Colors.red.shade50;
        textColor = Colors.red.shade700;
      }
    } else if (isSelected) {
      borderColor = Colors.blue;
      bgColor = Colors.blue.shade50;
      textColor = Colors.blue;
    }

    return GestureDetector(
      onTap: isAnswered ? null : () => setState(() => selectedIndex = index),
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 12),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: borderColor,
            width: isAnswered && (isCorrect || isSelected) ? 1.5 : 1,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                choices[index],
                style: TextStyle(
                  fontSize: 16,
                  color: textColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            if (isAnswered && isCorrect)
              Icon(Icons.check_circle, color: Colors.green, size: 20),
            if (isAnswered && isSelected && !isCorrect)
              Icon(Icons.cancel, color: Colors.red, size: 20),
          ],
        ),
      ),
    );
  }
}
