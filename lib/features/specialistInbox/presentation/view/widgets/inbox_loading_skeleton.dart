import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:thiquat_al_iklim/features/specialistInbox/data/model/inbox_request.dart';
import 'package:thiquat_al_iklim/features/specialistInbox/presentation/view/widgets/inbox_request_card.dart';
import 'package:thiquat_al_iklim/shared/enums/booking_status.dart';

/// Placeholder list shown while the specialist inbox is loading. Renders a
/// few real [InboxRequestCard]s filled with dummy data, wrapped in a
/// [Skeletonizer] so their shapes shimmer instead of showing a spinner.
class InboxLoadingSkeleton extends StatelessWidget {
  const InboxLoadingSkeleton({super.key});

  static final InboxRequest _placeholder = InboxRequest(
    id: '',
    clientName: 'اسم العميل هنا',
    service: 'اسم الخدمة المطلوبة',
    appointmentDate: DateTime(2024),
    address: 'العنوان التقريبي للموعد',
    status: BookingStatus.pending,
  );

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: ListView.separated(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        itemCount: 4,
        separatorBuilder: (_, _) => const SizedBox(height: 15),
        itemBuilder: (_, _) => InboxRequestCard(
          request: _placeholder,
          onAccept: () {},
          onStart: () {},
          onComplete: () {},
          onDecline: () {},
        ),
      ),
    );
  }
}
