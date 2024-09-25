import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/models/volunteer_board.dart';

part 'volunteer_post_provider.g.dart';

@riverpod
Future<VolunteerPostModel> getVolunteerPost(
  GetVolunteerPostRef ref, {
  required int id,
}) async {
  return VolunteerPostModel(
    id: id,
    title: 'title',
    organization: 'organization',
    region: 'region',
    registrationDate: 'registrationDate',
    imageUrl: 'imageUrl',
    isLiked: false,
    duration: 'duration',
  );
}
