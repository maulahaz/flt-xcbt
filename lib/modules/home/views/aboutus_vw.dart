import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xcbt/extensions/x_extensions.dart';

import '../../../widgets/all_widgets.dart';
import '../../content/x_contents.dart';

class AboutUsView extends StatefulWidget {
  const AboutUsView({super.key});

  @override
  State<AboutUsView> createState() => _AboutUsViewState();
}

class _AboutUsViewState extends State<AboutUsView> {
  @override
  void initState() {
    context.read<ContentBloc>().add(GetContentById('1'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBarTitle: const Text('About Us'),
      body: BlocBuilder<ContentBloc, ContentState>(
        builder: (context, state) {
          if(state is ContentLoading){
            return Center(child: CircularProgressIndicator());
          }else if(state is ContentError){
            return Center(child: Text(state.error!));
          }else if(state is ContentSuccess){
            return ListView(
                // padding: const EdgeInsets.fromLTRB(30.0, 0, 30.0, 30.0),
                children: [
                  //empty no image, so i use image from url
                  state.result.data.isEmpty
                      ? const SizedBox()
                      : CachedNetworkImage(
                          imageUrl: state.result.data[0].picture,
                          placeholder: (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                          width: context.deviceWidth,
                          height: 470.0,
                          fit: BoxFit.cover,
                        ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      state.result.data.isEmpty ? 'no content' : state.result.data[0].content,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(fontSize: 18.0),
                    ),
                  ),
                ],
              );
          }else{
            return Container();
          }
        },
      ),
    );
  }
}