import { keyExtractSuri, mnemonicGenerate, mnemonicValidate, cryptoWaitReady, signatureVerify } from "@polkadot/util-crypto";
import { hexToU8a, u8aToHex, isHex, stringToHex } from "@polkadot/util";
import { decodeAddress, encodeAddress } from '@polkadot/keyring';
import BN from "bn.js";
import { parseQrCode, getSigner, makeTx, getSubmittable } from "../utils/QrSigner";
import gov from "./gov";
import { Keyring } from "@polkadot/keyring";
import { KeypairType } from "@polkadot/util-crypto/types";
import { KeyringPair, KeyringPair$Json } from "@polkadot/keyring/types";
import { ApiPromise, SubmittableResult, WsProvider } from "@polkadot/api";
import { SubmittableExtrinsic } from "@polkadot/api/types";
import { ITuple } from "@polkadot/types/types";
import { DispatchError } from "@polkadot/types/interfaces";
import { ContractPromise } from "@polkadot/api-contract";
import { Result } from "@polkadot/types";
let keyring = new Keyring({ ss58Format: 42, type: "sr25519" });

// const alic = keyring.addFromMnemonic(seed);
// const {nonce, data: balance} = await api.query.system.account(alic.address);

var selAddr;

function send(path: string, data: any) {
  if (window.location.href === "about:blank") {
    // PolkaWallet.postMessage(JSON.stringify({ path, data }));
  } else {
    console.log(path, data);
  }
}

(<any>window).send = send;

/**
 * Generate a set of new mnemonic.
 */
async function gen() {
  const mnemonic = mnemonicGenerate();
  return {
    mnemonic,
  };
}

async function validateMnemonic(mnemonic: string) {
  return new Promise(async (resolve, reject) => {
    const isValidMnemonic = mnemonicValidate(mnemonic);
    resolve(isValidMnemonic);
  });
}

async function validateAddress(address: string) {
  return new Promise(async (resolve, reject) => {

    const isValidAddressPolkadotAddress = () => {
      try {
        encodeAddress(
          isHex(address)
            ? hexToU8a(address)
            : decodeAddress(address)
        );

        resolve(true);
      } catch (error) {
        send("log", error);

        resolve(false);
      }
    };

    const isValid = isValidAddressPolkadotAddress();
  });
}

async function loginAccessSel12(api: ApiPromise, email: string, password: string, seed: string) {
  console.log("loginAccessSel12");
  let aliza = keyring.addFromUri('author notable dial assume confirm inner hammer attack daring hair blue join');
  const login = api.tx.identity.loginAccessSel12(email, password);
  return new Promise( async (resolve, reject) => {
    try {
      await login.signAndSend(aliza, ({ status, events, dispatchError }) => {
        // status would still be set, but in the case of error we can shortcut
        // to just check it (so an error would indicate InBlock or Finalized)
        if (dispatchError) {
          if (dispatchError.isModule) {
            // for module errors, we have the section indexed, lookup
            const decoded = api.registry.findMetaError(dispatchError.asModule);
            const { docs, name, section } = decoded;
    
            console.log(`${section}.${name}: ${docs.join(' ')}`);
  
            resolve({'status': false,'message': name == 'NoIdentity' ? 'This account doesn\'t exist' : name});
          } else {
            // Other, CannotLookup, BadOrigin, no extra info
            console.log(dispatchError.toString());
          }
        } else {
          events.forEach(({ phase, event: { data, method, section } }) => {
            console.log(`\t' ${phase}: ${section}.${method}:: ${data}`);
            resolve({'status': true,'message': 'Login successfully'});
          });
        }
        
      });
    } catch (e){
      return {'status': false, 'message': e};
    }
  });
}

