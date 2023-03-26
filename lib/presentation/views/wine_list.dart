import 'package:basic_login/config/router/app_router.dart';
import 'package:basic_login/presentation/cubits/remote/remote_wines_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../domain/models/wine.dart';
import '../widgets/wine_widget.dart';

class WineList extends HookWidget {
  const WineList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //final remoteWinesCubit = BlocProvider.of<RemoteWinesCubit>(context);

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: const Text('My favourite wines'),
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w800,
          ),
        ),
        body: BlocBuilder<RemoteWinesCubit, RemoteWinesState>(
            builder: (_, state) {
          switch (state.runtimeType) {
            case RemoteWinesLoading:
              return const Center(child: CupertinoActivityIndicator());
            case RemoteWinesFailed:
              return const Center(child: Icon(Icons.refresh));
            case RemoteWinesSuccess:
              return _buildWines(state.wines);
            default:
              return const SizedBox();
          }
        }));
  }
}

Widget _buildWines(List<Wine> wines) {
  return ListView.builder(
    padding: const EdgeInsets.all(6.0),
    itemCount: wines.length,
    itemBuilder: (BuildContext context, int index) {
      return GestureDetector(
        onTap: () => appRouter.push(WineDetailsViewRoute(wine: wines[index])),
        child: Padding(
          padding: const EdgeInsets.only(top: 14.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              WineWidget(
                  wine: wines[index],
                  onWinePressed: (e) => appRouter.push(
                        WineDetailsViewRoute(wine: e),
                      ))
            ],
          ),
        ),
        //),
      );
    },
  );
}
