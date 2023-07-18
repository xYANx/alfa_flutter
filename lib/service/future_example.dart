class FutureExample {

  void main() => {fetchUserOrder().then((value) => print(value))};

  Future<String> fetchUserOrder() {
    return Future.delayed(
      const Duration(seconds: 10),
      () => 'Large Latte',
    );
  }

}
