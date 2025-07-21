import 'dart:developer';
import 'package:distinct_assignment/core/endpoints/graphql_endpoint.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:distinct_assignment/data/local_storage_service/local_storage_pref_service.dart';

class GraphQLService {
  static final GraphQLService _instance = GraphQLService._internal();

  factory GraphQLService() => _instance;

  GraphQLService._internal();

  GraphQLClient? _client;

  Future<void> initClient() async {
    final token = await LocalStoragePrefService.getToken();

    final HttpLink httpLink = HttpLink(
      GraphqlEndpoint.serverEndpoint,
    );

    final AuthLink authLink = AuthLink(
      getToken: () async => 'Bearer ${token.token ?? ""}',
    );

    final Link link = authLink.concat(httpLink);

    _client = GraphQLClient(
      cache: GraphQLCache(store: InMemoryStore()),
      link: link,
    );

    log('GraphQL client initialized');
  }

  GraphQLClient get client {
    if (_client == null) {
      throw Exception(
        'GraphQL client is not initialized. Call initClient() first.',
      );
    }
    return _client!;
  }

  Future<QueryResult> query({
    required String query,
    Map<String, dynamic>? variables,
    FetchPolicy fetchPolicy = FetchPolicy.networkOnly,
  }) async {
    try {
      final result = await client.query(
        QueryOptions(
          document: gql(query),
          variables: variables ?? {},
          fetchPolicy: fetchPolicy,
        ),
      );

      if (result.hasException) {
        log('GraphQL query error: ${result.exception.toString()}');
        throw result.exception!;
      }

      return result;
    } catch (e) {
      log('GraphQL query failed: $e');
      rethrow;
    }
  }

  Future<QueryResult> mutate({
    required String mutation,
    Map<String, dynamic>? variables,
  }) async {
    try {
      final result = await client.mutate(
        MutationOptions(document: gql(mutation), variables: variables ?? {}),
      );

      if (result.hasException) {
        log('GraphQL mutation error: ${result.exception.toString()}');
        throw result.exception!;
      }

      return result;
    } catch (e) {
      log('GraphQL mutation failed: $e');
      rethrow;
    }
  }

  Stream<QueryResult> subscribe({
    required String subscription,
    Map<String, dynamic>? variables,
  }) {
    final Stream<QueryResult> stream = client.subscribe(
      SubscriptionOptions(
        document: gql(subscription),
        variables: variables ?? {},
      ),
    );

    return stream;
  }
}
