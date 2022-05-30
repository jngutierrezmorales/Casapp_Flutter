import 'package:flutter/material.dart';
import '../routing/post_new_ad_routing.dart';

class PostNewAdPage extends StatefulWidget {
  static const postNewAdPage = "postNewAdPage";

  PostNewAdRouting? postNewAdRouting;

  PostNewAdPage(this.postNewAdRouting);

  @override
  State<PostNewAdPage> createState() => _PostNewAdPageState(postNewAdRouting);
}

class _PostNewAdPageState extends State<PostNewAdPage> {
  PostNewAdRouting? postNewAdRouting;

  _PostNewAdPageState(this.postNewAdRouting);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Volver'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
          child: Column(
            children: [
              const Center(
                child: Text(
                  "Anuncia tu vivienda",
                  style: TextStyle(
                    fontSize: 24,
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
                  labelText: 'id *',
                ),
                onSaved: (String? value) {
                  // This optional block of code can be used to run
                  // code when the user saves the form.
                },
                validator: (String? value) {
                  return (value != null && value.contains('@'))
                      ? 'Do not use the @ char.'
                      : null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Introduce titulo',
                  labelText: 'titulo *',
                ),
                onSaved: (String? value) {
                  // This optional block of code can be used to run
                  // code when the user saves the form.
                },
                validator: (String? value) {
                  return (value != null && value.contains('@'))
                      ? 'Do not use the @ char.'
                      : null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Introduce descripción',
                  labelText: 'descripción *',
                ),
                onSaved: (String? value) {
                  // This optional block of code can be used to run
                  // code when the user saves the form.
                },
                validator: (String? value) {
                  return (value != null && value.contains('@'))
                      ? 'Do not use the @ char.'
                      : null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Introduce url imagen',
                  labelText: 'url imagen *',
                ),
                onSaved: (String? value) {
                  // This optional block of code can be used to run
                  // code when the user saves the form.
                },
                validator: (String? value) {
                  return (value != null && value.contains('@'))
                      ? 'Do not use the @ char.'
                      : null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Introduce precio',
                  labelText: 'precio *',
                ),
                onSaved: (String? value) {
                  // This optional block of code can be used to run
                  // code when the user saves the form.
                },
                validator: (String? value) {
                  return (value != null && value.contains('@'))
                      ? 'Do not use the @ char.'
                      : null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Introduce tamaño',
                  labelText: 'tamaño *',
                ),
                onSaved: (String? value) {
                  // This optional block of code can be used to run
                  // code when the user saves the form.
                },
                validator: (String? value) {
                  return (value != null && value.contains('@'))
                      ? 'Do not use the @ char.'
                      : null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Introduce localización',
                  labelText: 'localización *',
                ),
                onSaved: (String? value) {
                  // This optional block of code can be used to run
                  // code when the user saves the form.
                },
                validator: (String? value) {
                  return (value != null && value.contains('@'))
                      ? 'Do not use the @ char.'
                      : null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Introduce teléfono',
                  labelText: 'teléfono *',
                ),
                onSaved: (String? value) {
                  // This optional block of code can be used to run
                  // code when the user saves the form.
                },
                validator: (String? value) {
                  return (value != null && value.contains('@'))
                      ? 'Do not use the @ char.'
                      : null;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(100, 40),
                      primary: Colors.black,
                    ),
                    onPressed: () {},
                    child: const Text("Publicar"),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(100, 40),
                      primary: Colors.black,
                    ),
                    onPressed: () {},
                    child: const Text("Cancelar"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
