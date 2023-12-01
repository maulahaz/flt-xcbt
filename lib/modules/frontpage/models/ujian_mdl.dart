class UjianModel {
  int id;
  String category,status,deadline;

  UjianModel({
    required this.id,
    required this.category,
    required this.status,
    required this.deadline,
  });

}

final List<UjianModel> exListUjian = [
      UjianModel(
        id: 1,
        category: 'Area-1',
        status: 'Not Done',
        deadline: '10-Dec-2023'
      ),UjianModel(
        id: 2,
        category: 'Area-2',
        status: 'Not Done',
        deadline: '15-Dec-2023'
      ),UjianModel(
        id: 3,
        category: 'Area-3',
        status: 'Not Done',
        deadline: '30-Dec-2023'
      ),UjianModel(
        id: 4,
        category: 'Area-9',
        status: 'Not Done',
        deadline: '20-Dec-2023'
      ),
    ];