/// Student ID
async function registerSel11(api: ApiPromise, email: string, password: string) {
  console.log("registerSel11");
  let aliza = keyring.addFromUri('author notable dial assume confirm inner hammer attack daring hair blue join');
  // const register = api.tx.identity.requestRegistrationSel11(email, password);
  const register = api.tx.identity.requestRegistrationSel11(email, password);
  
  return new Promise( async (resolve, reject) => {
    try {

      await register.signAndSend(aliza, ({ status, events, dispatchError }) => {
        // status would still be set, but in the case of error we can shortcut
        // to just check it (so an error would indicate InBlock or Finalized)
        if (dispatchError) {
          if (dispatchError.isModule) {
            // for module errors, we have the section indexed, lookup
            const decoded = api.registry.findMetaError(dispatchError.asModule);
            const { docs, name, section } = decoded;
    
            console.log(`${section}.${name}: ${docs.join(' ')}`);

            resolve({'status': false,'message': name == "IdentityAlreadyClaimed" ? 'Email already registered' : name});
          } else {
            // Other, CannotLookup, BadOrigin, no extra info
            console.log(dispatchError.toString());
          }
        } else {
          events.forEach(({ phase, event: { data, method, section } }) => {
            console.log(`\t' ${phase}: ${section}.${method}:: ${data}`);
            resolve({'status': true,'message': 'Registration completed successfully'});
          });
        }
        
      });
    }
    catch (e){
      console.log('Register error ', e);
      return {'status': false, 'message': e};
    }
  })
  // return result;
}

async function changePasswordSel13(api: ApiPromise, email: string, password: string, seed: string ){

  const alic = keyring.addFromUri(seed);
  const {nonce} = await api.query.system.account(alic.address);

  console.log("nonce", nonce);

  const register = api.tx.identity.changePasswordSel13(email, password);

  try {
    const hash = await register.signAndSend(alic);
    console.log("change Password with hash", hash);
    return hash.hash;
  } catch (e){
    console.log('Register error ', e);
  }
}

async function eventTx (api: ApiPromise){
  // no blockHash is specified, so we retrieve the latest
// const signedBlock = await api.rpc.chain.getBlock();
// const allRecords = await api.query.system.events.at(signedBlock.block.header.hash);

//   signedBlock.block.extrinsics.forEach(({ method: { method, section } }, index) => {
//     allRecords
//       // filter the specific events based on the phase and then the
//       // index of our extrinsic in the block
//       // find/filter for failed events
//       // .filter(({ event }) =>
//       //   api.events.system.ExtrinsicFailed.is(event)
//       // )
//       // test the events against the specific types we are looking for
//       .forEach(({ event }) => {
//         console.log("api.events.system.ExtrinsicFailed.is(event)", api.events.system.ExtrinsicFailed.is(event));
//         if (api.events.system.ExtrinsicSuccess.is(event)) {
//           // extract the data for this event
//           // (In TS, because of the guard above, these will be typed)
//           const [dispatchInfo] = event.data;
  
//           console.log(`${section}.${method}:: ExtrinsicSuccess:: ${JSON.stringify(dispatchInfo.toHuman())}`);
//         } else if (api.events.system.ExtrinsicFailed.is(event)) {
//           // extract the data for this event
//           const [dispatchError, dispatchInfo] = event.data;
//           let errorInfo;
  
//           // decode the error
//           if (dispatchError.isModule) {
//             // for module errors, we have the section indexed, lookup
//             // (For specific known errors, we can also do a check against the
//             // api.errors.<module>.<ErrorName>.is(dispatchError.asModule) guard)
//             const decoded = api.registry.findMetaError(dispatchError.asModule);
  
//             errorInfo = `${decoded.section}.${decoded.name}`;
//           } else {
//             // Other, CannotLookup, BadOrigin, no extra info
//             errorInfo = dispatchError.toString();
//           }
  
//           console.log(`${section}.${method}:: ExtrinsicFailed:: ${errorInfo}`);
//         }
//       });
//   });

  return new Promise((resolve, reject) => {
    return api.query.system.events((events) => {
      console.log(`\nReceived ${events.length} events:`);
    
      // Loop through the Vec<EventRecord>
      events.forEach((record, ) => {
        // Extract the phase, event and the event types
        const { event, phase } = record;
        const types = event.typeDef;
    
        // Show what we are busy with
        console.log(
          `\t${event.section}:${event.method}:: (phase=${phase.toString()})`
        );
        if (event.method == "ExtrinsicFailed") resolve(event.method);
        // console.log(`\t\t${event.meta.documentation.toString()}`);
    
        // Loop through each of the parameters, displaying the type and data
        event.data.forEach((data, index) => {
          console.log(`\t\t\t${types[index].type}: ${data.toString()}`);
          
        });
      });
      
    });
  })


}
/**
 * Import keyPair from mnemonic, rawSeed or keystore.
 */
