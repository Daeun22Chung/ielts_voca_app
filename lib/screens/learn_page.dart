import 'package:flutter/material.dart';

class LearnPage extends StatelessWidget {
  const LearnPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100, // ← 배경 밝은 회색
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
          // 스크롤 가능한 본문
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 단어 + 별표
                      Row(
                        children: [
                          Text(
                            'facilitate',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(Icons.star, color: Colors.amber, size: 28),
                        ],
                      ),

                      SizedBox(height: 8),

                      // 발음 + 오디오 + 국기
                      Row(
                        children: [
                          Text(
                            '/fəˈsɪlɪteɪt/',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
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
                          SizedBox(width: 8),
                          Text('🇬🇧', style: TextStyle(fontSize: 14)),
                          SizedBox(width: 4),
                          Text(
                            'British',
                            style: TextStyle(fontSize: 13, color: Colors.grey),
                          ),
                        ],
                      ),

                      SizedBox(height: 24),
                      Divider(color: Colors.grey.shade200),
                      SizedBox(height: 16),

                      // 품사
                      Text(
                        'VERB',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                          letterSpacing: 1.2,
                        ),
                      ),

                      SizedBox(height: 8),

                      // 뜻
                      Text(
                        '용이하게 하다, 촉진하다',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),

                      SizedBox(height: 24),
                      Divider(color: Colors.grey.shade200),
                      SizedBox(height: 16),

                      // 동의어
                      Text(
                        'SYNONYMS',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          letterSpacing: 1.2,
                        ),
                      ),

                      SizedBox(height: 10),

                      Wrap(
                        spacing: 8,
                        children: [
                          _synonymChip('enable'),
                          _synonymChip('assist'),
                          _synonymChip('help'),
                        ],
                      ),

                      SizedBox(height: 24),
                      Divider(color: Colors.grey.shade200),
                      SizedBox(height: 16),

                      // 예문
                      Row(
                        children: [
                          Text(
                            'EXAMPLE',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                              letterSpacing: 1.2,
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
                        ],
                      ),

                      SizedBox(height: 10),

                      Text(
                        '"Technology can facilitate communication between people across different continents."',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                          fontStyle: FontStyle.normal,
                          height: 1.6,
                        ),
                      ),
                    ],
                  ), // Padding
                ),
              ), // Card
            ), // SingleChildScrollView
          ), // Expanded
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
                    // 이전 버튼
                    Expanded(
                      child: SizedBox(
                        height: 52,
                        child: OutlinedButton.icon(
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(Icons.chevron_left, color: Colors.black87),
                          label: Text(
                            '이전',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: Colors.grey.shade300),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    // 다음 버튼
                    Expanded(
                      flex: 2,
                      child: SizedBox(
                        height: 52,
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: Text(
                            '다음',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                          label: Icon(Icons.chevron_right, color: Colors.white),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
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
                  '다음 버튼을 누르면 학습 완료로 표시됩니다',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _synonymChip(String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Text(
        label,
        style: TextStyle(fontSize: 13, color: Colors.black87),
      ),
    );
  }
}
