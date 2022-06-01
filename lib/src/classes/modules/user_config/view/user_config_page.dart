import 'package:casapp/src/classes/modules/filters/routing/filters_routing.dart';
import 'package:flutter/material.dart';
import '../bloc/filters_bloc.dart';

class FiltersPage extends StatefulWidget {
  static const filtersPage = "filtersPage";

  FiltersRouting? filtersRouting;

  FiltersPage(this.filtersRouting);

  @override
  State<FiltersPage> createState() => _FiltersPageState(filtersRouting);
}

class _FiltersPageState extends State<FiltersPage> {
  FiltersRouting? filtersRouting;

  _FiltersPageState(this.filtersRouting);

  late FiltersBloc _filtersBloc;

  bool _newHome = false;
  bool _goodCondition = false;
  bool _needsRenovating = false;

  Widget _buildSwitchListTile(
    String title,
    String description,
    bool currentValue,
    Function updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(
        description,
      ),
      onChanged: (updateValue) {
        setState(() {
          currentValue = updateValue;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Volver'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(30),
            child: const Text(
              'Personaliza como se muestran los resultados.',
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile(
                  'Obra nueva',
                  'Solo se muestran viviendas a estrenar.',
                  _newHome,
                  (newValue) {
                    setState(() {
                      _newHome = newValue;
                    });
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                _buildSwitchListTile(
                  'Buen estado',
                  'Se muestran viviendas de segunda mano en buenas condiciones.',
                  _goodCondition,
                  (newValue) {
                    setState(() {
                      _goodCondition = newValue;
                    });
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                _buildSwitchListTile(
                  'A reformar',
                  'Se muestran viviendas que necesitan reforma para ser habitables.',
                  _needsRenovating,
                  (newValue) {
                    setState(() {
                      _needsRenovating = newValue;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
