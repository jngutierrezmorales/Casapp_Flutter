import 'package:casapp/src/classes/modules/favorites/bloc/favorites_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/home_model.dart';

class FavoritesPage extends StatefulWidget {
  static const favoritesPage = "favoritesPage";

  FavoritesPage();

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  late FavoritesBloc _favoritesBloc;
  HomeModel homeModel = HomeModel();

  @override
  void initState() {
    _favoritesBloc = BlocProvider.of<FavoritesBloc>(context);
    _favoritesBloc.add(GetFavoritesHomesEvent(context: context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesBloc, FavoritesState>(
        builder: (context, state) {
      if (state is FavoritesInitialState) {
        return ListView.builder(
          itemCount: state.listHomes.length,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return FavoriteCard(state.listHomes[index]);
          },
        );
      } else {
        return const Center(
          child: Text(
            "No tienes favoritos todavía",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
        );
      }
    });
  }

  FavoriteCard(HomeModel homeModel) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 5,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    homeModel.imageUrl,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 120,
                    color: Colors.amber,
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Center(
                      child: Text(
                        homeModel.homeStateFor.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: [
                      const Icon(
                        Icons.room,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(homeModel.location),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.home,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(homeModel.size + 'm'),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.euro,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(homeModel.price),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
