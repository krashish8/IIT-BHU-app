import 'package:chopper/chopper.dart';
import 'package:iit_app/model/built_post.dart';
import 'package:built_collection/built_collection.dart';

import 'built_value_converter.dart';

part 'post_api_service.chopper.dart';

@ChopperApi(baseUrl: '')
abstract class PostApiService extends ChopperService {
  @Get(path: '/workshops')
  Future<Response<BuiltList<BuiltAllWorkshopsPost>>> getUpcomingWorkshops();

  @Get(path: '/workshops/past')
  Future<Response<BuiltList<BuiltAllWorkshopsPost>>> getPastWorkshops();

  @Get(path: '/workshops/{id}')
  Future<Response<BuiltWorkshopDetailPost>> getWorkshopDetailsPost(
      @Path('id') int id, @Header('Authorization') String token);

  @Get(path: '/councils')
  Future<Response<BuiltList<BuiltAllCouncilsPost>>> getAllCouncils();

  @Get(path: '/councils/{id}')
  Future<Response<BuiltCouncilPost>> getCouncil(@Path('id') int id);

  @Get(path: '/clubs/{id}')
  Future<Response<BuiltClubPost>> getClub(
      @Path('id') int id, @Header('Authorization') String token);

  @Get(path: '/profile')
  Future<Response<BuiltClubPost>> getProfile();

  @Get(path: '/team')
  Future<Response<BuiltList<BuiltTeamMemberPost>>> getTeam();

  @Post()
  Future<Response<BuiltAllWorkshopsPost>> postPost(
    @Body() BuiltAllWorkshopsPost body,
  );

  static PostApiService create() {
    final client = ChopperClient(
      baseUrl: 'https://workshops-app-backend.herokuapp.com',
      services: [
        _$PostApiService(),
      ],
      converter: BuiltValueConverter(),
      interceptors: [HttpLoggingInterceptor()],
    );
    return _$PostApiService(client);
  }
}
