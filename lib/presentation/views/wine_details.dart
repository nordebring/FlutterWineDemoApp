import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../config/router/app_router.dart';
import '../../domain/models/wine.dart';
import '../cubits/remote/remote_openai_cubit.dart';

class WineDetailsView extends HookWidget {
  final Wine wine;

  const WineDetailsView({Key? key, required this.wine}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final remoteOpenAiCubit = BlocProvider.of<RemoteOpenAiCubit>(context);

    useEffect(() {
      remoteOpenAiCubit.getWineDetails(wine);
      return;
    }, const []);

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => appRouter.pop(),
          child: const Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
      ),
      body: BlocBuilder<RemoteOpenAiCubit, RemoteOpenAiState>(
        builder: (_, state) {
          switch (state.runtimeType) {
            case RemoteOpenAiLoading:
              return const Center(child: CupertinoActivityIndicator());
            case RemoteOpenAiFailed:
              return const Center(child: Icon(Icons.refresh_outlined));
            case RemoteOpenAiSuccess:
              return _buildWineDetails(
                state,
              );
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }

  Widget _buildWineDetails(RemoteOpenAiState state) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            showImage(state.imageUrls),
            const SizedBox(height: 20),
            Text(
              '${wine.wineName} ${wine.vintage}',
              style: const TextStyle(
                fontFamily: 'Butler',
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                const Icon(Icons.access_time, size: 16),
                const SizedBox(width: 4),
                Text(
                  'Producer: ${wine.producerName.toString()}',
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.access_time, size: 16),
                const SizedBox(width: 4),
                Text(
                  'District: ${wine.districtName.toString()}',
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              children: const [
                Flexible(
                  child: Text(
                    'Characteristics',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Flexible(
                  child: Text(
                    state.wineCharacteristics ?? '',
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: const [
                Flexible(
                  child: Text(
                    'Description',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Flexible(
                  child: Text(
                    state.wineDescription ?? '',
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: const [
                Flexible(
                  child: Text(
                    'Rating',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Flexible(
                  child: Text(
                    state.wineRating ?? '',
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: const [
                Flexible(
                  child: Text(
                    'Food pairing',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Flexible(
                  child: Text(
                    state.foodRecommendation ?? '',
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: const [
                Flexible(
                  child: Text(
                    'About the region',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Flexible(
                  child: Text(
                    state.regionDescription ?? '',
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget showImage(List<String>? paths) {
    return (paths != null)
        ? Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
              height: 180,
              child: Image(
                image: NetworkImage(paths[0]),
                fit: BoxFit.contain,
                alignment: Alignment.topCenter,
              ),
            ),
            SizedBox(
              height: 180,
              child: Image(
                image: NetworkImage(paths[1]),
                fit: BoxFit.contain,
                alignment: Alignment.topCenter,
              ),
            ),
          ])
        : Container();
  }
}