function recover(keyType: string, cryptoType: KeypairType, key: string, password: string) {
  return new Promise((resolve, reject) => {
    let keyPair: KeyringPair;
    let mnemonic = "";
    let rawSeed = "";
    try {
      switch (keyType) {
        case "mnemonic":
          keyPair = keyring.addFromMnemonic(key, {}, cryptoType);
          mnemonic = key;
          break;
        case "rawSeed":
          keyPair = keyring.addFromUri(key, {}, cryptoType);
          rawSeed = key;
          break;
        case "keystore":
          const keystore = JSON.parse(key);
          keyPair = keyring.addFromJson(keystore);
          try {
            keyPair.decodePkcs8(password);
          } catch (err) {
            resolve(null);
          }
          resolve({
            pubKey: u8aToHex(keyPair.publicKey),
            ...keyPair.toJson(password),
          });
          break;
      }
    } catch (err) {
      resolve({ error: err.message });
    }
    if (keyPair.address) {
      const json = keyPair.toJson(password);
      keyPair.lock();
      // try add to keyring again to avoid no encrypted data bug
      keyring.addFromJson(json);
      resolve({
        pubKey: u8aToHex(keyPair.publicKey),
        mnemonic,
        rawSeed,
        ...json,
      });
    } else {
      resolve(null);
    }
  });
}

/**
 * Add user's accounts to keyring incedence,
 * so user can use them to sign txs with password.
 * We use a list of ss58Formats to encode the accounts
 * into different address formats for different networks.
 */
async function initKeys(accounts: KeyringPair$Json[], ss58Formats: number[]) {
  console.log("initKeys");
  await cryptoWaitReady();
  const res = {};
  ss58Formats.forEach((ss58) => {
    (<any>res)[ss58] = {};
  });

  accounts.forEach((i) => {
    // import account to keyring
    const keyPair = keyring.addFromJson(i);
    // then encode address into different ss58 formats
    ss58Formats.forEach((ss58) => {
      const pubKey = u8aToHex(keyPair.publicKey);
      (<any>res)[ss58][pubKey] = keyring.encodeAddress(keyPair.publicKey, ss58);
      console.log("Ss58", ss58);
      if (ss58 == 42 || ss58 == 972){
        selAddr = keyring.encodeAddress(keyPair.publicKey, ss58);
      }
    });
  });
  return res;
}

async function getSELAddr() {
  return selAddr;
}

function getKr(){
  return keyring;
}

/**
 * estimate gas fee of an extrinsic
 */
async function txFeeEstimate(api: ApiPromise, txInfo: any, paramList: any[]) {
  let tx: SubmittableExtrinsic<"promise">;
  // wrap tx with council.propose for treasury propose
  if (txInfo.txName == "treasury.approveProposal") {
    tx = await gov.makeTreasuryProposalSubmission(api, paramList[0], false);
  } else if (txInfo.txName == "treasury.rejectProposal") {
    tx = await gov.makeTreasuryProposalSubmission(api, paramList[0], true);
  } else {
    tx = api.tx[txInfo.module][txInfo.call](...paramList);
  }

  let sender = txInfo.sender.address;
  if (txInfo.proxy) {
    // wrap tx with recovery.asRecovered for proxy tx
    tx = api.tx.recovery.asRecovered(txInfo.sender.address, tx);
    sender = keyring.encodeAddress(hexToU8a(txInfo.proxy.pubKey));
  }
  const dispatchInfo = await tx.paymentInfo(sender);
  return dispatchInfo;
}

