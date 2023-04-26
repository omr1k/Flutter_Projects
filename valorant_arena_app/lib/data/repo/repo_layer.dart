import 'dart:html';

import 'package:valorant_arena_app/data/web_services/web_service.dart';

class RepoLayer {
  final WebService apiProvider;
  RepoLayer({required this.apiProvider});

  Future<dynamic> getAgent() async {
    return apiProvider.getAgent();
  }
}