import 'package:distinct_assignment/data/graphql_service/graphql_service.dart';
import 'package:distinct_assignment/domain/model/profile/user_data_response/user.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ProfileController extends GetxController {
  /// user profile loader
  RxBool prfileDetailLoading = false.obs;

  /// user data
  Rx<User> userData = Rx<User>(User());

  GraphQLService graphQLService = GraphQLService();

  /// get user profile
  Future<void> getUserProfile() async {
    prfileDetailLoading.value = true;
    // if(graphQLService.client == null) {
    await graphQLService.initClient();
    // }
    final client = graphQLService.client;
    try {
      final int userId = 1;
      final Map<String, dynamic> variables = {'id': userId};
      const String query = r'''
                          query GetUser($id: ID!) {
                            user(id: $id) {
                              id
                              name
                              email
                              phone
                              website
                              username
                              address {
                                street
                                city
                                zipcode
                              }
                              company {
                                name
                              }
                            }
                          }
                          ''';

      final result = await client.query(
        QueryOptions(document: gql(query), variables: variables),
      );

      if (result.hasException) {
        // Handle error
        print(result.exception.toString());
        return;
      }

      final data = result.data?['user'];
      if (data != null) {
        userData.value = User.fromJson(data);
      }
    } catch (e) {
      print('Error fetching user profile: $e');
    }
    prfileDetailLoading.value = false;
  }
}
