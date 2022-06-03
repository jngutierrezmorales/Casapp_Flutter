import 'package:casapp/src/classes/modules/post_new_ad/bloc/post_new_ad_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/home_model.dart';

class PostNewAdPage extends StatefulWidget {
  static const postNewAdPage = "postNewAdPage";

  @override
  State<PostNewAdPage> createState() => _PostNewAdPageState();
}

class _PostNewAdPageState extends State<PostNewAdPage> {
  final TextEditingController? _id = TextEditingController();
  final TextEditingController? _title = TextEditingController();
  final TextEditingController? _description = TextEditingController();
  final TextEditingController? _price = TextEditingController();
  final TextEditingController? _size = TextEditingController();
  final TextEditingController? _location = TextEditingController();
  final TextEditingController? _phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Volver',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.description),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
          child: Column(
            children: [
              const Center(
                child: Text(
                  "Publica un nuevo anuncio",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Introduce id',
                  labelText: 'ID',
                ),
                controller: _id,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Introduce título',
                  labelText: 'Título',
                ),
                controller: _title,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Introduce descripción',
                  labelText: 'Descripción',
                ),
                controller: _description,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Introduce precio',
                  labelText: 'Precio',
                ),
                controller: _price,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Introduce tamaño',
                  labelText: 'Tamaño',
                ),
                controller: _size,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Introduce localización',
                  labelText: 'Localización',
                ),
                controller: _location,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Introduce teléfono',
                  labelText: 'Teléfono',
                ),
                controller: _phone,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  primary: Colors.black,
                ),
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                onPressed: () {
                  BlocProvider.of<PostNewAdBloc>(context).add(
                    PublishNewHomeEvent(
                      HomeModel(
                        id: _id?.text ?? '',
                        title: _title?.text ?? '',
                        description: _description?.text ?? '',
                        imageUrl:
                            'https://www.yaencontre.com/noticias/wp-content/uploads/2018/05/Las-casas-mas-baratas-de-Madrid.jpg',
                        price: _price?.text ?? '',
                        size: _size?.text ?? '',
                        location: _location?.text ?? '',
                        latitude: 40.3907721,
                        longitude: -3.5863844,
                        phone: _phone?.text ?? '',
                        homeState: 'NUEVO',
                        isFavorite: false,
                      ),
                    ),
                  );
                  Navigator.pop(context);
                },
                label: const Text(
                  "Publicar anuncio",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Image.asset(
                'assets/imgs/post_ad_logo.webp',
                width: 500,
                height: 180,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
