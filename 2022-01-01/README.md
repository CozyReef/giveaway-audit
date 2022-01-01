Steps for "provably fair enough" give away drawing
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


Notes:
