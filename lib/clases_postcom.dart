
class Post {      //Clase Post creada con extencion JSON
  int userId;     //para la creacion de los Post para la app
  int id;
  String title;
  String body;

  Post(this.userId, this.id, this.title, this.body);

  Post.fromJson(Map<String, dynamic> json){
    userId = json["userId"];
    id = json["id"];
    title = json["title"];
    body = json["body"];
  }
}

//===========================================================================================================================================

class Comment {      //Clase Comment creada con extencion JSON
  int postId;        //para la creacion de los comentarios para la app
  int id;
  String name;
  String email;
  String body;

  Comment(this.postId, this.id, this.name, this.email, this.body);

  Comment.fromJson(Map<String, dynamic> json){
    postId = json["postId"];
    id = json["id"];
    name = json["name"];
    email = json["email"];
    body = json["body"];
  }
}