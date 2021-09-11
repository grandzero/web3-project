async function main() {
  const [owner, randoPerson] = await ethers.getSigners();
  const waveContractFacory = await hre.ethers.getContractFactory("WavePortal");
  const waveContract = await waveContractFacory.deploy();
  await waveContract.deployed();
  console.log("Contract deployed to : ", waveContract.address);
  console.log("Contract deployed by : ", owner.address);

  let waveCount = await waveContract.getTotalWaves();
  let waveTxn = await waveContract.wave();
  await waveTxn.wait();

  waveCount = await waveContract.getTotalWaves();

  let tradeCount = await waveContract.getCurrentTradeCount();

  let increaseTrade = await waveContract.increaseTrade();
  await increaseTrade.wait();
  //await increaseTrade.wait();
  tradeCount = await waveContract.getCurrentTradeCount();
}

main()
  .then(() => process.exit())
  .catch((error) => {
    console.log("error");
    process.exit(1);
  });
