// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ErrorHandlers {
    address public owner;
    uint256 public balance;

    constructor() {
        owner = msg.sender;
    }

    // Function that uses the require statement to check the amount a user puts when he want to make deposits
    function deposit() external payable {
        require(msg.value > 0, "Amount must be greater than zero");
        balance += msg.value;
    }

    // Function that uses the require statement to check the owner and balance before allower a user to withdraw
    function withdraw(uint256 amount) external {
        require(msg.sender == owner, "Only the owner can withdraw");
        require(amount <= balance, "Insufficient balance");
        balance -= amount;
        payable(msg.sender).transfer(amount);
    }

    // Function that uses the assert statement to prevent division by zero
    function divideNonZero(uint256 a, uint256 b) external pure returns (uint256) {
        assert(b != 0); // Checks to ensure and prevent division by zero
        return a / b;
    }

    // Function that uses the require statement for error Handling to check if the input number is Even, else if will use the revert statement to stop the operation.
    function checkEven(uint256 num) external pure returns (bool) {
        require(num > 0, "Number must be positive");
        if (num % 2 == 0) {
            return true;
        } else {
            revert("Number is not Even");
        }
    }
}