function _extractEvents(api: ApiPromise, result: SubmittableResult) {
  if (!result || !result.events) {
    return {};
  }

  let success = false;
  let error: DispatchError["type"] = "";
  result.events
    .filter((event) => !!event.event)
    .map(({ event: { data, method, section } }) => {
      if (section === "system" && method === "ExtrinsicFailed") {
        const [dispatchError] = (data as unknown) as ITuple<[DispatchError]>;
        let message = dispatchError.type;

        if (dispatchError.isModule) {
          try {
            const mod = dispatchError.asModule;
            const err = api.registry.findMetaError(new Uint8Array([mod.index.toNumber(), mod.error.toNumber()]));

            message = `${err.section}.${err.name}`;
          } catch (error) {
            // swallow error
          }
        }
        (<any>window).send("txUpdateEvent", {
          title: `${section}.${method}`,
          message,
        });
        error = message;
      } else {
        (<any>window).send("txUpdateEvent", {
          title: `${section}.${method}`,
          message: "ok",
        });
        if (section == "system" && method == "ExtrinsicSuccess") {
          success = true;
        }
      }
    });
  return { success, error };
}

/**
 * sign and send extrinsic to network and wait for result.
 */
function sendTx(api: ApiPromise, txInfo: any, paramList: any[], password: string, msgId: string) {
  return new Promise(async (resolve) => {
    let tx: SubmittableExtrinsic<"promise">;
    // wrap tx with council.propose for treasury propose
    if (txInfo.txName == "treasury.approveProposal") {
      tx = await gov.makeTreasuryProposalSubmission(api, paramList[0], false);
    } else if (txInfo.txName == "treasury.rejectProposal") {
      tx = await gov.makeTreasuryProposalSubmission(api, paramList[0], true);
    } else {
      tx = api.tx[txInfo.module][txInfo.call](...paramList);
    }
    let unsub = () => { };
    const onStatusChange = (result: SubmittableResult) => {
      if (result.status.isInBlock || result.status.isFinalized) {
        const { success, error } = _extractEvents(api, result);
        if (success) {
          resolve({ hash: tx.hash.toString() });
        }
        if (error) {
          resolve({ error });
        }
        unsub();
      } else {
        (<any>window).send(msgId, result.status.type);
      }
    };
    if (txInfo.isUnsigned) {
      tx.send(onStatusChange)
        .then((res) => {
          unsub = res;
        })
        .catch((err) => {
          resolve({ error: err.message });
        });
      return;
    }

    let keyPair: KeyringPair;
    if (!txInfo.proxy) {
      keyPair = keyring.getPair(hexToU8a(txInfo.sender.pubKey));
    } else {
      // wrap tx with recovery.asRecovered for proxy tx
      tx = api.tx.recovery.asRecovered(txInfo.sender.address, tx);
      keyPair = keyring.getPair(hexToU8a(txInfo.proxy.pubKey));
    }

    try {
      keyPair.decodePkcs8(password);
    } catch (err) {
      resolve({ error: "PIN verification failed" });
    }
    tx.signAndSend(keyPair, { tip: new BN(txInfo.tip, 10) }, onStatusChange)
      .then((res) => {
        unsub = res;
      })
      .catch((err) => {
        resolve({ error: err.message });
      });
  });
}


async function aCheckIn(aContract: ContractPromise, senderPubKey: string, password: string, attendantHash: string, location: string) {
  return new Promise(async (resolve, reject) => {
    try {
      const keyPair = keyring.getPair(hexToU8a(senderPubKey));
      try {
        keyPair.decodePkcs8(password);
      } catch (err) {
        resolve({ error: "PIN verification failed" });
      }

      await aContract.tx.checkedIn(0, -1, attendantHash, location).signAndSend(keyPair, ({ events = [], status }) => {
        if (status.isInBlock) {
          resolve({ status: "In Block" });
        }
      });

    } catch (e) {
      resolve({ err: e.message });
    }
  });
}

