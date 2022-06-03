import 'package:casapp/src/classes/modules/favorites/bloc/favorites_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/home_model.dart';
import '../../home/bloc/home_bloc.dart';

class FavoritesPage extends StatefulWidget {
  static const favoritesPage = "favoritesPage";

  List<HomeModel> listFavoriteHomes = [];

  FavoritesPage(this.listFavoriteHomes);

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  late FavoritesBloc _favoritesBloc;
  HomeModel homeModel = HomeModel();

  @override
  void initState() {
    _favoritesBloc = BlocProvider.of<FavoritesBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is HomeSuccess) {
          widget.listFavoriteHomes = state.listHomes;
        }
      },
      child: BlocBuilder<FavoritesBloc, FavoritesState>(
        builder: (context, state) {
          if (state is FavoritesInProgress) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );
          } else {
            final List<HomeModel?> favoriteHomes =
                widget.listFavoriteHomes.map((e) {
              if (e.isFavorite == true) {
                return e;
              }
            }).toList();
            return RefreshIndicator(
              onRefresh: () async {

              },
              child: ListView.builder(
                itemCount: favoriteHomes.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  if (favoriteHomes[index] == null) {
                    return Container();
                  } else {
                    return FavoriteCard(context, favoriteHomes[index]!);
                  }
                },
              ),
              color: Colors.white,
              backgroundColor: Colors.black,
            );
          }
        },
      ),
    );
  }
}

FavoriteCard(BuildContext context, HomeModel homeModel) {
  return GestureDetector(
    onTap: () => _navigateToDetail(context, homeModel),
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
                  width: 130,
                  color: Colors.black,
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 20,
                  ),
                  child: Center(
                    child: Text(
                      homeModel.homeState,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Colors.white,
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
                      width: 1,
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
                      width: 2,
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
                      width: 1,
                    ),
                    Text(
                      homeModel.price,
                    ),
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

_navigateToDetail(BuildContext context, HomeModel homeModel) {
  BlocProvider.of<FavoritesBloc>(context).add(
    FavoritesNavigateToDetailEvent(context: context, homeModel: homeModel),
  );
}
