import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xcbt/modules/pengguna/all_pengguna.dart';
import 'package:xcbt/pages/home.dart';

class PenggunaView extends StatefulWidget {
  const PenggunaView({Key? key}) : super(key: key);

  @override
  _PenggunaViewState createState() => _PenggunaViewState();
}

class _PenggunaViewState extends State<PenggunaView> {
  @override
  void initState() {
    context.read<PenggunaBloc>().add(LoadPenggunaEven());
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pengguna'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Home()));
        },
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<PenggunaBloc, PenggunaState>(
      builder: (context, state) {
        if (state is PenggunaLoadingState || state is PenggunaInitialState) {
          return Center(child: CircularProgressIndicator());
        }else if(state is PenggunaErrorState) {
          return Center(child: Text(state.error));
        }else if(state is PenggunaLoadedState) {
          // var row = state.data;
          return Center(child: Text('Done'));
        }else{
          return Container();
        }
        
      },
    );
  }
}
