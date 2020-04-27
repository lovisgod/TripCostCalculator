import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trip cost calculator',
      theme: ThemeData(
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: new FuelForm(),
    );
  }
}

class FuelForm extends StatefulWidget {
@override
  State<StatefulWidget> createState() => _FuelFormtate();
  }
  
  class _FuelFormtate extends State<FuelForm> {
    String result  = "";
    final _currencies = ['Dollars', 'Euro', 'Pounds'];
    String _currency = 'Dollars';
    TextEditingController distanceController = TextEditingController();
    TextEditingController avgController = TextEditingController();
    TextEditingController priceController = TextEditingController();


      @override
      Widget build(BuildContext context) {
        TextStyle textStyle = Theme.of(context).textTheme.title;
    return Scaffold(
      appBar: AppBar(
        title: Text("Trip Cost Calculator"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                top: 5.0,
                bottom: 5.0
              ),
              child:  TextField( // we can use the onsubmitted here too
              controller: distanceController, // the .text value of this get changed when the there is a change
              decoration: InputDecoration(
                hintText: 'e.g 1234',
                labelText: 'Distance',
                labelStyle: textStyle,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0)
                )
              ),
              keyboardType: TextInputType.number,
            ),
            ),
            // second text field
            Padding(
              padding: EdgeInsets.only(
                top: 5.0,
                bottom: 5.0
              ),
              child:  TextField( // we can use the onsubmitted here too
              controller: avgController, // the .text value of this get changed when the there is a change
              decoration: InputDecoration(
                hintText: 'e.g 17',
                labelText: 'Distance per unit',
                labelStyle: textStyle,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0)
                )
              ),
              keyboardType: TextInputType.number,
            ),
            ),
            // third text field
            Padding(
              padding: EdgeInsets.only(
                top: 5.0,
                bottom: 5.0
              ),
              child:   
              Row(
                children: <Widget>[
              Expanded(child:TextField( // we can use the onsubmitted here too
              controller: priceController, // the .text value of this get changed when the there is a change
              decoration: InputDecoration(
                hintText: 'e.g 1.65',
                labelText: 'Price',
                labelStyle: textStyle,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0)
                )
              ),
              keyboardType: TextInputType.number,
            )),
            Expanded( child:DropdownButton<String>(
              items: this._currencies.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value)
                );
              }).toList(),
              value: _currency,
              onChanged: (String value) {
                _onDropDownChanged(value);
                 },
            )),
          ],)),
          Row(
             children: <Widget>[
              Expanded( child: RaisedButton(
              color: Theme.of(context).primaryColorDark,
              textColor: Theme.of(context).primaryColorLight,
              child: Text(
                'Submit',
                textScaleFactor: 1.5, // makes the text 50% bigger
              ),
              onPressed: () {
                setState(() {
                  result = _calculate();
                });
              },
            )),
             Expanded( child:RaisedButton(
              color: Theme.of(context).buttonColor,
              textColor: Theme.of(context).primaryColorDark,
              child: Text(
                'Reset',
                textScaleFactor: 1.5, // makes the text 50% bigger
              ),
              onPressed: () {
               _reset();
              },
            ))
             ]
          ),
            Text(result),
            ],
           ),
          ),
        );
      }
                
        void _onDropDownChanged(String value) {
          setState(() {
            _currency = value;
          });
        }

        String _calculate() {
          double _distance = double.parse(distanceController.text);
          double _fuelCost = double.parse(priceController.text);
          double _consumption = double.parse(avgController.text);
          double _totalCost =_distance / _consumption * _fuelCost;
          String _result = 'Total cost is ' + _totalCost.toStringAsFixed(2) + ' ' + _currency;
          return _result;
        }

        void _reset() {
          distanceController.text = '';
          avgController.text = '';
          priceController.text = '';
          setState(() {
            result = '';
          });
        }
}




  
