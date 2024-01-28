import Debug "mo:base/Debug";

//Creating a class that will hold our cannister
// Motoko is a functional programming language that is used to write smart contracts for the internet computer

//Var is a changable/mutable variable - to change it, must use :=

//Let is a constant/immutable variable - cannot be changed

actor DBank {
  stable var currentValue = 300;
  // currentValue := 100;

  let id = 89758923475072348;

  // Debug.print("Hello");
  // Debug.print(debug_show (id));

  //Adding public allows us to use the function outside of the class
  //Allow users to add funds
  public func topUp(amount : Nat) {
    currentValue += amount;
    Debug.print(debug_show (currentValue));
  };

  //Allow users to withdraw funds
  public func withdraw(amount : Nat) {
    let tempValue : Int = currentValue - amount;
    if (tempValue >= 0) {
      currentValue -= amount;
      Debug.print(debug_show (currentValue));
    } else { (Debug.print("Insufficient funds - amount too large")) };
  };

  //Query - read-only operation, can quickly get the values of the variables
  public query func checkBalance() : async Nat {
    return currentValue;
  };

};
