import 'package:flutter/material.dart';
import 'package:flutter_range_slider/flutter_range_slider.dart' as frs;

class RangeSliderSample extends StatefulWidget {
  final List valores;

  const RangeSliderSample({Key key, this.valores}) : super(key: key);

  @override
  _RangeSliderSampleState createState() => _RangeSliderSampleState();
}

class _RangeSliderSampleState extends State<RangeSliderSample> {
  // List of RangeSliders to use, together with their parameters
  List<RangeSliderData> rangeSliders;

  double _upperValue = 0;

  @override
  void initState() {
    super.initState();
    _upperValue = widget.valores.length.toDouble();
    rangeSliders = _rangeSliderDefinitions(_upperValue);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _buildRangeSliders(),
    );
  }

  // -----------------------------------------------
  // Creates a list of RangeSliders, based on their
  // definition and SliderTheme customizations
  // -----------------------------------------------
  List<Widget> _buildRangeSliders() {
    List<Widget> children = <Widget>[];
    children.add(rangeSliders[0].build(context, (double lower, double upper) {
      // adapt the RangeSlider lowerValue and upperValue
      setState(() {
        rangeSliders[0].lowerValue = lower;
        rangeSliders[0].upperValue = upper;
      });
    }));
    children.add(SizedBox(height: 8.0));

    return children;
  }

  // -------------------------------------------------
  // Creates a list of RangeSlider definitions
  // -------------------------------------------------
  List<RangeSliderData> _rangeSliderDefinitions(double maxValue) {
    return <RangeSliderData>[
      RangeSliderData(
        min: 1,
        max: maxValue,
        lowerValue: 1,
        upperValue: maxValue,
        divisions: maxValue.toInt(),
        listaFinanciamento: widget.valores,
        valueIndicatorFormatter: (int index, double value) {
          return 'Mês ${(value - 1).toStringAsFixed(0)}';
        },
      ),
    ];
  }
}

// ---------------------------------------------------
// Helper class aimed at simplifying the way to
// automate the creation of a series of RangeSliders,
// based on various parameters
//
// This class is to be used to demonstrate the appearance
// customization of the RangeSliders
// ---------------------------------------------------
class RangeSliderData {
  List listaFinanciamento;
  double min;
  double max;
  double lowerValue;
  double upperValue;
  int divisions;
  bool showValueIndicator;
  int valueIndicatorMaxDecimals;
  bool forceValueIndicator;
  Color overlayColor;
  Color activeTrackColor;
  Color inactiveTrackColor;
  Color thumbColor;
  Color valueIndicatorColor;
  Color activeTickMarkColor;
  Function valueIndicatorFormatter;

  double totalJuros = 0;
  double totalAmortizacao = 0;
  double totalParcela = 0;
  double totalSaldoDevedor = 0;

  static const Color defaultActiveTrackColor = const Color(0xFF0175c2);
  static const Color defaultInactiveTrackColor = const Color(0x3d0175c2);
  static const Color defaultActiveTickMarkColor = const Color(0x8a0175c2);
  static const Color defaultThumbColor = const Color(0xFF0175c2);
  static const Color defaultValueIndicatorColor = const Color(0xFF0175c2);
  static const Color defaultOverlayColor = const Color(0x290175c2);

  RangeSliderData({
    this.listaFinanciamento,
    this.min,
    this.max,
    this.lowerValue,
    this.upperValue,
    this.divisions,
    this.showValueIndicator: true,
    this.valueIndicatorMaxDecimals: 0,
    this.forceValueIndicator: false,
    this.overlayColor: defaultOverlayColor,
    this.activeTrackColor: defaultActiveTrackColor,
    this.inactiveTrackColor: defaultInactiveTrackColor,
    this.thumbColor: defaultThumbColor,
    this.valueIndicatorColor: defaultValueIndicatorColor,
    this.activeTickMarkColor: defaultActiveTickMarkColor,
    this.valueIndicatorFormatter,
  });

  // Returns the values in text format, with the number
  // of decimals, limited to the valueIndicatedMaxDecimals
  //
  String get lowerValueText =>
      lowerValue.toStringAsFixed(valueIndicatorMaxDecimals);
  String get upperValueText =>
      upperValue.toStringAsFixed(valueIndicatorMaxDecimals);

  // Builds a RangeSlider and customizes the theme
  // based on parameters
  //
  Widget build(BuildContext context, frs.RangeSliderCallback callback) {
    return Column(
      children: [
        Text('Filtrar por período'),
        Container(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          width: double.infinity,
          child: Row(
            children: <Widget>[
              Container(
                constraints: BoxConstraints(
                  minWidth: 40.0,
                  maxWidth: 40.0,
                ),
                child: Text(
                    'Mês      ${lowerValueText == '1' ? 'Atual' : lowerValueText}'),
              ),
              Expanded(
                child: SliderTheme(
                  // Customization of the SliderTheme
                  // based on individual definitions
                  // (see rangeSliders in _RangeSliderSampleState)
                  data: SliderTheme.of(context).copyWith(
                    overlayColor: overlayColor,
                    activeTickMarkColor: activeTickMarkColor,
                    activeTrackColor: activeTrackColor,
                    inactiveTrackColor: inactiveTrackColor,
                    //trackHeight: 8.0,
                    thumbColor: thumbColor,
                    valueIndicatorColor: valueIndicatorColor,
                    showValueIndicator: showValueIndicator
                        ? ShowValueIndicator.always
                        : ShowValueIndicator.onlyForDiscrete,
                  ),
                  child: frs.RangeSlider(
                    min: min,
                    max: max,
                    lowerValue: lowerValue,
                    upperValue: upperValue,
                    divisions: divisions,
                    showValueIndicator: showValueIndicator,
                    valueIndicatorMaxDecimals: valueIndicatorMaxDecimals,
                    valueIndicatorFormatter: valueIndicatorFormatter,
                    onChanged: (double lower, double upper) {
                      totalJuros = 0;
                      totalAmortizacao = 0;
                      totalParcela = 0;
                      for (var i = 0; i < upper.toInt(); i++) {
                        totalJuros +=
                            double.parse(listaFinanciamento[i][1].toString());
                        totalAmortizacao +=
                            double.parse(listaFinanciamento[i][2].toString());
                        totalParcela +=
                            double.parse(listaFinanciamento[i][0].toString());
                        totalSaldoDevedor =
                            double.parse(listaFinanciamento[i][3].toString());
                      }
                      callback(lower, upper);
                    },
                  ),
                ),
              ),
              Container(
                constraints: BoxConstraints(
                  minWidth: 40.0,
                  maxWidth: 40.0,
                ),
                child: Text('Mês      ${int.parse(upperValueText) - 1}'),
              ),
            ],
          ),
        ),
        Column(
          children: [
            Text('Total Juros ${totalJuros.toStringAsFixed(2)}'),
            Text('Total Amortização ${totalAmortizacao.toStringAsFixed(2)}'),
            Text('Total Pago ${totalParcela.toStringAsFixed(2)}'),
            Text('Saldo Devedor ${totalSaldoDevedor.toStringAsFixed(2)}')
          ],
        )
      ],
    );
  }
}
