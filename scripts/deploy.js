async function main() {
  console.log("start");
  const waveContractFacory = await ethers.getContractFactory("WavePortal");
  console.log("WavePortal factory");
  const waveContract = await waveContractFacory.deploy({
    value: ethers.utils.parseEther("0.01"),
  });
  console.log("Deploy");
  await waveContract.deployed();
  console.log("WavePortal address : ", waveContract.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.log("error");
    process.exit(1);
  });
