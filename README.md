# Asociacion De Investigacion En Inteligencia Artificial Para La Leucemia Peter Moss
## HIAS Miner Node

[![HIAS GeniSysAI](Media/Images/hias-miner-node.jpg)](https://github.com/LeukemiaAiResearch/HIAS-Miner-Node)

[![VERSION](https://img.shields.io/badge/VERSION-0.0.0-blue.svg)](https://github.com/LeukemiaAiResearch/HIAS-Miner-Node/tree/0.0.0) [![DEV BRANCH](https://img.shields.io/badge/DEV%20BRANCH-0.1.0-blue.svg)](https://github.com/LeukemiaAiResearch/HIAS-Miner-Node/tree/0.1.0) [![Contributions Welcome!](https://img.shields.io/badge/Contributions-Welcome-lightgrey.svg)](CONTRIBUTING.md)  [![Issues](https://img.shields.io/badge/Issues-Welcome-lightgrey.svg)](issues) [![LICENSE](https://img.shields.io/badge/LICENSE-MIT-blue.svg)](LICENSE)


&nbsp;

# Table Of Contents

- [Introduction](#introduction)
- [Prerequisites](#prerequisites)
  - [HIAS Server](#hias-server)
- [System Requirements](#system-requirements)
- [Hardware Requirements](#hardware-requirements)
- [Setup](#setup)
  - [UFW Firewall](#ufw-firewall)
  - [Clone the repository](#clone-the-repository)
      - [Developer Forks](#developer-forks)
  - [Install Dependencies](#install-dependencies)
  - [Blockchain User](#blockchain-user)
  - [Enode](#bootnodes)
  - [Genesis Block](#genesis-block)
- [Start The Node](#start-the-node)
- [Contributing](#contributing)
    - [Contributors](#contributors)
- [Versioning](#versioning)
- [License](#license)
- [Bugs/Issues](#bugs-issues)

&nbsp;

# Introduction
The HIAS Blockchain Miner Nodes are additional nodes for the HIAS Blockchain. These nodes help to create blocks, seal transaction blocks, and also have a full copy of the entire HIAS Blockchain which remain synchronized.

The project runs on a **UP2** but you can use any Linux device that has the appropriate resources.

&nbsp;

# Prerequisites
Before you can install this project there are some prerequisites.

## HIAS Server
Follow the [HIAS Installation Guide](https://github.com/LeukemiaAiResearch/HIAS/blob/master/Documentation/Installation/Installation.md) to complete your HIAS server setup.

&nbsp;

# System Requirements
- [Ubuntu 16.04.6 LTS)](https://releases.ubuntu.com/16.04/)
- [Python 3.6](https://www.python.org/ "Python 3.6")
- Requires PIP3

# Hardware Requirements
- 1 x [UP2](https://www.raspberrypi.org/products/raspberry-pi-2-model-b/) or other Linux device.

&nbsp;

# Setup
Now you will setup a HIAS Blockchain Miner Node. The following tutorial will take you through the setup steps.

## UFW Firewall
UFW firewall is used to protect the ports of your device. Use the following command to check the status of your firewall:

```
  sudo ufw status
```
You should see the output:
```
  Status: inactive
```

To allow access for SSH use the following commands:

```
  sudo ufw allow 22
  audo ufw enable
  sudo ufw status
```

You should see the following output:

```
  Status: active

  To                         Action      From
  --                         ------      ----
  22                         ALLOW       Anywhere
  22 (v6)                    ALLOW       Anywhere (v6)
```

## Clone the repository
Clone the [HIAS Miner Node](https://github.com/LeukemiaAiResearch/HIAS-Miner-Node "HIAS Miner Node") repository from the [Asociacion De Investigacion En Inteligencia Artificial Para La Leucemia Peter Moss](https://github.com/LeukemiaAiResearch "Asociacion De Investigacion En Inteligencia Artificial Para La Leucemia Peter Moss") Github Organization.

To clone the repository and install the UP2 NCS1 USB Camera Security System, make sure you have Git installed. Now navigate to the home directory on your device using terminal/commandline, and then use the following command.

```
  git clone https://github.com/LeukemiaAiResearch/HIAS-Miner-Node.git
```

Once you have used the command above you will see a directory called **HIAS-Miner-Node** in your home directory.

```
  ls
```

Using the ls command in your home directory should show you the following.

```
  HIAS-Miner-Node
```

Navigate to the **HIAS-Miner-Node** directory, this is your project root directory for this tutorial.

### Developer Forks
Developers from the Github community that would like to contribute to the development of this project should first create a fork, and clone that repository. For detailed information please view the [CONTRIBUTING](CONTRIBUTING.md "CONTRIBUTING") guide. You should pull the latest code from the development branch.

```
  git clone -b "0.1.0" https://github.com/LeukemiaAiResearch/HIAS-Miner-Node.git
```

The **-b "0.1.0"** parameter ensures you get the code from the latest master branch. Before using the below command please check our latest master branch in the button at the top of the project README.

## Install Dependencies
Now you will install the required dependencies. [Setup.sh](Setup.sh "Setup.sh")is an executable shell script that will do the following:

- Install the required Python packages

To execute the script, make enter the following commands. This will take a long time!

```
  sed -i 's/\r//' Setup.sh
  sh Setup.sh
```

## Blockchain User
To begin setting up your blockchain node you need to create a blockchain user. To do so use the following command, ensuring you are in the project root.
```
 geth account new --datadir HIAS/Data
```
You will be asked to enter a password:
```
 Your new account is locked with a password. Please give a password. Do not forget this password.
```
Once you enter your password and confirm it, your account will be created. Once your account is created you should see something like the following:
```
Password:
Repeat password:

Your new key was generated

Public address of the key:   0x9B3FEE4aa9A5B5F4422C6a2222A06FDE07Ad5513
Path of the secret key file: HIAS/Data/keystore/UTC--2020-09-24T22-29-31.527923214Z--9b3fee4aa9a5b5f4422c6a2222a06fde07ad5513

- You can share your public address with anyone. Others need it to interact with you.
- You must NEVER share the secret key with anyone! The key controls access to your funds!
- You must BACKUP your key file! Without the key, it's impossible to access account funds!
- You must REMEMBER your password! Without the password, it's impossible to decrypt the key!
```

## Enode
To connect your miner node to the HIAS Blockchain, you need to know the Enode for the master node. In geth console, use the following command:
```
 admin.nodeInfo
```
You should see similar to the following:
```
{
  enode: "enode://YourEnode@YourMasterNodeIP:YourMasterNodePort?discport=1026",
  enr: "enr:YourEthereumNameRecord",
  id: "YourID",
  ip: "YourIP",
  listenAddr: "[::]:30303",
  name: "Geth/v1.9.20-stable-979fc968/linux-amd64/go1.15",
  ports: {
    discovery: 1026,
    listener: 30303
  },
  protocols: {
    eth: {
      config: {
        byzantiumBlock: 0,
        chainId: YourChainID,
        constantinopleBlock: 0,
        eip150Block: 0,
        eip150Hash: "0x0000000000000000000000000000000000000000000000000000000000000000",
        eip155Block: 0,
        eip158Block: 0,
        homesteadBlock: 0,
        istanbulBlock: 0,
        petersburgBlock: 0
      },
      difficulty: 13516459994,
      genesis: "YourGenesis",
      head: "YourHead",
      network: YourChainID
    }
  }
}
```
Here you are interested in the enode URL. You should save this URL as you will need it later. You can also get your Enode URL by using the following command:
```
 admin.nodeInfo.enode
```

## Genesis Block
Your Genesis file must be an exact match to the master node genesis file. In the HIAS Blockchain Genesis file we allocated some Ether to 3 accounts. Although these accounts will not exist in this node, they must be specified in the Genesis file or the hash will be different and you will not be able to add the master node as a peer.

```
{
    "config": {
        "chainId": 0,
        "byzantiumBlock": 0,
        "constantinopleBlock": 0,
        "petersburgBlock": 0,
        "homesteadBlock": 0,
        "istanbulBlock": 0,
        "eip150Block": 0,
        "eip155Block": 0,
        "eip158Block": 0
    },
    "difficulty": "0x400",
    "gasLimit": "0xE0000000",
    "alloc": {
        "HIASBlockchainUser": {
            "balance": "99999999999999999999999999999999999999999999999999999999999999999999999999999"
        },
        "iotJumpWayBlockchainUser": {
            "balance": "99999999999999999999999999999999999999999999999999999999999999999999999999999"
        },
        "YourBlockChainUser": {
            "balance": "99999999999999999999999999999999999999999999999999999999999999999999999999999"
        }
    }
}
```

You need to edit your Genesis file to match the HIAS Genesis file, you will find the file in the [HIAS](HIAS) directory.You need to make sure that the **chainId** matches the chainId from the HIAS Genesis file, also, you need to replace **HIASBlockchainUser**, **iotJumpWayBlockchainUser** and **YourBlockChainUser** with the addresses used in the HIAS Genesis file.

Once you have done that, you are ready to init your Genesis block:
```
 geth -datadir HIAS/Data init HIAS/genesis.json
```
Now that your Genesis block is created, you are ready to start your miner node.

&nbsp;

# Start The Node
To start the node you will use the geth client. To do so you will use the following command, ensuring you are in the project root.
```
 geth --mine --networkid YourChainId -datadir HIAS/Data --http.addr YourIP --miner.etherbase YourMinerAccount --bootnodes "MasterNodeEnodeURL" --syncmode "full" console
```
In the above command you need to replace **YourChainId**, **YourIP**, **YourMinerAccount**, **MasterNodeEnodeURL**.

This will start up your node in full syncmode, and add the master node as a peer. Your node will first generate it's DAG, this may take some time depending on the resources available on your machine. Your node will also sync with the master node, this may also take some time. You can check the status of the sync by using the following command:
```
eth.syncing
```
You can ensure that you are connected to the master node using the following command:
```
 admin.peers
```
Once the node is fully synced, you can begin mining. Inside the geth console, use the following command:
```
miner.start()
```
You can specify the amount of cores to use by adding an integer as a parameter, for instance:
```
miner.start(4)
```
Congratulations, you now have an additional full miner node attached to your HIAS Blockchain.

&nbsp;

# Contributing
Asociacion De Investigacion En Inteligencia Artificial Para La Leucemia Peter Moss encourages and welcomes code contributions, bug fixes and enhancements from the Github community.

Please read the [CONTRIBUTING](CONTRIBUTING.md "CONTRIBUTING") document for a full guide to forking our repositories and submitting your pull requests. You will also find information about our code of conduct on this page.

## Contributors

- [Adam Milton-Barker](https://www.leukemiaresearchassociation.ai/team/adam-milton-barker "Adam Milton-Barker") - [Asociacion De Investigacion En Inteligencia Artificial Para La Leucemia Peter Moss](https://www.leukemiaresearchassociation.ai "Asociacion De Investigacion En Inteligencia Artificial Para La Leucemia Peter Moss") President & Lead Developer, Sabadell, Spain

&nbsp;

# Versioning

We use SemVer for versioning. For the versions available, see [Releases](releases "Releases").

&nbsp;

# License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE "LICENSE") file for details.

&nbsp;

# Bugs/Issues

We use the [repo issues](issues "repo issues") to track bugs and general requests related to using this project.