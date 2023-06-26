// ignore: unused_import
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:picnic_app/core/utils/mvp_extensions.dart';
import 'package:picnic_app/features/onboarding/splash/splash_presentation_model.dart';
import 'package:picnic_app/features/onboarding/splash/splash_presenter.dart';
import 'package:picnic_app/features/onboarding/widgets/spiral.dart';
import 'package:picnic_app/localization/app_localizations_utils.dart';
import 'package:picnic_app/resources/assets.gen.dart';
import 'package:picnic_ui_components/ui/theme/picnic_theme.dart';
import 'package:picnic_ui_components/ui/widgets/picnic_button.dart';

class SplashPage extends StatefulWidget with HasPresenter<SplashPresenter> {
  const SplashPage({
    required this.presenter,
    Key? key,
  }) : super(key: key);

  @override
  final SplashPresenter presenter;

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with PresenterStateMixin<SplashViewModel, SplashPresenter, SplashPage> {
  @override
  Widget build(BuildContext context) {
    final theme = PicnicTheme.of(context);
    final styles = theme.styles;
    final colors = theme.colors;

    final blue = theme.colors.blue;
    final body20Blue = styles.body20.copyWith(color: colors.darkBlue.shade600);

    const edgeInsets = EdgeInsets.symmetric(horizontal: 24.0);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Spacer(),
        Padding(
          padding: edgeInsets,
          child: Row(
            children: [
              // ignore: no-magic-number
              Assets.images.picnicLogo.image(scale: 1.5),
              const Gap(8),
              Text(appLocalizations.picnic, style: PicnicTheme.of(context).styles.display10),
            ],
          ),
        ),
        const Spiral(),
        Padding(
          padding: edgeInsets,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(appLocalizations.congratsFormTitle, style: styles.display50),
              const Gap(6.0),
              Text(appLocalizations.appSubtitle, style: body20Blue),
            ],
          ),
        ),
        const Spacer(),
        Padding(
          padding: edgeInsets,
          child: PicnicButton(
            title: appLocalizations.getStartedAction,
            color: blue,
            minWidth: double.infinity,
            onTap: presenter.onTapGetStarted,
          ),
        ),
        Padding(
          padding: edgeInsets,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                appLocalizations.alreadyHaveAnAccountMessage,
                style: body20Blue,
              ),
              TextButton(
                onPressed: presenter.onTapLogin,
                child: Text(
                  appLocalizations.logInAction,
                  style: styles.body20.copyWith(
                    color: blue,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
