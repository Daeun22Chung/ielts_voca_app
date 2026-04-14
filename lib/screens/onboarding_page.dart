import 'package:flutter/material.dart';
import 'package:ielts_voca_app/screens/home_page.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:ielts_voca_app/main.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: [
          // 페이지1
          PageViewModel(
            title: "IELTS 6.5+ 전용 단어",
            body: "Academic IELTS 6.5 이상의 점수 향상을 위한 필수 어휘 학습",
            image: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Color(0xFFEEF2FF), // 연한 파란 배경
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.import_contacts,
                color: Color(0xFF2563EB), // 파란 아이콘
                size: 44,
              ),
            ),
            decoration: PageDecoration(
              titleTextStyle: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          // 페이지2
          PageViewModel(
            title: "🇬🇧 British Pronunciation",
            body: "영국식 발음으로 정확한 단어 학습 및 실력 향상",
            image: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Color(0xFFEEF2FF), // 연한 파란 배경
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.volume_up,
                color: Color(0xFF2563EB), // 파란 아이콘
                size: 44,
              ),
            ),
            decoration: PageDecoration(
              titleTextStyle: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          // 페이지3
          PageViewModel(
            title: "Academic 예문 기반 학습",
            body: "실전과 유사한 고급 예문으로 단어 활용 능력 향상",
            image: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Color(0xFFEEF2FF), // 연한 파란 배경
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.trending_up,
                color: Color(0xFF2563EB), // 파란 아이콘
                size: 44,
              ),
            ),
            decoration: PageDecoration(
              titleTextStyle: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ],
        next: Text("Next", style: TextStyle(fontWeight: FontWeight.w600)),
        done: Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
        onDone: () {
          prefs.setBool("isOnboarded", true);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => HomePage()),
          );
        },
      ),
    );
  }
}
