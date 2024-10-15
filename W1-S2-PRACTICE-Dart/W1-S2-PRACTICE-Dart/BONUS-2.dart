bool isValid(String input) {
  List<String> stack = [];
  Map<String, String> matchingInputS = {'(': ')', '{': '}', '[': ']'};

  for (int i = 0; i < input.length; i++) {
    String current = input[i];
    if (matchingInputS.containsKey(current)) {
      stack.add(current);
    } else if (matchingInputS.containsValue(current)) {
      if (stack.isEmpty || matchingInputS[stack.removeLast()] != current) {
        return false;
      }
    }
  }
  return stack.isEmpty;
}

void main() {
  List<String> testCase = ["{what is (42)} ?", "[text}", "[[[(a)b]c]d]"];
  for (String test in testCase) {
    print('$test is ${isValid(test) ? '[Balanced]' : '[Not Balanced]'}');
  }
}
