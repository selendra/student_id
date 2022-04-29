"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __generator = (this && this.__generator) || function (thisArg, body) {
    var _ = { label: 0, sent: function() { if (t[0] & 1) throw t[1]; return t[1]; }, trys: [], ops: [] }, f, y, t, g;
    return g = { next: verb(0), "throw": verb(1), "return": verb(2) }, typeof Symbol === "function" && (g[Symbol.iterator] = function() { return this; }), g;
    function verb(n) { return function (v) { return step([n, v]); }; }
    function step(op) {
        if (f) throw new TypeError("Generator is already executing.");
        while (_) try {
            if (f = 1, y && (t = op[0] & 2 ? y["return"] : op[0] ? y["throw"] || ((t = y["return"]) && t.call(y), 0) : y.next) && !(t = t.call(y, op[1])).done) return t;
            if (y = 0, t) op = [op[0] & 2, t.value];
            switch (op[0]) {
                case 0: case 1: t = op; break;
                case 4: _.label++; return { value: op[1], done: false };
                case 5: _.label++; y = op[1]; op = [0]; continue;
                case 7: op = _.ops.pop(); _.trys.pop(); continue;
                default:
                    if (!(t = _.trys, t = t.length > 0 && t[t.length - 1]) && (op[0] === 6 || op[0] === 2)) { _ = 0; continue; }
                    if (op[0] === 3 && (!t || (op[1] > t[0] && op[1] < t[3]))) { _.label = op[1]; break; }
                    if (op[0] === 6 && _.label < t[1]) { _.label = t[1]; t = op; break; }
                    if (t && _.label < t[2]) { _.label = t[2]; _.ops.push(op); break; }
                    if (t[2]) _.ops.pop();
                    _.trys.pop(); continue;
            }
            op = body.call(thisArg, _);
        } catch (e) { op = [6, e]; y = 0; } finally { f = t = 0; }
        if (op[0] & 5) throw op[1]; return { value: op[0] ? op[1] : void 0, done: true };
    }
};
exports.__esModule = true;
exports.getSubmittable = exports.makeTx = exports.getSigner = exports.parseQrCode = void 0;
var util_1 = require("@polkadot/util");
var util_crypto_1 = require("@polkadot/util-crypto");
var networkSpect_1 = require("../constants/networkSpect");
var gov_1 = require("../service/gov");
var MULTIPART = new Uint8Array([0]);
var signer = {};
var submittable;
/*
  Example Full Raw Data
  ---
  4 // indicates binary
  37 // indicates data length
  --- UOS Specific Data
  00 + // is it multipart?
  0001 + // how many parts in total?
  0000 +  // which frame are we on?
  53 // indicates payload is for Substrate
  01 // crypto: sr25519
  00 // indicates action: signData
  f4cd755672a8f9542ca9da4fbf2182e79135d94304002e6a09ffc96fef6e6c4c // public key
  544849532049532053504152544121 // actual payload to sign (should be SCALE or utf8)
  91b171bb158e2d3848fa23a9f1c25182fb8e20313b2c1eb49219da7a70ce90c3 // genesis hash
  0 // terminator
  --- SQRC Filler Bytes
  ec11ec11ec11ec // SQRC filler bytes
  */
