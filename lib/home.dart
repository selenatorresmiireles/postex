import 'package:flutter/material.dart';
import 'package:postex/clases_postcom.dart';
import 'package:postex/comments.dart';
import 'package:postex/clase_data.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Data data = new Data();               //objeto para los datos
  List<Post> _post = List<Post>();      //Lista de posts .

  @override
  void initState() {                    //Metodo que arroja los datos del JSON
    data.getPost().then((value) => setState(() {
      _post.addAll(value);
    }));
    super.initState();
  }
  Widget optionIcon(Icon icon, double size, Color color) {  //Widget para los iconos de los post
    return IconButton(
      color: color,
      iconSize: size,
      splashColor: Colors.cyanAccent,
      icon: icon,
      onPressed: () {},
    );
  }

  @override
  Widget build(BuildContext context) {    //Widget poderoso que tiene los colores, los
    return Scaffold(                      //iconos a usar, el tecto, la posicion
      appBar: AppBar(                     //entre otras cosas que dan como resultado
          leading: IconButton(            //la decoracion de la pagina y los enlaces
            splashColor: Colors.pinkAccent,
            icon: Icon(Icons.favorite),
            onPressed: () {},
          ),
          title: Text("Posts"),
          backgroundColor: Colors.cyan[900]),
      body: ListView.builder( //Lista de post
        itemCount: _post.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(5),
            color: Colors.white24,
            child: Column(
              children: <Widget>[
                Padding(
                  padding:
                  const EdgeInsets.only(top: 16.0, right: 20.0, left: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text( //Titulo de los post
                        _post[index].title,
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "\n${_post[index].body}",
                        style: TextStyle(color: Colors.black54),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    margin: EdgeInsets.all(5),
                    width: MediaQuery.of(context).size.width - 40,
                    child: Row(      //Muestra los post
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        optionIcon(Icon(Icons.favorite), 24, Colors.cyan[600]),   //Propiedades de los iconos
                        Text(
                          "0",
                          style: TextStyle(color: Colors.white, fontSize: 20),      //Propiedades de otro icono
                        ),
                        IconButton(
                          color: Colors.cyan[600],                                  //Colores de la pantalla de los post
                          iconSize: 24,
                          splashColor: Colors.blue,
                          icon: Icon(Icons.comment),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Comments(
                                  post: _post[index],
                                )));
                          },
                        ),
                        Text("5",
                            style:
                            TextStyle(color: Colors.cyan, fontSize: 20)),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
