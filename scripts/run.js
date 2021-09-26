async function main() {
  const [owner, randoPerson] = await ethers.getSigners();
  const waveContractFacory = await hre.ethers.getContractFactory("WavePortal");
  waveContractFacory
    .deploy({
      value: hre.ethers.utils.parseEther("0.1"),
    })
    .catch((err) => console.log(err));
  const waveContract = await waveContractFacory.deploy({
    value: hre.ethers.utils.parseEther("0.1"),
  });
  await waveContract.deployed();
  console.log("Contract deployed to : ", waveContract.address);
  console.log("Contract deployed by : ", owner.address);

  let waveCount = await waveContract.getTotalWaves();
  console.log(waveCount.toNumber());

  let waveTxn = await waveContract.wave("Hello");
  await waveTxn.wait();

  waveTxn = await waveContract.wave("World");
  await waveTxn.wait();

  let allWaves = await waveContract.getAllWaves();
  console.log(allWaves);
}

main()
  .then(() => process.exit())
  .catch((error) => {
    console.log("error");
    process.exit(1);
  });
