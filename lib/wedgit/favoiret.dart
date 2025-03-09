  import 'package:flutter/material.dart';
  import 'package:movie_app/main.dart';
import 'package:movie_app/view/show_deatiles.dart';

  class Favoiret extends StatefulWidget {
    const Favoiret({super.key});

  @override
  State<Favoiret> createState() => _FavoiretState();
}



class _FavoiretState extends State<Favoiret> {
  var data = myBox!.get("key3");

@override
  void initState() {
    // TODO: implement initState

setState(() {
  print(data);
});

    super.initState();
  }

    @override
    Widget build(BuildContext context) {
      return  Scaffold(
          body:  
            data == null 
                ? Center(
                    child: Text('No data'),
                  )
                :
 GridView.builder(
          padding: const EdgeInsets.all(8.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.5,
          ),
          itemCount: data.length,
          itemBuilder: (BuildContext context, int i) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    InkWell(
                      onTap: () => {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ShowDeatiles(movieDeatiles: data[i],)))
                      },
                      child:  Image.network(
                                        "https://image.tmdb.org/t/p/w500/${data[i]['poster_path']}",
                                        fit: BoxFit.cover,
                                      )
                    ),
                    const SizedBox(height: 8),
                    Text(
                      data[i]['name'] ,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Color.fromRGBO(255, 195, 25, 1),
                          size: 20,
                        ),
                        const SizedBox(width: 4),
                        // Text(
                          // data[i]['vote_average'],
                          // style: const TextStyle(
                            // fontSize: 12,
                            // color: Color.fromRGBO(156, 156, 156, 1),
                          // ),
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        );
      }
    }