function _rawDataToU8A(rawData) {
    if (!rawData) {
        return null;
    }
    // Strip filler bytes padding at the end
    if (rawData.substr(-2) === "ec") {
        rawData = rawData.substr(0, rawData.length - 2);
    }
    while (rawData.substr(-4) === "ec11") {
        rawData = rawData.substr(0, rawData.length - 4);
    }
    // Verify that the QR encoding is binary and it's ending with a proper terminator
    if (rawData.substr(0, 1) !== "4" || rawData.substr(-1) !== "0") {
        return null;
    }
    // Strip the encoding indicator and terminator for ease of reading
    rawData = rawData.substr(1, rawData.length - 2);
    var length8 = parseInt(rawData.substr(0, 2), 16) || 0;
    var length16 = parseInt(rawData.substr(0, 4), 16) || 0;
    var length = 0;
    // Strip length prefix
    if (length8 * 2 + 2 === rawData.length) {
        rawData = rawData.substr(2);
        length = length8;
    }
    else if (length16 * 2 + 4 === rawData.length) {
        rawData = rawData.substr(4);
        length = length16;
    }
    else {
        return null;
    }
    var bytes = new Uint8Array(length);
    for (var i = 0; i < length; i++) {
        bytes[i] = parseInt(rawData.substr(i * 2, 2), 16);
    }
    return bytes;
}
function _constructDataFromBytes(bytes, multipartComplete) {
    if (multipartComplete === void 0) { multipartComplete = false; }
    return __awaiter(this, void 0, void 0, function () {
        var frameInfo, frameCount, isMultipart, currentFrame, uosAfterFrames, partData, zerothByte, firstByte, secondByte, action, data, address, data, pubKeyHex, publicKeyAsBytes, hexEncodedData, hexPayload, genesisHash, rawPayload, isOversized, network, offset, payload;
        return __generator(this, function (_a) {
            frameInfo = (0, util_1.hexStripPrefix)((0, util_1.u8aToHex)(bytes.slice(0, 5)));
            frameCount = parseInt(frameInfo.substr(2, 4), 16);
            isMultipart = frameCount > 1;
            currentFrame = parseInt(frameInfo.substr(6, 4), 16);
            uosAfterFrames = (0, util_1.hexStripPrefix)((0, util_1.u8aToHex)(bytes.slice(5)));
            // UOS after frames can be metadata json
            if (isMultipart && !multipartComplete) {
                partData = {
                    currentFrame: currentFrame,
                    frameCount: frameCount,
                    isMultipart: isMultipart,
                    partData: uosAfterFrames
                };
                return [2 /*return*/, partData];
            }
            zerothByte = uosAfterFrames.substr(0, 2);
            firstByte = uosAfterFrames.substr(2, 2);
            secondByte = uosAfterFrames.substr(4, 2);
            try {
                // decode payload appropriately via UOS
                switch (zerothByte) {
                    case "45": {
                        data = {
                            data: {}
                        };
                        action = firstByte === "00" || firstByte === "01" ? "signData" : firstByte === "01" ? "signTransaction" : null;
                        address = uosAfterFrames.substr(4, 44);
                        data["action"] = action;
                        data.data["account"] = address;
                        if (action === "signData") {
                            data.data["rlp"] = uosAfterFrames[13];
                        }
                        else if (action === "signTransaction") {
                            data.data["data"] = uosAfterFrames[13];
                        }
                        else {
                            throw new Error("Could not determine action type.");
                        }
                        return [2 /*return*/, data];
                    }
                    case "53": {
                        data = {
                            data: {}
                        };
                        try {
                            data.data["crypto"] = firstByte === "00" ? "ed25519" : firstByte === "01" ? "sr25519" : null;
                            pubKeyHex = uosAfterFrames.substr(6, 64);
                            publicKeyAsBytes = (0, util_1.hexToU8a)("0x" + pubKeyHex);
                            hexEncodedData = "0x" + uosAfterFrames.slice(70);
                            hexPayload = hexEncodedData.slice(0, -64);
                            genesisHash = "0x".concat(hexEncodedData.substr(-64));
                            rawPayload = (0, util_1.hexToU8a)(hexPayload);
                            data.data["genesisHash"] = genesisHash;
                            isOversized = rawPayload.length > 256;
                            network = networkSpect_1.SUBSTRATE_NETWORK_LIST[genesisHash];
                            if (!network) {
                                throw new Error("Signer does not currently support a chain with genesis hash: ".concat(genesisHash));
                            }
                            switch (secondByte) {
                                case "00": // sign mortal extrinsic
                                case "02": // sign immortal extrinsic
                                    data["action"] = isOversized ? "signData" : "signTransaction";
                                    data["oversized"] = isOversized;
                                    data["isHash"] = isOversized;
                                    offset = (0, util_1.compactFromU8a)(rawPayload)[0];
                                    payload = rawPayload.subarray(offset);
                                    // data.data.data = isOversized
                                    // 	? await blake2b(u8aToHex(payload, -1, false))
                                    // 	: rawPayload;
                                    data.data["data"] = rawPayload; // ignore oversized data for now
                                    data.data["account"] = (0, util_crypto_1.encodeAddress)(publicKeyAsBytes, network.prefix); // encode to the prefix;
                                    break;
                                case "01": // data is a hash
                                    data["action"] = "signData";
                                    data["oversized"] = false;
                                    data["isHash"] = true;
                                    data.data["data"] = hexPayload;
                                    data.data["account"] = (0, util_crypto_1.encodeAddress)(publicKeyAsBytes, network.prefix); // default to Kusama
                                    break;
                            }
                        }
                        catch (e) {
                            throw new Error("Error: something went wrong decoding the Substrate UOS payload: " + uosAfterFrames);
                        }
                        return [2 /*return*/, data];
                    }
                    default:
                        throw new Error("Error: Payload is not formatted correctly: " + bytes);
                }
            }
            catch (e) {
                throw new Error("we cannot handle the payload: " + bytes);
            }
            return [2 /*return*/];
        });
    });
}
function _isMultipartData(parsedData) {
    var hasMultiFrames = parsedData.frameCount !== undefined && parsedData.frameCount > 1;
    return parsedData.isMultipart || hasMultiFrames;
}
function _setPartData(currentFrame, frameCount, partData) {
    return __awaiter(this, void 0, void 0, function () {
        var newArray, completedFramesCount, multipartComplete, multipartData, totalFrameCount, partDataAsBytes, i, nextDataState, nextMissedFrames, nextCompletedFramesCount;
        return __generator(this, function (_a) {
            switch (_a.label) {
                case 0:
                    // set it once only
                    if (!signer.totalFrameCount) {
                        newArray = new Array(frameCount).fill(null);
                        signer.multipartData = newArray;
                        signer.totalFrameCount = frameCount;
                    }
                    completedFramesCount = signer.completedFramesCount, multipartComplete = signer.multipartComplete, multipartData = signer.multipartData, totalFrameCount = signer.totalFrameCount;
                    partDataAsBytes = new Uint8Array(partData.length / 2);
                    for (i = 0; i < partDataAsBytes.length; i++) {
                        partDataAsBytes[i] = parseInt(partData.substr(i * 2, 2), 16);
                    }
                    if (currentFrame === 0 && (partDataAsBytes[0] === new Uint8Array([0x00])[0] || partDataAsBytes[0] === new Uint8Array([0x7b])[0])) {
                        // part_data for frame 0 MUST NOT begin with byte 00 or byte 7B.
                        throw new Error("Error decoding invalid part data.");
                    }
                    if (!(completedFramesCount < totalFrameCount)) return [3 /*break*/, 2];
                    nextDataState = multipartData;
                    nextDataState[currentFrame] = partDataAsBytes;
                    nextMissedFrames = nextDataState.reduce(function (acc, current, index) {
                        if (current === null)
                            acc.push(index + 1);
                        return acc;
                    }, []);
                    nextCompletedFramesCount = totalFrameCount - nextMissedFrames.length;
                    signer.completedFramesCount = nextCompletedFramesCount;
                    signer.latestFrame = currentFrame;
                    signer.missedFrames = nextMissedFrames;
                    signer.multipartData = nextDataState;
                    if (!(totalFrameCount > 0 && nextCompletedFramesCount === totalFrameCount && !multipartComplete)) return [3 /*break*/, 2];
                    // all the frames are filled
                    return [4 /*yield*/, _integrateMultiPartData()];
                case 1:
                    // all the frames are filled
                    _a.sent();
                    _a.label = 2;
                case 2: return [2 /*return*/];
            }
        });
    });
}
function _integrateMultiPartData() {
    return __awaiter(this, void 0, void 0, function () {
        var multipartData, totalFrameCount, concatMultipartData, frameInfo;
        return __generator(this, function (_a) {
            switch (_a.label) {
                case 0:
                    multipartData = signer.multipartData, totalFrameCount = signer.totalFrameCount;
                    concatMultipartData = multipartData.reduce(function (acc, part) {
                        if (part === null)
                            throw new Error("part data is not completed");
                        var c = new Uint8Array(acc.length + part.length);
                        c.set(acc);
                        c.set(part, acc.length);
                        return c;
                    }, new Uint8Array(0));
                    frameInfo = (0, util_1.u8aConcat)(MULTIPART, _encodeNumber(totalFrameCount), _encodeNumber(0));
                    concatMultipartData = (0, util_1.u8aConcat)(frameInfo, concatMultipartData);
                    signer.multipartComplete = true;
                    // handle the binary blob as a single UOS payload
                    return [4 /*yield*/, _setParsedData(concatMultipartData, true)];
                case 1:
                    // handle the binary blob as a single UOS payload
                    _a.sent();
                    return [2 /*return*/];
            }
        });
    });
}
function _encodeNumber(value) {
    return new Uint8Array([value >> 8, value & 0xff]);
}
function _setParsedData(strippedData, multipartComplete) {
    if (multipartComplete === void 0) { multipartComplete = false; }
    return __awaiter(this, void 0, void 0, function () {
        var parsedData;
        return __generator(this, function (_a) {
            switch (_a.label) {
                case 0: return [4 /*yield*/, _constructDataFromBytes(strippedData, multipartComplete)];
                case 1:
                    parsedData = _a.sent();
                    if (!_isMultipartData(parsedData)) return [3 /*break*/, 3];
                    return [4 /*yield*/, _setPartData(parsedData["currentFrame"], parsedData["frameCount"], parsedData["partData"])];
                case 2:
                    _a.sent();
                    return [2 /*return*/];
                case 3:
                    signer.unsignedData = parsedData;
                    return [2 /*return*/];
            }
        });
    });
}
function parseQrCode(rawData) {
    return __awaiter(this, void 0, void 0, function () {
        var strippedData, err_1;
        return __generator(this, function (_a) {
            switch (_a.label) {
                case 0:
                    signer = {};
                    _a.label = 1;
                case 1:
                    _a.trys.push([1, 3, , 4]);
                    strippedData = _rawDataToU8A(rawData);
                    return [4 /*yield*/, _setParsedData(strippedData, false)];
                case 2:
                    _a.sent();
                    return [2 /*return*/, { signer: signer.unsignedData.data.account }];
                case 3:
                    err_1 = _a.sent();
                    return [2 /*return*/, { error: err_1.message }];
                case 4: return [2 /*return*/];
            }
        });
    });
}
exports.parseQrCode = parseQrCode;
function getSigner() {
    return signer;
}
exports.getSigner = getSigner;
var CMD_HASH = 1;
var CMD_MORTAL = 2;
function makeTx(api, txInfo, paramList, ss58) {
    var _this = this;
    return new Promise(function (resolve) {
        var signer = txInfo.proxy ? (0, util_crypto_1.encodeAddress)((0, util_1.hexToU8a)(txInfo.proxy.pubKey), ss58) : txInfo.sender.address;
        api.derive.tx
            .signingInfo(signer)
            .then(function (_a) {
            var header = _a.header, mortalLength = _a.mortalLength, nonce = _a.nonce;
            return __awaiter(_this, void 0, void 0, function () {
                var tx, signerPayload, payload, qrIsHashed, wrapper, qrPayload;
                var _b;
                return __generator(this, function (_c) {
                    switch (_c.label) {
                        case 0:
                            if (!(txInfo.txName == "treasury.approveProposal")) return [3 /*break*/, 2];
                            return [4 /*yield*/, gov_1["default"].makeTreasuryProposalSubmission(api, paramList[0], false)];
                        case 1:
                            tx = _c.sent();
                            return [3 /*break*/, 5];
                        case 2:
                            if (!(txInfo.txName == "treasury.rejectProposal")) return [3 /*break*/, 4];
                            return [4 /*yield*/, gov_1["default"].makeTreasuryProposalSubmission(api, paramList[0], true)];
                        case 3:
                            tx = _c.sent();
                            return [3 /*break*/, 5];
                        case 4:
                            tx = (_b = api.tx[txInfo.module])[txInfo.call].apply(_b, paramList);
                            _c.label = 5;
                        case 5:
                            // wrap tx with recovery.asRecovered for proxy tx
                            if (txInfo.proxy) {
                                tx = api.tx.recovery.asRecovered(txInfo.sender.address, tx);
                            }
                            signerPayload = api.registry.createType("SignerPayload", {
                                address: signer,
                                blockHash: header.hash,
                                blockNumber: header ? header.number : 0,
                                era: api.registry.createType("ExtrinsicEra", {
                                    current: header.number,
                                    period: mortalLength
                                }),
                                genesisHash: api.genesisHash,
                                method: tx.method,
                                nonce: nonce,
                                signedExtensions: ["CheckNonce"],
                                tip: txInfo.tip,
                                runtimeVersion: {
                                    specVersion: api.runtimeVersion.specVersion,
                                    transactionVersion: api.runtimeVersion.transactionVersion
                                },
                                version: api.extrinsicVersion
                            });
                            payload = signerPayload.toPayload();
                            qrIsHashed = payload.method.length > 5000;
                            wrapper = api.registry.createType("ExtrinsicPayload", payload, {
                                version: payload.version
                            });
                            qrPayload = qrIsHashed ? (0, util_crypto_1.blake2AsU8a)(wrapper.toU8a(true)) : wrapper.toU8a();
                            // cache this submittableExtrinsic
                            submittable = {
                                tx: tx,
                                payload: signerPayload.toPayload()
                            };
                            // submittable.tx = tx;
                            // submittable.payload = signerPayload.toPayload();
                            resolve({
                                qrAddress: payload.address,
                                qrIsHashed: qrIsHashed,
                                qrPayload: _createFrames(_createSignPayload(payload.address, qrIsHashed ? CMD_HASH : CMD_MORTAL, qrPayload, api.genesisHash))[0]
                            });
                            return [2 /*return*/];
                    }
                });
            });
        })["catch"](function (err) { return resolve({ error: err.message }); });
    });
}
exports.makeTx = makeTx;
var SUBSTRATE_ID = new Uint8Array([0x53]);
var CRYPTO_SR25519 = new Uint8Array([0x01]);
var FRAME_SIZE = 1024;
function _createSignPayload(address, cmd, payload, genesisHash) {
    return (0, util_1.u8aConcat)(SUBSTRATE_ID, CRYPTO_SR25519, new Uint8Array([cmd]), (0, util_crypto_1.decodeAddress)(address), (0, util_1.u8aToU8a)(payload), (0, util_1.u8aToU8a)(genesisHash));
}
function _createFrames(input) {
    var frames = [];
    var idx = 0;
    while (idx < input.length) {
        frames.push(input.subarray(idx, idx + FRAME_SIZE));
        idx += FRAME_SIZE;
    }
    return frames.map(function (frame, index) { return (0, util_1.u8aConcat)(MULTIPART, _encodeNumber(frames.length), _encodeNumber(index), frame); });
}
function getSubmittable() {
    return submittable;
}
exports.getSubmittable = getSubmittable;
