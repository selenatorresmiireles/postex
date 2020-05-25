import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:postex/clases_postcom.dart';

class Data {                                                  //Metodo para obtener los datos de
  Future<List<Post>> getPost() async {                        //los POST
    var url = 'https://jsonplaceholder.typicode.com/posts';
    var response = await http.get(url);
    var posts = List<Post>(); //Lista que guarda los post
    if (response.statusCode == 200) {
      var postsJson = json.decode(response.body);
      for (var postJson in postsJson) {
        posts.add(Post.fromJson(postJson));
      }
    }
    return posts;
  }
  Future<List<Comment>> getComments(int postId) async {       //Metodo para obtener los datos de
    var url = 'https://jsonplaceholder.typicode.com/posts/$postId/comments'; //los COMENTARIOS
    var response = await http.get(url);
    var comments = List<Comment>(); //Lista que guarda los comentario.
    if (response.statusCode == 200) {
      var commentsJson = json.decode(response.body);
      for (var commentJson in commentsJson) {
        comments.add(Comment.fromJson(commentJson));
      }
    }
    return comments;
  }
}