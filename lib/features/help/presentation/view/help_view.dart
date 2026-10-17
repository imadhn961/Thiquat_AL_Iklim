import 'package:flutter/material.dart';
import 'package:thiquat_al_iklim/core/utils/app_color.dart';
import 'package:thiquat_al_iklim/features/help/presentation/view/widgets/help_faq_card.dart';
import 'package:thiquat_al_iklim/features/help/presentation/view/widgets/help_header_bar.dart';
import 'package:thiquat_al_iklim/generated/l10n.dart';

class HelpView extends StatelessWidget {
  const HelpView({super.key});

  static const String routeName = 'Help';

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final faqs = [
      (question: s.faq1Question, answer: s.faq1Answer),
      (question: s.faq2Question, answer: s.faq2Answer),
      (question: s.faq3Question, answer: s.faq3Answer),
    ];

    return Scaffold(
      backgroundColor: AppColor.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const HelpHeaderBar(),
              const SizedBox(height: 24),
              Expanded(
                child: ListView.separated(
                  itemCount: faqs.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 16),
                  itemBuilder: (context, index) => HelpFaqCard(
                    question: faqs[index].question,
                    answer: faqs[index].answer,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
