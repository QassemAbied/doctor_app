import 'package:app_links/app_links.dart';
import '../utils/app_router/navigator_service.dart';
import '../utils/app_router/routes.dart';


class DeepLinkService {
  final AppLinks _appLinks = AppLinks();

  Future<void> init() async {
    final initialLink = await _appLinks.getInitialLink();

    if (initialLink != null) {
      _handleLink(initialLink);
    }

    _appLinks.uriLinkStream.listen((uri) {
      _handleLink(uri);
    });
  }

  void _handleLink(Uri uri) {
    print(uri);

    if (uri.host == 'reset-password') {
      navigatorKey.currentState?.pushNamed(Routes.updatePasswordScreen);
    }
  }
}
