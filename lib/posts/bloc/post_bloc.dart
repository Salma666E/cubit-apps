import 'dart:convert';

import 'package:counterapp_cubit/posts/bloc/post_event.dart';
import 'package:counterapp_cubit/posts/bloc/post_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../models/post.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc({required this.httpClient}) : super(const PostState()) {
    on<PostFetched>(_onPostFetched);
  }

  final http.Client httpClient;

  Future<void> _onPostFetched(
      PostFetched event, Emitter<PostState> emit) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == PostStatus.initial) {
        final posts = await _fetchPosts();
        return emit(state.copyWith(
          status: PostStatus.success,
          posts: posts,
          hasReachedMax: false,
        ));
      }
      final posts = await _fetchPosts(state.posts.length);
      emit(posts.isEmpty
          ? state.copyWith(hasReachedMax: true)
          : state.copyWith(
              status: PostStatus.success,
              posts: List.of(state.posts)..addAll(posts),
              hasReachedMax: false,
            ));
    } catch (_) {
      emit(state.copyWith(status: PostStatus.failure));
    }
  }

  Future<List<Post>> _fetchPosts([int startIndex = 0]) async {
    final response = await httpClient.get(
      Uri.https(
        'jsonplaceholder.typicode.com',
        '/posts',
        <String, String>{'_start': '$startIndex', '_limit': '20'},
      ),
    );
    if (response.statusCode == 200) {
      final body = json.decode(response.body) as List;
      return body.map((dynamic json) {
        final map = json as Map<String, dynamic>;
        return Post(
          id: map['id'] as int,
          title: map['title'] as String,
          body: map['body'] as String,
        );
      }).toList();
    }
    throw Exception('error fetching posts');
  }
}
