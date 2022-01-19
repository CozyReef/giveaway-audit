## Giveaway 

Uses Chainlink VRF to call a provably random number and mod it against total entries to select a winner

## Steps for "provably fair enough" give away drawing
- Generate list of hashed_entries (keep unhashed entries private for user privacy)
- Commit hashed_entries to github
- Deploy `giveaway.sol` to mumbai testnet (add address here when deployed). Fund with testnet link
- Call Chainlink VRF to generate provably fair number (calling `getRandomNumber` function)
- Call `getWinnerByIndex(<round>, <entries>)` where round is 3 (since we're using contract from 2022-01-09) and entries is 240 (len of CSV) to get the winner!
- Manually verfiy that the winner is:
	- Following @thecozyreef
	- If the entry is from tagging a friend, that they tagged a friend
	- Is not one of the members of the Cozy Reef team.
- If the winner is disqualified for any of the above reasons, call `getRandomNumber` again, and `getwinnerByIndex` while incrementing the round count.


## Notes:
- Deployed contract to: 0x141b51D0e0bcd42bBb6b94E42D4032bCfc0BeA8C
- NOTE: This contract was deployed on 2022-01-09, will start with round 3 since 0,1,2 were used for the prev giveaway
- Called `getRandomNumber`
- Ran `npx hardhat getWinnerByIndex --network mumbai --address 0x141b51D0e0bcd42bBb6b94E42D4032bCfc0BeA8C --round 3 --entries 240` 
- Got '0x62' -> convert hex to decimal = 98 -> 98 "98,Retweet - Astraeaione"
- Verify Astraeaione follows us: https://twitter.com/Astraeaione. Confirmed!



## How to verify process was fair!

- Contract: https://mumbai.polygonscan.com/address/0x141b51D0e0bcd42bBb6b94E42D4032bCfc0BeA8C - called requestRandom once for round 3 value
- Cozy Reef account: https://mumbai.polygonscan.com/address/0x6c89A1CbBaEf4bE6eE3Ae29C7920AD21f9b4d24E
- Run a sha256 on `Retweet - Astraeaione` to confirm result matches hashed_entries.txt (https://passwordsgenerator.net/sha256-hash-generator/)