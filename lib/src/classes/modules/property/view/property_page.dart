import 'package:casapp/src/classes/models/home_model.dart';
import 'package:casapp/src/classes/modules/property/bloc/property_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PropertyPage extends StatefulWidget {
  static const propertyPage = "propertyPage";

  @override
  _PropertyPageState createState() => _PropertyPageState();
}

class _PropertyPageState extends State<PropertyPage> {
  late PropertyBloc _propertyBloc;
  HomeModel homeModel = HomeModel();

  @override
  void initState() {
    _propertyBloc = BlocProvider.of<PropertyBloc>(context);
    _propertyBloc.add(GetListHomesEvent(context: context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PropertyBloc, PropertyState>(builder: (context, state) {
      if (state is PropertyInitialState) {
        return ListView.builder(
          itemCount: state.listHomes.length,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return HomeCard(state.listHomes[index]);
          },
        );
      } else {
        return const CircularProgressIndicator();
      }
    });
  }

  HomeCard(HomeModel homeModel) {
    return GestureDetector(
      onTap: () => _toPropertyDetail(homeModel),
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

  _toPropertyDetail(HomeModel homeModel) {
    BlocProvider.of<PropertyBloc>(context).add(
      PropertyNavigateToDetailEvent(context: context, homeModel: homeModel),
    );
  }
}
