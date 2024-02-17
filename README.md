# ErrorHandling in  Solidity Smart Contract

This is a simple solidity smart contract that implements the `require()`, `assert()` and `revert()` statements to handle errors solidity smart contract

### Demo Video

https://www.loom.com/share/15bf88409c6a400f9c0bb37a3da22ab1?sid=a121edb3-b305-416c-aca4-a6c6603e8d18



## Contract Details

### deposit()

```solidity

 // Function that uses the require statement to check the amount a user puts when he want to make deposits
    function deposit() external payable {
        require(msg.value > 0, "Amount must be greater than zero");
        balance += msg.value;
    }
```

### withdraw()

```solidity
 // Function that uses the require statement to check the owner and balance before allower a user to withdraw
    function withdraw(uint256 amount) external {
        require(msg.sender == owner, "Only the owner can withdraw");
        require(amount <= balance, "Insufficient balance");
        balance -= amount;
        payable(msg.sender).transfer(amount);
    }

```

### divideNonZero

```solidity
 // Function that uses the assert statement to prevent division by zero
    function divideNonZero(uint256 a, uint256 b) external pure returns (uint256) {
        assert(b != 0); // Checks to ensure and prevent division by zero
        return a / b;
    }

```

```solidity
// Function that uses the require statement for error Handling to check if the input number is Even, else if will use the revert statement to stop the operation.
    function checkEven(uint256 num) external pure returns (bool) {
        require(num > 0, "Number must be positive");
        if (num % 2 == 0) {
            return true;
        } else {
            revert("Number is not Even");
        }
    }
```



## Authors

Ugo Mars
[@metacraftersio](https://github.com/UgoMars)

## License

This project is licensed under the MIT License - see the LICENSE.md file for details.
