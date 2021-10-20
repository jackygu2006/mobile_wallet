## Introduction
在Polkawallet基础上，添加了以下功能：
* Creating Quantum Secured Wallet, importing and exporting mnemonic
* Adding xxnetwork plugin
* Ajusting some UI

## Dependencies
* Flutter 2.2.x
* Dart 2.13.x
* Node v14.16

## Repos
This app was built with several repos, developers of other substrate based chain may create their own plugin and put it into polkawallet app:
```
__ polkawallet-io/app
    |
    |__ polkawallet-io/ui
    |    |__ polkawallet-io/sdk
    |
    |__ polkawallet_plugin_kusama
    |    |__ polkawallet-io/sdk
    |    |__ polkawallet-io/ui
    |
    |__ polkawallet_plugin_acala
    |    |__ polkawallet-io/sdk
    |    |__ polkawallet-io/ui
    |
    |__ polkawallet_plugin_laminar
    |    |__ polkawallet-io/sdk
    |    |__ polkawallet-io/ui
    |
    |__ <plugin of another substrate based chain>
    |__ <...>

```

### 1. polkawallet-io/js_api
This is a `polkadot-js/api` wrapper which will be built into a single `main.js` file
to run in a hidden webView inside the App. So the App will connect to a substrate node
with `polkadot-js`.

And we wrapped `polkadot-js/keyring` in it, so the App can manage keyPairs.

### 2. polkawallet-io/sdk
This is a `polkawallet-io/js_api` wrapper dart package, it contains:

 1. Keyring. Managing keyPairs.
 2. PolkawalletSDK. Connect to remote node and call `polkadot-js/api` methods.
 3. PolkawalletPlugin. A base plugin class, defined the data and life-circle methods
 which will be used in the App.

A polkawallet plugin can get users' keyPairs in the App from Keyring instance.

A polkawallet plugin implementation should extend the `PolkawalletPlugin` class and
define it's own data & life-circle methods.

### 3. polkawallet-io/ui
The common used flutter widgets for `polkawallet-io/app`, like:
 - AddressInputForm
 - TxConfirmPage
 - ScanPage
 - ...

### 4. polkawallet-io/polkawallet_plugin_xxx
Examples:
 1. [polkawallet-io/polkawallet_plugin_kusama](https://github.com/polkawallet-io/polkawallet_plugin_kusama)
 2. [polkawallet-io/polkawallet_plugin_acala](https://github.com/polkawallet-io/polkawallet_plugin_acala)
 3. [polkawallet-io/polkawallet_plugin_laminar](https://github.com/polkawallet-io/polkawallet_plugin_laminar)

### 5. App state management
We use [https://pub.dev/packages/mobx](https://pub.dev/packages/mobx).
so the directories in a plugin looks like this:
```
__ lib
    |__ pages (the UI)
    |__ store (the MobX store)
    |__ service (the Actions fired by UI to mutate the store)
    |__ ...
```

### 6. Submit your plugin
While your plugin was finished and tested, you may submit an issue in this repo.
We will check into your plugin and add it into the App.

### 7. Plugin update
Submit a update request issue to update your plugin. There are two different kinds of update:
 1. Update the dart package. We will rebuild the App and publish a new release.
 2. Update the js code of your plugin (dart code was not affected). We will rebuild the
  js bundle file and the app will perform a hot-update through polkawallet-api.

## Install
### Android
#### 1. Prepare Firebase

#### 2. Android Key


## TODO List
* Fetch data from blockchain explorer
  * Transaction history
  * Staking operations History
  * Reward slashes 