async function aCheckOut(aContract: ContractPromise, senderPubKey: string, password: string, attendantHash: string, location: string) {
  return new Promise(async (resolve, reject) => {
    try {
      const keyPair = keyring.getPair(hexToU8a(senderPubKey));
      try {
        keyPair.decodePkcs8(password);
      } catch (err) {
        resolve({ error: "PIN verification failed" });
      }

      await aContract.tx.checkedOut(0, -1, attendantHash, location).signAndSend(keyPair, ({ events = [], status }) => {
        if (status.isInBlock) {
          resolve({ status: "In Block" });
        }
      });
    } catch (e) {
      resolve({ err: e.message });
    }
  });
}

async function contractTransfer(apiContract: ContractPromise, senderPubKey: string, to: string, value: string, password: string, hash: string) {
  return new Promise(async (resolve, reject) => {
    try {
      const keyPair = keyring.getPair(hexToU8a(senderPubKey));
      try {
        keyPair.decodePkcs8(password);
      } catch (err) {
        resolve({ error: "PIN verification failed" });
      }


      await apiContract.tx.transfer(0, -1, to, hash, Number(value)).signAndSend(keyPair, ({ events = [], status }) => {
        if (status.isInBlock) {
          resolve({ status: 'In Block' })
        } else if (status.isFinalized) {

          resolve({ hash: status.asFinalized });
        }
      });
    } catch (err) {
      resolve({ err: err.message });
    }
  });
}

async function contractTransferFrom(apiContract: ContractPromise, from: string, senderPubKey: string, to: string, value: string, password: string) {
  return new Promise(async (resolve, reject) => {
    try {

      const keyPair = keyring.getPair(hexToU8a(senderPubKey));
      try {
        keyPair.decodePkcs8(password);
      } catch (err) {
        resolve({ error: "PIN verification failed" });
      }
      await apiContract.tx.transferFrom(0, -1, from, to, value).signAndSend(keyPair, ({ events = [], status }) => {
        if (status.isInBlock) {

        } else if (status.isFinalized) {

          resolve({ hash: status.asFinalized });
        }
      });
    } catch (err) {
      resolve({ err: err.message });
    }
  });
}

//const result = await this.polkadotApiService.apiContract.tx.approve(0, -1, sender['to'], sender['value']).signAndSend(pair);

async function approve(apiContract: ContractPromise, senderPubKey: string, to: string, value: string, password: string) {
  return new Promise(async (resolve, reject) => {
    try {

      const keyPair = keyring.getPair(hexToU8a(senderPubKey));
      try {
        keyPair.decodePkcs8(password);
      } catch (err) {
        resolve({ error: "PIN verification failed" });
      }
      await apiContract.tx.approve(0, -1, to, value).signAndSend(keyPair, ({ events = [], status }) => {
        if (status.isInBlock) {

        } else if (status.isFinalized) {
          resolve({ hash: status.asFinalized });
        }
      });
    } catch (err) {
      resolve({ err: err.message });
    }
  });
}

/**
 * check password of an account.
 */
function checkPassword(pubKey: string, pass: string) {
  return new Promise((resolve) => {
    const keyPair = keyring.getPair(hexToU8a(pubKey));
    try {
      if (!keyPair.isLocked) {
        keyPair.lock();
      }
      keyPair.decodePkcs8(pass);
    } catch (err) {
      resolve(null);
    }
    resolve({ success: true });
  });
}

/**
 * change password of an account.
 */
function changePassword(pubKey: string, passOld: string, passNew: string) {
  return new Promise((resolve) => {
    const u8aKey = hexToU8a(pubKey);
    const keyPair = keyring.getPair(u8aKey);
    try {
      if (!keyPair.isLocked) {
        keyPair.lock();
      }
      keyPair.decodePkcs8(passOld);
    } catch (err) {
      resolve(null);
      return;
    }
    const json = keyPair.toJson(passNew);
    keyring.removePair(u8aKey);
    keyring.addFromJson(json);
    resolve({
      pubKey: u8aToHex(keyPair.publicKey),
      ...json,
    });
  });
}

