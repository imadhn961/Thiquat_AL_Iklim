import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thiquat_al_iklim/core/utils/app_color.dart';
import 'package:thiquat_al_iklim/core/utils/app_text_style.dart';
import 'package:thiquat_al_iklim/core/widgets/Custom_Specialist_container.dart';
import 'package:thiquat_al_iklim/features/home/data/models/category_model.dart';
import 'package:thiquat_al_iklim/features/search/data/search_repository_impl.dart';
import 'package:thiquat_al_iklim/features/search/presentation/cubit/search_cubit.dart';
import 'package:thiquat_al_iklim/features/search/presentation/cubit/search_state.dart';
import 'package:thiquat_al_iklim/generated/l10n.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key, this.initialQuery});

  static const String routeName = 'Search';

  final String? initialQuery;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final cubit = SearchCubit(SearchRepositoryImpl());
        if (initialQuery != null && initialQuery!.trim().isNotEmpty) {
          cubit.search(initialQuery!);
        }
        return cubit;
      },
      child: _SearchScaffold(initialQuery: initialQuery),
    );
  }
}

class _SearchScaffold extends StatefulWidget {
  const _SearchScaffold({this.initialQuery});

  final String? initialQuery;

  @override
  State<_SearchScaffold> createState() => _SearchScaffoldState();
}

class _SearchScaffoldState extends State<_SearchScaffold> {
  late final TextEditingController _controller = TextEditingController(
    text: widget.initialQuery ?? '',
  );
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _onChanged(String value) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 400), () {
      context.read<SearchCubit>().search(value);
    });
  }

  void _onSubmitted(String value) {
    _debounce?.cancel();
    context.read<SearchCubit>().search(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).searchTitle)),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: _controller,
              autofocus: widget.initialQuery == null,
              textInputAction: TextInputAction.search,
              cursorColor: AppColor.textPrimary,
              onChanged: _onChanged,
              onSubmitted: _onSubmitted,
              decoration: InputDecoration(
                hintText: S.of(context).searchHint,
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: AppColor.surface,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(28),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                if (state is SearchInitial) {
                  return _CenteredMessage(text: S.of(context).searchPrompt);
                }
                if (state is SearchLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is SearchError) {
                  return _CenteredMessage(
                    text: state.message,
                    color: AppColor.statusError,
                  );
                }
                final loaded = state as SearchLoaded;
                if (loaded.results.isEmpty) {
                  return _CenteredMessage(text: S.of(context).searchNoData);
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                      child: Text(
                        S.of(context).searchResultsFor(loaded.query),
                        style: AppTextStyle.TextSize16.copyWith(
                          color: AppColor.textSecondary,
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.separated(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                        itemCount: loaded.results.length,
                        separatorBuilder: (_, _) => const SizedBox(height: 15),
                        itemBuilder: (context, index) {
                          final specialist = loaded.results[index];
                          return CustomSpecialistContainer(
                            user: specialist,
                            rebooking: false,
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

String _localizedProfession(BuildContext context, String? specializationKey) {
  if (specializationKey == null || specializationKey.isEmpty) return '';
  for (final category in CategoryData.categories) {
    if (category.nameKey == specializationKey) {
      return category.localizedName(context);
    }
  }
  return specializationKey;
}

class _CenteredMessage extends StatelessWidget {
  const _CenteredMessage({required this.text, this.color});

  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: AppTextStyle.TextSize17.copyWith(
            color: color ?? AppColor.textSecondary,
          ),
        ),
      ),
    );
  }
}
