import 'package:flutter/material.dart';
import 'package:postex/clases_postcom.dart';
import 'package:postex/clase_data.dart';

class Comments extends StatefulWidget {
  final Post post;                        //Objeto Post requerido desde home.

  Comments({@required this.post});

  @override
  _CommentsState createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  Data data =
  new Data();         //Crea los objetos
  List<Comment> _comments =
  List<Comment>(); //Lista de COMENTARIOS

  @override
  void initState() {      //Metodo que avienta los comentarios de los post
    // TODO: implement initState
    super.initState();
    data.getComments(widget.post.id).then((value) => setState(() {
      _comments.addAll(value);
    }));
  }
  Widget optionIcon(Icon icon, double size, Color color) { //widget para los botones de los iconos
    return IconButton(                                     //regresa los iconos
      color: color,
      iconSize: size,
      splashColor: Colors.pinkAccent,                     //Color de los iconos de los comentarios
      icon: icon,
      onPressed: () {},
    );
  }

  @override
  Widget build(BuildContext context) {                    //Metodo widget que regresa un scaffold
    return Scaffold(
        appBar: AppBar(
          title: Text("Comentarios"),
          backgroundColor: Colors.pinkAccent,
        ),
        body: SingleChildScrollView(                      //Evita que se salga algun widget de
          child: Column(                                  //la pantalla
            children: <Widget>[
              Card(
                margin: EdgeInsets.all(5),
                color: Colors.pinkAccent,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 16.0, right: 20.0, left: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            widget.post.title,
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "\n${widget.post.body}",
                            style: TextStyle(color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        margin: EdgeInsets.all(5),
                        width: MediaQuery.of(context).size.width - 40,  //Posiciona el icono
                        child: Row(                                     //Se muestran los iconos de option del post.
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            optionIcon(
                                Icon(Icons.favorite), 24, Colors.cyan[400]), //Propiedades de los iconos
                            Text(                                            //color, tamaño y especifica el icono a usar
                              "0",
                              style:
                              TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            optionIcon(
                                Icon(Icons.comment), 24, Colors.cyan[400]),
                            Text(
                              "${_comments.length}",
                              style:
                              TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(5),
                    height: MediaQuery.of(context).size.height - 320,
                    child: ListView.builder( //Muestra los comentarios de los post
                        itemCount: _comments.length,
                        itemBuilder: (context, index) {
                          return Card(
                            color: Colors.pinkAccent,
                            child: ListTile(
                                title: Text(          //arroja el nombre de cada comentario
                                  _comments[index].name,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                                subtitle: Text(
                                    "${_comments[index].email}\n\n${_comments[index].body}",
                                    style: TextStyle(color: Colors.white60)),
                                isThreeLine: true,
                                trailing: optionIcon(
                                    Icon(Icons.comment), 24, Colors.cyan),
                                dense: true,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 20),
                                leading: CircleAvatar(
                                  backgroundImage:
                                  AssetImage('assets/user.png'),
                                )),
                          );
                        }),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}