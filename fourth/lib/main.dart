void main() {
  printData();
}

void printData() async {
  print("1");
  print("2");
  await Data3();
  print("3");
  print("4");
  print("5");
  await Data4();
  print("6");
  print("7");
  await Data5();
  print("8");
  print("9");
  await Data2();
  print("10");
}

Future Data2() async {
  Future.delayed(Duration(seconds: 2), () {
    print("Data 2");
  });
}

Future Data3() async {
  Future.delayed(Duration(seconds: 3), () {
    print("Data 3");
  });
}

Future Data4() async {
  Future.delayed(Duration(seconds: 4), () {
    print("Data 4");
  });
}

Future Data5() async {
  Future.delayed(Duration(seconds: 5), () {
    print("Data 5");
  });
}
