import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/models/volunteer_post.dart';

part 'volunteer_post_provider.g.dart';

@riverpod
Future<VolunteerPostModel> getVolunteerPost(
  GetVolunteerPostRef ref, {
  required String id,
}) async {
  return VolunteerPostModel(
    id: id,
    shelterId: 'shelterId',
    title: 'title',
    recruitmentAgency: 'organization',
    volunteerPlace: 'region',
    createdAt: 'registrationDate',
    images: [],
    deadline: 'duration',
  );
}
