# llamafile for balena

Run your own chatGPT like chatbot locally on a balena device, including vision (explain this image) on CPU. Tested to work on x86 on balena.

## Requirements

### Hardware

* i7 computer

### Software

* A balenaCloud account ([sign up here](https://dashboard.balena-cloud.com/))
* [balenaEtcher](https://balena.io/etcher)


## Deploy

You have two options here:

### One-click deploy via [Balena Deploy](https://www.balena.io/docs/learn/deploy/deploy-with-balena-button/)

You can deploy this project to a new balenaCloud application in one click using the button below:

[![](https://balena.io/deploy.svg)](https://dashboard.balena-cloud.com/deploy?repoUrl=https://github.com/mpous/llamafile-balena)

Or, you can create an application in your balenaCloud dashboard and balena push this code to it the traditional way.

### In-control deploy via [balena CLI](https://www.balena.io/docs/reference/balena-cli/)

If you are a balena CLI expert, feel free to use balena CLI. This option lets you configure in detail some options, like adding new services to your deploy or configure de DNS Server to use.

- Sign up on [balena.io](https://dashboard.balena.io/signup)
- Create a new application on balenaCloud.
- Add a new device and download the image of the balenaOS it creates.
- Burn an USB stick, connect it to the device and boot it up.

While the device boots (it will eventually show up in the Balena dashboard) we will prepare de services:

```
cd ~/workspace
git clone https://github.com/mpous/llamafile-balena
cd llamafile-balena
```

- Using [Balena CLI](https://www.balena.io/docs/reference/cli/), push the code with `balena push <fleet-name>`
- See the magic happening, your device is getting updated 🌟Over-The-Air🌟!


## Use llamafile-balena

  - Wait until the llamafile file is downloaded successfully on the device during the first startup.

![llamafile-balena on balenaCloud](https://github.com/mpous/llamafile-balena/assets/173156/829920cd-a57a-4d0f-be97-18fb710e3197)

  - go to your local IP address or balena Public Device URL with the port `8080`.
  - say 'hello'! 
  - you can upload an image and ask it to explain what's on it

![llamafile UI running on a balena device](https://github.com/mpous/llamafile-balena/assets/173156/3ad1194b-c0d5-4762-9a55-d8595461e2a9)


***troubleshooting***:
  - if the error is
```
run-detectors: unable to find an interpreter for ./llamafile-server-0.1-llava-v1.5-7b-q4`
```

then try; 

```
   sudo wget -O /usr/bin/ape https://cosmo.zip/pub/cosmos/bin/ape-$(uname -m).elf
    sudo sh -c "echo ':APE:M::MZqFpD::/usr/bin/ape:' >/proc/sys/fs/binfmt_misc/register"
    sudo sh -c "echo ':APE-jart:M::jartsr::/usr/bin/ape:' >/proc/sys/fs/binfmt_misc/register"
```
