import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thiquat_al_iklim/core/Functions/getLetter.dart';
import 'package:thiquat_al_iklim/core/services/auth_firebase.dart';
import 'package:thiquat_al_iklim/core/utils/app_color.dart';
import 'package:thiquat_al_iklim/core/utils/app_text_style.dart';
import 'package:thiquat_al_iklim/core/widgets/Custom_text_form_field.dart';
import 'package:thiquat_al_iklim/core/widgets/custom_button.dart';
import 'package:thiquat_al_iklim/features/review/presentation/cubit/review_cubit.dart';
import 'package:thiquat_al_iklim/features/review/presentation/cubit/review_state.dart';
import 'package:thiquat_al_iklim/generated/l10n.dart';

class ReviewViewBody extends StatefulWidget {
  const ReviewViewBody({
    super.key,
    required this.specialistId,
    required this.specialistName,
    required this.bookingId,
  });

  final String specialistId;
  final String specialistName;
  final String bookingId;

  @override
  State<ReviewViewBody> createState() => _ReviewViewBodyState();
}

class _ReviewViewBodyState extends State<ReviewViewBody> {
  int _stars = 0;
  String _comment = '';

  void _submit(BuildContext context) {
    context.read<ReviewCubit>().submitRating(
      specialistId: widget.specialistId,
      raterId: AuthFirebase().currentUser!.uid,
      bookingId: widget.bookingId,
      stars: _stars,
      comment: _comment,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ReviewCubit, ReviewState>(
      listener: (context, state) {
        if (state is ReviewSuccess) {
          Navigator.pop(context);
        } else if (state is ReviewError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 24),
            CircleAvatar(
              radius: 28,
              backgroundColor: AppColor.roleClientPrimary,
              child: Text(
                getLetter(context, widget.specialistName),
                style: AppTextStyle.TextSize19.copyWith(
                  color: AppColor.surface,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              S.of(context).reviewQuestion(widget.specialistName),
              textAlign: TextAlign.center,
              style: AppTextStyle.TextSize19,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                final starValue = index + 1;
                return IconButton(
                  onPressed: () => setState(() => _stars = starValue),
                  icon: Icon(
                    starValue <= _stars
                        ? Icons.star_rounded
                        : Icons.star_border_rounded,
                    color: AppColor.roleCTA,
                    size: 32,
                  ),
                );
              }),
            ),
            const SizedBox(height: 8),
            CustomTextFormField(
              onchanged: (value) => _comment = value,
              hintText: S.of(context).reviewCommentHint,
              typeText: TextInputType.multiline,
              maxLines: 4,
            ),

            const Spacer(),
            BlocBuilder<ReviewCubit, ReviewState>(
              builder: (context, state) {
                final isSubmitting = state is ReviewSubmitting;
                return GestureDetector(
                  onTap: _stars == 0 || isSubmitting
                      ? null
                      : () => _submit(context),
                  child: Opacity(
                    opacity: _stars == 0 ? 0.5 : 1,
                    child: isSubmitting
                        ? const SizedBox(
                            height: 50,
                            child: Center(
                              child: CircularProgressIndicator(
                                color: AppColor.roleCTA,
                              ),
                            ),
                          )
                        : CustomButton(
                            authSendOtp2: S.of(context).reviewSubmit,
                            color: AppColor.roleCTA,
                          ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
