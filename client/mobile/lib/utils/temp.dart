import 'package:sepurito/features/split_bill/models/bill.dart';
import 'package:sepurito/features/split_bill/models/item.dart';
import 'package:sepurito/features/split_bill/models/participant.dart';

List<Bill> seed() {
    return [
      Bill(
        id: '1',
        title: 'Grocery Shopping',
        category: 'Groceries',
        total: 325000.0,
        tax: 11.0,
        service: 0.0,
        participants: [
          Participant(
            name: 'Alice',
            items: [
              Item(name: 'Apples', price: 50000.0, quantity: 2),
              Item(name: 'Bread', price: 30000.0, quantity: 1),
              Item(name: 'Milk', price: 20000.0, quantity: 3),
            ],
            total: 150000.0,
          ),
          Participant(
            name: 'Bob',
            items: [
              Item(name: 'Eggs', price: 40000.0, quantity: 1),
              Item(name: 'Cheese', price: 35000.0, quantity: 1),
              Item(name: 'Chicken', price: 25000.0, quantity: 2),
            ],
            total: 175000.0,
          ),
        ],
      ),
      Bill(
        id: '2',
        title: 'Lunch with Friends',
        category: 'Food',
        total: 206000.0,
        tax: 10.0,
        service: 5.0,
        participants: [
          Participant(
            name: 'Charlie',
            items: [
              Item(name: 'Burger', price: 60000.0, quantity: 1),
              Item(name: 'Fries', price: 20000.0, quantity: 1),
              Item(name: 'Soda', price: 15000.0, quantity: 1),
            ],
            total: 95000.0,
          ),
          Participant(
            name: 'Diana',
            items: [
              Item(name: 'Salad', price: 50000.0, quantity: 1),
              Item(name: 'Juice', price: 15000.0, quantity: 1),
            ],
            total: 65000.0,
          ),
        ],
      ),
      Bill(
        id: '3',
        title: 'Coffee Break',
        category: 'Beverage',
        total: 80000.0,
        tax: 10.0,
        service: 0.0,
        participants: [
          Participant(
            name: 'Eve',
            items: [
              Item(name: 'Latte', price: 30000.0, quantity: 1),
              Item(name: 'Muffin', price: 20000.0, quantity: 1),
            ],
            total: 50000.0,
          ),
          Participant(
            name: 'Frank',
            items: [
              Item(name: 'Cappuccino', price: 30000.0, quantity: 1),
            ],
            total: 30000.0,
          ),
        ],
      ),
      Bill(
        id: '3',
        title: 'Coffee Break',
        category: 'Beverage',
        total: 80000.0,
        tax: 10.0,
        service: 0.0,
        participants: [
          Participant(
            name: 'Eve',
            items: [
              Item(name: 'Latte', price: 30000.0, quantity: 1),
              Item(name: 'Muffin', price: 20000.0, quantity: 1),
            ],
            total: 50000.0,
          ),
          Participant(
            name: 'Frank',
            items: [
              Item(name: 'Cappuccino', price: 30000.0, quantity: 1),
            ],
            total: 30000.0,
          ),
        ],
      ),
      Bill(
        id: '3',
        title: 'Coffee Break',
        category: 'Beverage',
        total: 80000.0,
        tax: 10.0,
        service: 0.0,
        participants: [
          Participant(
            name: 'Eve',
            items: [
              Item(name: 'Latte', price: 30000.0, quantity: 1),
              Item(name: 'Muffin', price: 20000.0, quantity: 1),
            ],
            total: 50000.0,
          ),
          Participant(
            name: 'Frank',
            items: [
              Item(name: 'Cappuccino', price: 30000.0, quantity: 1),
            ],
            total: 30000.0,
          ),
        ],
      ),
      Bill(
        id: '3',
        title: 'Coffee Break',
        category: 'Beverage',
        total: 80000.0,
        tax: 10.0,
        service: 0.0,
        participants: [
          Participant(
            name: 'Eve',
            items: [
              Item(name: 'Latte', price: 30000.0, quantity: 1),
              Item(name: 'Muffin', price: 20000.0, quantity: 1),
            ],
            total: 50000.0,
          ),
          Participant(
            name: 'Frank',
            items: [
              Item(name: 'Cappuccino', price: 30000.0, quantity: 1),
            ],
            total: 30000.0,
          ),
        ],
      ),
      Bill(
        id: '3',
        title: 'Coffee Break',
        category: 'Beverage',
        total: 80000.0,
        tax: 10.0,
        service: 0.0,
        participants: [
          Participant(
            name: 'Eve',
            items: [
              Item(name: 'Latte', price: 30000.0, quantity: 1),
              Item(name: 'Muffin', price: 20000.0, quantity: 1),
            ],
            total: 50000.0,
          ),
          Participant(
            name: 'Frank',
            items: [
              Item(name: 'Cappuccino', price: 30000.0, quantity: 1),
            ],
            total: 30000.0,
          ),
        ],
      ),
      Bill(
        id: '3',
        title: 'Coffee Break',
        category: 'Beverage',
        total: 80000.0,
        tax: 10.0,
        service: 0.0,
        participants: [
          Participant(
            name: 'Eve',
            items: [
              Item(name: 'Latte', price: 30000.0, quantity: 1),
              Item(name: 'Muffin', price: 20000.0, quantity: 1),
            ],
            total: 50000.0,
          ),
          Participant(
            name: 'Frank',
            items: [
              Item(name: 'Cappuccino', price: 30000.0, quantity: 1),
            ],
            total: 30000.0,
          ),
        ],
      ),
    ];
  }