/**
 * check if user input DerivePath valid.
 */
async function checkDerivePath(seed: string, derivePath: string, pairType: KeypairType) {
  try {
    const { path } = keyExtractSuri(`${seed}${derivePath}`);
    // we don't allow soft for ed25519
    if (pairType === "ed25519" && path.some(({ isSoft }) => isSoft)) {
      return "Soft derivation paths are not allowed on ed25519";
    }
  } catch (error) {
    return error.message;
  }
  return null;
}

/**
 * sign tx with QR
 */
async function signAsync(api: ApiPromise, password: string) {
  return new Promise((resolve) => {
    const { unsignedData } = getSigner();
    const keyPair = keyring.getPair(unsignedData.data.account);
    try {
      if (!keyPair.isLocked) {
        keyPair.lock();
      }
      keyPair.decodePkcs8(password);
      const payload = api.registry.createType("ExtrinsicPayload", unsignedData.data.data, { version: api.extrinsicVersion });
      const signed = payload.sign(keyPair);
      resolve(signed);
    } catch (err) {
      resolve({ error: err.message });
    }
  });
}

/**
 * send tx with signed data from QR
 */
function addSignatureAndSend(api: ApiPromise, address: string, signed: string) {
  return new Promise((resolve) => {
    const { tx, payload } = getSubmittable();
    if (!!tx.addSignature) {
      tx.addSignature(address, `0x${signed}`, payload);

      let unsub = () => { };
      const onStatusChange = (result: SubmittableResult) => {
        if (result.status.isInBlock || result.status.isFinalized) {
          const { success, error } = _extractEvents(api, result);
          if (success) {
            resolve({ hash: tx.hash.toString() });
          }
          if (error) {
            resolve({ error });
          }
          unsub();
        } else {
          (<any>window).send("txStatusChange", result.status.type);
        }
      };

      tx.send(onStatusChange)
        .then((res) => {
          unsub = res;
        })
        .catch((err) => {
          resolve({ error: err.message });
        });
    } else {
      resolve({ error: "invalid tx" });
    }
  });
}

/**
 * sign tx from dapp as extension
 */
async function signTxAsExtension(api: ApiPromise, password: string, json: any) {
  return new Promise((resolve) => {
    const keyPair = keyring.getPair(json["address"]);
    try {
      if (!keyPair.isLocked) {
        keyPair.lock();
      }
      keyPair.decodePkcs8(password);
      api.registry.setSignedExtensions(json["signedExtensions"]);
      const payload = api.registry.createType("ExtrinsicPayload", json, {
        version: json["version"],
      });
      const signed = payload.sign(keyPair);
      resolve(signed);
    } catch (err) {
      resolve({ error: err.message });
    }
  });
}

/**
 * sign bytes from dapp as extension
 */
async function signBytesAsExtension(api: ApiPromise, password: string, json: any) {
  return new Promise((resolve) => {
    const keyPair = keyring.getPair(json["address"]);
    try {
      if (!keyPair.isLocked) {
        keyPair.lock();
      }
      keyPair.decodePkcs8(password);
      const isDataHex = isHex(json["data"]);
      resolve({
        signature: u8aToHex(keyPair.sign(hexToU8a(isDataHex ? json["data"] : stringToHex(json["data"])))),
      });
    } catch (err) {
      resolve({ error: err.message });
    }
  });
}

async function verifySignature(message: string, signature: string, address: string) {
  return signatureVerify(message, signature, address);
}

export default {
  initKeys,
  gen,
  getSELAddr,
  getKr,
  validateMnemonic,
  validateAddress,
  recover,
  txFeeEstimate,
  sendTx,
  aCheckIn,
  aCheckOut,
  contractTransfer,
  contractTransferFrom,
  //approve,
  checkPassword,
  changePassword,
  checkDerivePath,
  parseQrCode,
  signAsync,
  makeTx,
  addSignatureAndSend,
  registerSel11,
  changePasswordSel13,
  loginAccessSel12
  //signTxAsExtension,
  //signBytesAsExtension,
  //verifySignature,
};
