import 'package:flutter/material.dart';
import 'package:flutter_pokedex/models/poke_details.dart';
import 'package:flutter_pokedex/models/pokedex.dart';
import 'package:flutter_pokedex/services/remote_service.dart';
import 'package:flutter_pokedex/views/details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Pokemon>? pokemons;
  PokeDetails? pokeDetails;
  // List<Uri>? pokePics;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();

    ///fetch data from API
    getData();
  }

  getData() async {
    pokemons = await RemoteService().getPokemons();
    // pokePics = await RemoteService().getPokePic(pokemons);
    if (pokemons != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Visibility(
        visible: isLoaded,
        replacement: const Center(child: CircularProgressIndicator()),
        child: Stack(
          children: [
            Positioned(
              top: 150,
              child: Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: Colors.grey.withOpacity(0.6),
                ),
              ),
            ),
            Positioned(
              top: -50,
              right: -50,
              child: Image.asset(
                'assets/images/red-pokeball.png',
                width: 200,
                fit: BoxFit.fitWidth,
              ),
            ),
            Positioned(
              top: 100,
              left: 20,
              child: Text(
                'Pokedex',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.6),
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
            Positioned(
              top: 155,
              bottom: 0,
              width: width,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 2.5),
                itemCount: pokemons?.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return DetailsPage(
                              pokeId: (index + 1),
                            );
                          },
                        ),
                      );
                    },
                    child: Card(
                      child: ListTile(
                        leading: Image(
                          width: 46,
                          height: 46,
                          //image: NetworkImage('${pokePics![index]}'),
                          image: NetworkImage(
                              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${index + 1}.png'),
                        ),
                        title: Text("${pokemons![index].name} "),
                        subtitle: Text("ID:${index + 1}"),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
