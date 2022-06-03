import 'package:casapp/src/classes/models/home_model.dart';
import 'package:casapp/src/classes/modules/property/bloc/property_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PropertyPage extends StatefulWidget {
  static const propertyPage = "propertyPage";

  List<HomeModel> listHomes = [];

  PropertyPage(this.listHomes);

  @override
  _PropertyPageState createState() => _PropertyPageState();
}

class _PropertyPageState extends State<PropertyPage> {
  late PropertyBloc _propertyBloc;
  HomeModel homeModel = HomeModel();

  @override
  void initState() {
    _propertyBloc = BlocProvider.of<PropertyBloc>(context);
    _propertyBloc.add(GetListHomesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {},
      child: ListView.builder(
        itemCount: widget.listHomes.length,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return HomeCard(context, widget.listHomes[index]);
        },
      ),
      color: Colors.white,
      backgroundColor: Colors.black,
    );
  }
}

HomeCard(BuildContext context, HomeModel homeModel) {
  return GestureDetector(
    onTap: () => _toPropertyDetail(context, homeModel),
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

_toPropertyDetail(BuildContext context, HomeModel homeModel) {
  BlocProvider.of<PropertyBloc>(context).add(
    PropertyNavigateToDetailEvent(context: context, homeModel: homeModel),
  );
}
