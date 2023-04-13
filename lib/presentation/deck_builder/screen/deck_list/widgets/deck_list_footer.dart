import "package:auto_route/auto_route.dart";
import "package:auto_size_text/auto_size_text.dart";
import "package:decksly/common/design/colors.dart";
import "package:decksly/common/design/fonts.dart";
import "package:decksly/common/dev/asset_loader.dart";
import "package:decksly/common/reusable_ui/misc/hs_alert_dialog.dart";
import "package:decksly/l10n/locale_keys.g.dart";
import "package:decksly/navigation/app_router.dart";
import "package:decksly/presentation/deck_builder/bloc/deck_builder_bloc.dart";
import "package:easy_localization/easy_localization.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

class DeckListFooter extends StatelessWidget {
  const DeckListFooter({
    super.key,
    required this.onSave,
    required this.onCreateNewDeck,
  });

  final VoidCallback onSave;
  final VoidCallback onCreateNewDeck;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeckBuilderBloc, DeckBuilderState>(
      builder: (BuildContext context, state) {
        return Container(
          height: 43.h,
          margin: EdgeInsets.only(bottom: 5.h, left: 15.w, right: 15.w),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: createDeckButton(context),
              ),
              Image.asset(
                assetPath(kSubfolderMisc, "wood_divider"),
                fit: BoxFit.fill,
                height: 33.h,
              ),
              Expanded(
                child: startNewButton(context),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget startNewButton(BuildContext context) {
    return BlocBuilder<DeckBuilderBloc, DeckBuilderState>(
      builder: (BuildContext context, state) {
        return Container(
          height: 45.h,
          padding: EdgeInsets.only(bottom: 8.h, right: 5.w, top: 8.h),
          child: Stack(
            children: [
              Image.asset(
                assetPath(kSubfolderMisc, "new_deck_button"),
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              ),
              OutlinedButton(
                key: const Key("newDeckButton"),
                onPressed: () {
                  _showAlert(context, state);
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.white,
                  side: const BorderSide(
                    color: Colors.transparent,
                  ),
                  textStyle: FontStyles.bold15(),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r)),
                ),
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget createDeckButton(BuildContext context) {
    return Container(
      height: 25.h,
      padding: EdgeInsets.only(left: 7.5.w, bottom: 1.h),
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          Image.asset(
            assetPath(kSubfolderMisc, "copy_deck_button"),
            fit: BoxFit.fill,
          ),
          OutlinedButton(
            key: const Key("fetchDeckCodeButton"),
            onPressed: () {
              BlocProvider.of<DeckBuilderBloc>(context).add(FetchDeckCodeEvent(context.locale.toStringWithSeparator()));
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.white,
              side: const BorderSide(
                color: Colors.transparent,
              ),
              textStyle: FontStyles.bold15(),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r)),
            ),
            child: Container(
              width: double.infinity,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 6.125.h, horizontal: 1.w),
              child: AutoSizeText(
                LocaleKeys.copyDeckCode.tr(),
                style: FontStyles.bold11(),
                minFontSize: 8,
                maxLines: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showAlert(BuildContext context, DeckBuilderState state) {
    if (state.deck.cards.isNotEmpty) {
      HSDialog.show(
        context,
        HSDialogType.alert,
        (dialogContext) {
          Navigator.pop(dialogContext);
          context.pushRoute(const DeckSelectionRoute());
        },
        (dialogContext) => Navigator.pop(dialogContext),
      );
    } else {
      context.pushRoute(const DeckSelectionRoute());
    }
  }
}
