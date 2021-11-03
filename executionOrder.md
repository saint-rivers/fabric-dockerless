# Execution Order

## 1. Crypto Materials Setup

Crypto materials includes things like MSP, CA and keys for each organization.

Run this shellscript to create your organizations' crypto materials.

``` bash
./generate-crypto.sh
```

## 2. Start up the Orderer

Create artifacts like `channel configuration block`, `orderer genesis block` and `anchor peer update block`.

```bash
./artifacts-init.sh
```

To start up the orderer, run the command below.

```bash
./orderer-up.sh
```

## 3. Start A Peer Node

## 42. Sources & References

### Tutorials with docker compose

<https://chainhero.io/2018/04/tutorial-hyperledger-fabric-how-to-build-your-first-network/>

<https://medium.com/curious-manava/stand-up-orderer-node-using-orderer-yaml-and-docker-in-fabric-v1-4-11733dee53e9>

<https://medium.com/@golammohammadshovon/creating-custom-network-and-deploy-chain-code-with-hyperledger-fabric-f710177047d3>

### Somewhat helpful

<https://stackoverflow.com/questions/52969268/what-is-the-profile-section-in-configtx-yaml-in-hyperledger-fabric>

<https://tutorialsdiary.com/hyperledger-fabric-network-setup-understand-configtx-file>

<https://medium.com/@msakhilvinayak/understanding-configurations-in-hyperledger-fabric-ff3f5c23625a>

<https://www.youtube.com/watch?v=I0pEbA948Yg>
