class Data {
  String name;
  int amount;
  String description;

  static List<Data> objects = [];

  Data(this.name, this.amount, this.description) {
    objects.add(this);
  }
}
