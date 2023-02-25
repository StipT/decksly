import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:decksly/common/design/colors.dart';
import 'package:decksly/common/design/fonts.dart';
import 'package:decksly/common/dev/asset_loader.dart';
import 'package:decksly/features/deck_builder/ui/bloc/deck_builder_bloc.dart';
import 'package:decksly/navigation/app_router.dart';
import 'package:decksly/l10n/locale_keys.g.dart';
import 'package:decksly/reusable_ui/misc/hs_alert_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeckListFooter extends StatelessWidget {
  const DeckListFooter({
    Key? key,
    required this.onSave,
    required this.onCreateNewDeck,
  }) : super(key: key);

  final VoidCallback onSave;
  final VoidCallback onCreateNewDeck;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeckBuilderBloc, DeckBuilderState>(
      builder: (BuildContext context, state) {
        return Container(
          height: 20.h,
          margin: EdgeInsets.only(bottom: 5.h, left: 15.w, right: 15.w),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: createDeckButton(context),
              ),
              Image.asset(assetPath(SUBFOLDER_MISC, "wood_divider")),
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
        margin: EdgeInsets.only(right: 5.w, top: 2.h, bottom: 3.h),
        child: Stack(
          children: [
            Image.asset(
              assetPath(SUBFOLDER_MISC, "new_deck_button"),
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
            OutlinedButton(
              onPressed: () {
                _showAlert(context, state);
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.white,
                side: const BorderSide(
                  color: Colors.transparent,
                ),
                textStyle: FontStyles.bold15,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.r)),
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
    });
  }

  Widget createDeckButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 7.5.w,
        bottom: 2.5.w,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            assetPath(SUBFOLDER_MISC, "copy_deck_button"),
            fit: BoxFit.fill,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 2.5.h),
            child: OutlinedButton(
              onPressed: () {
                BlocProvider.of<DeckBuilderBloc>(context).add(
                    FetchDeckCodeEvent(context.locale.toStringWithSeparator()));
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.white,
                side: const BorderSide(
                  color: Colors.transparent,
                ),
                textStyle: FontStyles.bold15,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.r)),
              ),
              child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 1.w),
                  child: AutoSizeText(
                    LocaleKeys.copyDeckCode.tr(),
                    style: FontStyles.bold11,
                    minFontSize: 8,
                    maxLines: 1,
                  )),
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
