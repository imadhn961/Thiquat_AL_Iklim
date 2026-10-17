import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thiquat_al_iklim/core/utils/app_color.dart';
import 'package:thiquat_al_iklim/core/utils/app_text_style.dart';
import 'package:thiquat_al_iklim/features/specialistInbox/data/specialist_inbox_repository_impl.dart';
import 'package:thiquat_al_iklim/features/specialistInbox/presentation/cubit/specialist_inbox_cubit.dart';
import 'package:thiquat_al_iklim/features/specialistInbox/presentation/cubit/specialist_inbox_state.dart';
import 'package:thiquat_al_iklim/features/specialistInbox/presentation/view/widgets/inbox_loading_skeleton.dart';
import 'package:thiquat_al_iklim/features/specialistInbox/presentation/view/widgets/inbox_request_card.dart';
import 'package:thiquat_al_iklim/features/specialistInbox/presentation/view/widgets/specialist_inbox_header.dart';
import 'package:thiquat_al_iklim/generated/l10n.dart';

class SpecialistInboxView extends StatelessWidget {
  const SpecialistInboxView({super.key});

  static const String routeName = 'SpecialistInbox';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          SpecialistInboxCubit(SpecialistInboxRepositoryImpl())
            ..watchRequests(),
      child: Scaffold(
        backgroundColor: AppColor.background,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SpecialistInboxHeader(),
              const SizedBox(height: 20),
              Expanded(
                child: BlocBuilder<SpecialistInboxCubit, SpecialistInboxState>(
                  builder: (context, state) {
                    if (state is SpecialistInboxLoading ||
                        state is SpecialistInboxInitial) {
                      return const InboxLoadingSkeleton();
                    }
                    if (state is SpecialistInboxError) {
                      return Center(
                        child: Text(
                          state.message,
                          style: AppTextStyle.TextSize17.copyWith(
                            color: AppColor.statusError,
                          ),
                        ),
                      );
                    }
                    final requests = (state as SpecialistInboxLoaded).requests;
                    if (requests.isEmpty) {
                      return Center(
                        child: Text(
                          S.of(context).specInboxEmpty,
                          style: AppTextStyle.TextSize17.copyWith(
                            color: AppColor.textSecondary,
                          ),
                        ),
                      );
                    }
                    return ListView.separated(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                      itemCount: requests.length,
                      separatorBuilder: (_, _) => const SizedBox(height: 15),
                      itemBuilder: (context, index) {
                        final request = requests[index];
                        final cubit = context.read<SpecialistInboxCubit>();
                        return InboxRequestCard(
                          request: request,
                          onAccept: () => cubit.acceptRequest(request.id),
                          onStart: () => cubit.startRequest(request.id),
                          onComplete: () => cubit.completeRequest(request.id),
                          onDecline: () => cubit.declineRequest(request.id),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
