import 'package:flutter/material.dart';
import 'package:mvvmprovider/data/responce/status.dart';
import 'package:mvvmprovider/utilities/routes/routes_name.dart';
import 'package:mvvmprovider/view_model/home_view_model/home_view_model.dart';
import 'package:mvvmprovider/view_model/tv_view_model/tv_view_modl.dart';
import 'package:mvvmprovider/view_model/user_view_model/user_view_model.dart';
import 'package:mvvmprovider/views/movie_detailed_view/movie_detail_view.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TvViewModel tvViewModel = TvViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(tvViewModel.fetchTvListApi());
    tvViewModel.fetchTvListApi();
  }

  @override
  Widget build(BuildContext context) {
    final userpref = Provider.of<UserViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Center(
            child: InkWell(
              onTap: () {
                userpref.removeUser().then((value) {
                  Navigator.pushReplacementNamed(
                    context,
                    RoutesName.loginScreen,
                  );
                });
              },
              child: const Text(
                'Logout',
              ),
            ),
          ),
        ],
      ),
      body: ChangeNotifierProvider<TvViewModel>(
        child: Consumer<TvViewModel>(
          builder: (context, value, child) {
            switch (value.tvList.status) {
              case Status.loading:
                return const CircularProgressIndicator(
                  color: Colors.orange,
                );
              case Status.error:
                return Center(child: Text(value.tvList.message.toString()));
              case Status.completed:
                return ListView.builder(
                    itemCount: value.tvList.data!.tvShows!.length,
                    itemBuilder: (context, index) {
                      final tvshows = value.tvList.data!.tvShows!;
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                              ),
                              height: 170,
                              width: double.infinity,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 140,
                                    width: double.infinity,
                                    child: Image.network(
                                      tvshows[index]
                                          .imageThumbnailPath
                                          .toString(),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => MovieDetail(
                                              movies: value.tvList.data!
                                                  .tvShows![index]),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      tvshows[index].name.toString(),
                                      style: const TextStyle(fontSize: 24),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    });
              default:
                Text('aosdosahd');
            }

            return Container();
          },
        ),
        create: (context) => tvViewModel,
      ),
    );
  }
}
