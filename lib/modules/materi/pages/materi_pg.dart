import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/all_widgets.dart';
import '../x_materis.dart';

class MateriPage extends StatefulWidget {
  final bool showBackButton;
  const MateriPage({super.key, this.showBackButton = true});

  @override
  State<MateriPage> createState() => _MateriPageState();
}

class _MateriPageState extends State<MateriPage> {
  @override
  void initState() {
    context.read<MateriBloc>().add(GetAllMateri());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      showBackButton: widget.showBackButton,
      appBarTitle: const Text('Materi TPA'),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 24.0),
        children: [
          BlocBuilder<MateriBloc, MateriState>(
            builder: (context, state) {
              if (state is MateriLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is MateriError) {
                return Center(child: Text(state.error!));
              } else if (state is MateriSuccess) {
                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.result.data.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 16.0),
                  itemBuilder: (context, index) => MateriCard(
                    data: state.result.data[index],
                  ),
                );
              } else {
                return Container();
              }
            },
          ),
        ],
      ),
    );
  }
}
