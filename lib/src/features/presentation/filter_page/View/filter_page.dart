import 'package:flutter/material.dart';

//COLORS
import 'package:foodapp/src/colors/colors.dart';

//COMMON WIdGEtS
import 'package:foodapp/src/features/presentation/commons_widgets/Headers/headers_text.dart';
import 'package:foodapp/src/features/presentation/filter_page/View/components/cuisines_filters.dart';
import 'package:foodapp/src/features/presentation/filter_page/View/components/list_tile_checked.dart';
import 'package:foodapp/src/features/presentation/filter_page/View/components/price_filter.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  // SORT BU BOOLEANS
  bool topRated = false;
  bool nearMe = false;
  bool costHighToLow = false;
  bool costLowToHigh = false;
  bool mostPopular = false;

  // FILTER BOOLEANS
  bool openNow = false;
  bool creditCards = false;
  bool alcoholServed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              alignment: Alignment.centerLeft,
              margin:
                  const EdgeInsets.only(top: 15.0, bottom: 15.0, left: 15.0),
              child: headerText(
                  texto: 'CUISINES',
                  color: gris,
                  fontWeight: FontWeight.w600,
                  fontSize: 15.0),
            ),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: const CuisinesFilter()),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(top: 15.0, bottom: 5.0, left: 15.0),
              child: headerText(
                  texto: 'SORT BY',
                  color: gris,
                  fontWeight: FontWeight.w600,
                  fontSize: 15.0),
            ),
            _sortByContainer(),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(top: 15.0, bottom: 5.0, left: 15.0),
              child: headerText(
                  texto: 'FILTER',
                  color: gris,
                  fontWeight: FontWeight.w600,
                  fontSize: 15.0),
            ),
            _filterContainer(),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(top: 15.0, bottom: 5.0, left: 15.0),
              child: headerText(
                  texto: 'PRICE',
                  color: gris,
                  fontWeight: FontWeight.w600,
                  fontSize: 15.0),
            ),
            const PriceFilter(),
          ]))
        ],
      ),
    );
  }

  Widget _sortByContainer() {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            ListTileCheck(
                texto: 'Top Rated',
                isActive: topRated,
                func: () {
                  setState(() => topRated = !topRated);
                }),
            ListTileCheck(
                texto: 'Nearest Me',
                isActive: nearMe,
                func: () {
                  setState(() => nearMe = !nearMe);
                }),
            ListTileCheck(
                texto: 'Cost High to Low',
                isActive: costHighToLow,
                func: () {
                  setState(() => costHighToLow = !costHighToLow);
                }),
            ListTileCheck(
                texto: 'Cost High to High',
                isActive: costLowToHigh,
                func: () {
                  setState(() => costLowToHigh = !costLowToHigh);
                }),
            ListTileCheck(
                texto: 'Most Popular',
                isActive: mostPopular,
                func: () {
                  setState(() => mostPopular = !mostPopular);
                }),
          ],
        ));
  }

  Widget _filterContainer() {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            ListTileCheck(
                texto: 'Open Now',
                isActive: openNow,
                func: () {
                  setState(() => openNow = !openNow);
                }),
            ListTileCheck(
                texto: 'Credir Cart',
                isActive: creditCards,
                func: () {
                  setState(() => creditCards = !creditCards);
                }),
            ListTileCheck(
                texto: 'Alcohol Served',
                isActive: alcoholServed,
                func: () {
                  setState(() => alcoholServed = !alcoholServed);
                }),
          ],
        ));
  }
}

PreferredSizeWidget _appBar(BuildContext context) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(kToolbarHeight),
    child: AppBar(
      elevation: 0.5,
      backgroundColor: Colors.white,
      centerTitle: true,
      title: headerText(
        texto: 'Filters',
        fontWeight: FontWeight.w600,
      ),
      leading: //Leading sirve para poner Iconos o letras del lado izquierdo arriba
          Container(
        padding: const EdgeInsets.only(top: 20, left: 11.0),
        child: headerText(
          texto: 'Reset',
          fontWeight: FontWeight.w500,
          fontSize: 17.0,
        ),
      ),
      actions: //actions sirve para poner Iconos o letras del lado derecho arriba
          [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
              padding: const EdgeInsets.only(top: 10, left: 10.0, right: 10),
              child: headerText(
                texto: 'Done',
                color: orange,
                fontWeight: FontWeight.w500,
                fontSize: 17.0,
              )),
        ),
      ],
    ),
  );
}
