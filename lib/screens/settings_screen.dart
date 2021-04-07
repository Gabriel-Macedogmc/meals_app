import 'package:flutter/material.dart';
import 'package:meals_app/components/main_drawer.dart';
import 'package:meals_app/models/settings_model.dart';

class SettingsScreen extends StatefulWidget {
  final Function(Settings) onSettingsChanged;
  final Settings settings;

  const SettingsScreen(this.onSettingsChanged, this.settings);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Settings settings;

  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwitch(
    String title,
    String subTitle,
    bool value,
    Function(bool) onChange,
  ) {
    return SwitchListTile.adaptive(
      value: value,
      onChanged: (value) {
        onChange(value);
        widget.onSettingsChanged(settings);
      },
      title: Text(title),
      subtitle: Text(subTitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Configurações',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _createSwitch(
                'Sem Glutén',
                'Só exibe refeições sem glutén',
                settings.isGlutenFree,
                (value) => setState(() => settings.isGlutenFree = value),
              ),
              _createSwitch(
                'Sem Lactose',
                'Só exibe refeições sem lactose',
                settings.isLactoseFree,
                (value) => setState(() => settings.isLactoseFree = value),
              ),
              _createSwitch(
                'Sem Veganas',
                'Só exibe refeições sem veganas',
                settings.isVegan,
                (value) => setState(() => settings.isVegan = value),
              ),
              _createSwitch(
                'Sem Vegetariana',
                'Só exibe refeições sem vegetariana',
                settings.isVegetarian,
                (value) => setState(() => settings.isVegetarian = value),
              ),
            ],
          )),
        ],
      ),
    );
  }
}
