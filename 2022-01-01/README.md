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
- Deployed contract to: 0x5Dc9fA2d357505db56F0B4f4a31509635c04Eb1b
- Called `getRandomNumber`
- Ran `npx hardhat getWinnerByIndex --network mumbai --address 0x5Dc9fA2d357505db56F0B4f4a31509635c04Eb1b --round 0 --entries 119` 
- Result is `0x2c` -> convert hex to decimal = 44 -> "44,Like - MikiPixel"
- Verify MikiPixel follows us: https://twitter.com/MikiPixel. Confirmed!

## How to verify process was fair!

- Contract: https://mumbai.polygonscan.com/address/0x5Dc9fA2d357505db56F0B4f4a31509635c04Eb1b, confirm that random value only called once
- Cozy Reef account: https://mumbai.polygonscan.com/address/0x6c89A1CbBaEf4bE6eE3Ae29C7920AD21f9b4d24E, confirm that only 1 giveaway contract deployed today
- Run a sha256 on `Like - MikiPixel` to confirm result matches hashed_entries.txt (https://passwordsgenerator.net/sha256-hash-generator/)