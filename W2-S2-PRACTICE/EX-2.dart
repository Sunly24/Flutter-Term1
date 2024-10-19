class BankAccount {
  final int accountId;
  final String accountOwer;
  double _balance = 0;

  BankAccount(this.accountId, this.accountOwer);

  double get getBalance => _balance;

  double balance() {
    return _balance;
  }

  void withdraw(double amount) {
    if (amount > 1) {
      if (_balance >= amount) {
        _balance -= amount;
      } else {
        throw Exception('Insufficient balance for withdraw!');
      }
    } else {
      throw Exception('Withdraw amount must be start from \$1');
    }
  }

  void credit(double amount) {
    if (amount >= 1) {
      _balance += amount;
    } else {
      throw Exception('Credit amount must be start from \$1');
    }
  }
}

class Bank {
  final String name;
  final String location;
  final List<BankAccount> _accounts = [];

  Bank(this.name, this.location);

  BankAccount createAccount(int accountId, String accountOwner) {
    for (var account in _accounts) {
      if (account.accountId == accountId) {
        throw Exception('Account have already exists');
      }
    }

    var newAccount = BankAccount(accountId, accountOwner);
    _accounts.add(newAccount);
    return newAccount;
  }
}

void main() {
  Bank myBank = Bank('CADT Bank', 'Phnom Penh');

  BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');
  print(ronanAccount.balance());

  ronanAccount.credit(100);
  print(ronanAccount.balance());

  ronanAccount.withdraw(50);
  print(ronanAccount.balance());

  try {
    ronanAccount.withdraw(75);
  } catch (e) {
    print(e);
  }

  try {
    myBank.createAccount(100, 'Honlgy');
  } catch (e) {
    print(e);
  }
}
