import 'package:flutter/material.dart';

class ScreenApp extends StatelessWidget {
  // static String routeName = 'binomo-list';
  // final BinaryOption binaryOption;

  //  BinomoList({
  //   Key key,
  //   this.binaryOption,
  // }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final assetsBloc = Provider.of<AssetBinomoBloc>(context);
    // final userBloc = Provider.of<UserBloc>(context);
    // final data = assetsBloc.items;
    // final user = userBloc?.uiState?.user;
    // List<Widget> items = [];
    // int expired = user.expiredBinomo.difference(DateTime.now()).inDays;
    // data.sort((a, b) => b.time.compareTo(a.time));
    // final formatter = DateFormat('dd-MM-yyyy HH:mm:ss');

    // final binomoCover = FlexibleSpaceBar(
    //     background: Hero(
    //       tag: 'hero_${binaryOption.id}',
    //       child: Stack(
    //         alignment: Alignment.bottomLeft,
    //         children: <Widget>[
    //           CachedNetworkImage(
    //             width: double.infinity,
    //             height: double.infinity,
    //             imageUrl: binaryOption?.imageUrl ?? '',
    //             fit: BoxFit.cover,
    //           ),
    //           Container(
    //             width: double.infinity,
    //             height: double.infinity,
    //             padding: EdgeInsets.all(6.0),
    //             decoration: BoxDecoration(
    //               gradient: LinearGradient(
    //                 colors: [
    //                   Theme.of(context).primaryColor.withOpacity(.3),
    //                   Theme.of(context).primaryColor,
    //                 ],
    //                 begin: Alignment.topCenter,
    //                 end: Alignment.bottomCenter,
    //               ),
    //             ),
    //           ),
    //           Padding(
    //             padding: EdgeInsets.all(8.0),
    //             child: Text(
    //               binaryOption.description ?? 'Load data...',
    //               maxLines: 3,
    //               style: Theme.of(context)
    //                   .textTheme
    //                   .body1
    //                   .copyWith(color: Colors.white),
    //               textAlign: TextAlign.left,
    //               overflow: TextOverflow.ellipsis,
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   );

    //   final appBar = SliverAppBar(
    //     expandedHeight: 200.0,
    //     flexibleSpace: binomoCover,
    //     pinned: true,
    //     title: Text(
    //       '${binaryOption?.name?.toUpperCase()}',
    //       style: Theme.of(context).textTheme.title.copyWith(color: Colors.white),
    //     ),
    //     centerTitle: false,
    //     iconTheme: Theme.of(context).iconTheme.copyWith(color: Colors.white),
    //     actions: <Widget>[],
    //   );

    //   if (!user.isTrialBinomo) {
    //     items.add(
    //       Card(
    //         child: Container(
    //           width: double.infinity,
    //           height: 46,
    //           padding: EdgeInsets.symmetric(horizontal: 18),
    //           color: Colors.deepOrange.shade300,
    //           child: InkWell(
    //             onTap: () => showDialog(
    //               context: context,
    //               builder: (_) => AlertDialog(
    //                 title: Text('Silakan Isi Deposit...'),
    //                 content: Text(
    //                     'Untuk mendapatkan akses signal binomo, Silahkan isi deposit akun binomo anda minimum \$50 atau RP.700.000'),
    //               ),
    //             ),
    //             child: Row(
    //               children: <Widget>[
    //                 Icon(Icons.warning, color: Colors.white),
    //                 SizedBox(width: 16),
    //                 Text(
    //                   'Sisa trial $expired Hari lagi,\nSilahkan isi deposit di akun binomo anda',
    //                   style: Theme.of(context)
    //                       .textTheme
    //                       .body1
    //                       .copyWith(color: Colors.white),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ),
    //       ),
    //     );
    //   }

    return Container();
  }
}
