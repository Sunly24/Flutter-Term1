void main() {
  const pizzaPrices = {
    'margherita': 5.5,
    'pepperoni': 7.5,
    'vegetarian': 6.5,
  };

  const order = ['margherita', 'pepperoni'];

  double total = 0;

  for (String pizza in order) {
    if (pizzaPrices.containsKey(pizza)) {
      total += pizzaPrices[pizza]!;
    } else {
      print('$pizza pizza is not on the menu');
    }
  }
  print('Total: \$${total}');
}
