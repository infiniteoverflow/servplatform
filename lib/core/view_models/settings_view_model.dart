import 'package:app_settings/app_settings.dart';
import 'package:servplatform/core/constant/view_routes.dart';
import 'package:servplatform/core/enums/view_state.dart';
import 'package:servplatform/core/services/auth/auth_service.dart';
import 'package:servplatform/core/services/dialog/dialog_service.dart';
import 'package:servplatform/core/services/navigation/navigation_service.dart';
import 'package:servplatform/core/utils/logger.dart';
import 'package:servplatform/core/view_models/base_view_model.dart';
import 'package:servplatform/locator.dart';

//users
class SettingsViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();

  Future<void> init() async {
    setState(ViewState.Busy);

    setState(ViewState.Idle);
  }

  Future<void> showAlert({
    String title,
    String desc,
    String buttonConfirmText,
  }) async {
    final dialogResult = await _dialogService.showDialog(
      title: title,
      description: desc,
      buttonTitle: buttonConfirmText,
    );

    if (dialogResult.confirmed) {}
  }

  void openAppSettings() {
    Logger.d('User has opened app settings');
    AppSettings.openAppSettings();
  }

  void signOut({
    String title,
    String desc,
    String buttonConfirmText,
  }) async {
    final dialogResult = await _dialogService.showDialog(
      title: title,
      description: desc,
      buttonTitle: buttonConfirmText,
    );

    if (dialogResult.confirmed) {
      Logger.d('User has signed out');
      await _authService.signOut();
      await _navigationService.popAllAndPushNamed(ViewRoutes.login);
    }
  }
}
