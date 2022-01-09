## Giveaway 

Uses Chainlink VRF to call a provably random number and mod it against total entries to select a winner

## Steps for "provably fair enough" give away drawing
- Generate list of hashed_entries (keep unhashed entries private for user privacy)
- Commit hashed_entries to github
- Deploy `giveaway.sol` to mumbai testnet (add address here when deployed). Fund with testnet link
- Call Chainlink VRF to generate provably fair number (calling `getRandomNumber` function)
- Call `getWinnerByIndex(<round>, <entries>)` where round is 0 and entries is 119 (len of CSV) to get the winner!
- Manually verfiy that the winner is:
	- Following @thecozyreef
	- If the entry is from tagging a friend, that they tagged a friend
	- Is not one of the members of the Cozy Reef team.
- If the winner is disqualified for any of the above reasons, call `getRandomNumber` again, and `getwinnerByIndex` while incrementing the round count.


## Notes:
- Deployed contract to: 0x141b51D0e0bcd42bBb6b94E42D4032bCfc0BeA8C
- Called `getRandomNumber`
- Ran `npx hardhat getWinnerByIndex --network mumbai --address 0x141b51D0e0bcd42bBb6b94E42D4032bCfc0BeA8C --round 0 --entries 100` 
- Result is `0x5d` -> convert hex to decimal = 93 -> REDACTED! Does not follow thecozyreef on twitter
- Called `getRandomNumber` a second time
- Ran `npx hardhat getWinnerByIndex --network mumbai --address 0x141b51D0e0bcd42bBb6b94E42D4032bCfc0BeA8C --round 1 --entries 100` 
- Result is `0x04` -> convert hex to decimal = 4 -> REDACTED! Does not follow thecozyreef on twitter
- Called `getRandomNumber` a THIRD time
- Ran `npx hardhat getWinnerByIndex --network mumbai --address 0x141b51D0e0bcd42bBb6b94E42D4032bCfc0BeA8C --round 2 --entries 100` 
- Result is `0x5c` -> convert hex to decimal = 92 -> "92,Comment - 505532671"
- user ID 505532671 is @shoutulkopler. Verified follows us on twitter! https://twitter.com/shoutulkopler


## How to verify process was fair!

- Contract: https://mumbai.polygonscan.com/address/0x141b51D0e0bcd42bBb6b94E42D4032bCfc0BeA8C, confirm that random value called 3 times since the first 2 DQed
- Cozy Reef account: https://mumbai.polygonscan.com/address/0x6c89A1CbBaEf4bE6eE3Ae29C7920AD21f9b4d24E, confirm that only 1 giveaway contract deployed today
- Run a sha256 on `Comment - 505532671` to confirm result matches hashed_entries.txt (https://passwordsgenerator.net/sha256-hash-generator/)