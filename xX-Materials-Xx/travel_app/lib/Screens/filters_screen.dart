import 'package:flutter/material.dart';
import 'package:travel_app/widgets/app_drawer.dart';

class FilterScreen extends StatefulWidget {
  // const FilterScreen({super.key});
  static const screenRoute = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FilterScreen(this.currentFilters, this.saveFilters);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _summer = false;
  var _winter = false;
  var _family = false;

  @override
  void initState() {
    _summer = widget.currentFilters['summer']!;
    _winter = widget.currentFilters['winter']!;
    _family = widget.currentFilters['family']!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الفلترة'),
        actions: [
          IconButton(
              onPressed: () {
                final selectedFilters = {
                  'summer': _summer,
                  'winter': _winter,
                  'family': _family,
                };
                widget.saveFilters(selectedFilters);
              },
              icon: Icon(Icons.save))
        ],
      ),
      drawer: AppDrawer(),
      body: Column(
        children: [
          SizedBox(height: 30),
          Expanded(
              child: ListView(
            children: [
              bulidSwitchListTile(
                  'الرحلات الصيفية', 'اظهار الرحلات الصيفية', _summer,
                  (newValue) {
                setState(() {
                  _summer = newValue;
                });
              }),
              bulidSwitchListTile(
                  'الرحلات الشتوية', 'اظهار الرحلات الشتوية', _winter,
                  (newValue) {
                setState(() {
                  _winter = newValue;
                });
              }),
              bulidSwitchListTile(
                  'رحلات العائلات فقط', 'اظهار الرحلات العائلية', _family,
                  (newValue) {
                setState(() {
                  _family = newValue;
                });
              }),
            ],
          )),
        ],
      ),
    );
  }

  Widget bulidSwitchListTile(
      String title, String subTitle, var currentValue, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      value: currentValue,
      onChanged: (newValue) => updateValue(newValue),
    );
  }
}
