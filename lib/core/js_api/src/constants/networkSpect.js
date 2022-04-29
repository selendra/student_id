"use strict";
var __assign = (this && this.__assign) || function () {
    __assign = Object.assign || function(t) {
        for (var s, i = 1, n = arguments.length; i < n; i++) {
            s = arguments[i];
            for (var p in s) if (Object.prototype.hasOwnProperty.call(s, p))
                t[p] = s[p];
        }
        return t;
    };
    return __assign.apply(this, arguments);
};
var _a, _b, _c;
exports.__esModule = true;
exports.defaultNetworkKey = exports.NETWORK_LIST = exports.PATH_IDS_LIST = exports.UNKNOWN_NETWORK = exports.SUBSTRATE_NETWORK_LIST = exports.ETHEREUM_NETWORK_LIST = exports.SubstrateNetworkKeys = exports.EthereumNetworkKeys = exports.UnknownNetworkKeys = exports.NetworkProtocols = exports.unknownNetworkPathId = void 0;
var colors = {
    background: {
        app: "#151515",
        button: "C0C0C0",
        card: "#262626",
        os: "#000000"
    },
    border: {
        dark: "#000000",
        light: "#666666",
        signal: "#8E1F40"
    },
    signal: {
        error: "#D73400",
        main: "#FF4077"
    },
    text: {
        faded: "#9A9A9A",
        main: "#C0C0C0"
    }
};
exports.unknownNetworkPathId = "";
exports.NetworkProtocols = Object.freeze({
    ETHEREUM: "ethereum",
    SUBSTRATE: "substrate",
    UNKNOWN: "unknown"
});
// accounts for which the network couldn't be found (failed migration, removed network)
exports.UnknownNetworkKeys = Object.freeze({
    UNKNOWN: "unknown"
});
// ethereumChainId is used as Network key for Ethereum networks
/* eslint-disable sort-keys */
exports.EthereumNetworkKeys = Object.freeze({
    FRONTIER: "1",
    ROPSTEN: "3",
    RINKEBY: "4",
    GOERLI: "5",
    KOVAN: "42",
    CLASSIC: "61"
});
/* eslint-enable sort-keys */
// genesisHash is used as Network key for Substrate networks
exports.SubstrateNetworkKeys = Object.freeze({
    ACALA_TC4: "0x783c78945a4e4a3118190bcf93002bb2d2903192bed10040eb52d54500aade36",
    CENTRIFUGE: "0x67dddf2673b69e5f875f6f25277495834398eafd67f492e09f3f3345e003d1b5",
    CENTRIFUGE_AMBER: "0x092af6e7d25178ebab1677d15f66e37b30392b44ef442f728a53dd1bf48ec110",
    EDGEWARE: "0x742a2ca70c2fda6cee4f8df98d64c4c670a052d9568058982dad9d5a7a135c5b",
    KULUPU: "0xf7a99d3cb92853d00d5275c971c132c074636256583fee53b3bbe60d7b8769ba",
    KUSAMA: "0xb0a8d493285c2df73290dfb7e61f870f17b41801197a149ca93654499ea3dafe",
    KUSAMA_CC2: "0xe3777fa922cafbff200cadeaea1a76bd7898ad5b89f7848999058b50e715f636",
    KUSAMA_DEV: "0x5e9679182f658e148f33d3f760f11179977398bb3da8d1f0bf7b267fe6b3ebb0",
    POLKADOT: "0x91b171bb158e2d3848fa23a9f1c25182fb8e20313b2c1eb49219da7a70ce90c3",
    SUBSTRATE_DEV: "0x0d667fd278ec412cd9fccdb066f09ed5b4cfd9c9afa9eb747213acb02b1e70bc",
    WESTEND: "0xe143f23803ac50e8f6f8e62695d1ce9e4e1d68aa36c1cd2cfd15340213f3423e"
});
var unknownNetworkBase = (_a = {},
    _a[exports.UnknownNetworkKeys.UNKNOWN] = {
        color: colors.signal.error,
        order: 99,
        pathId: exports.unknownNetworkPathId,
        prefix: 2,
        protocol: exports.NetworkProtocols.UNKNOWN,
        secondaryColor: colors.background.card,
        title: "Unknown network"
    },
    _a);
var substrateNetworkBase = (_b = {},
    _b[exports.SubstrateNetworkKeys.ACALA_TC4] = {
        color: "#173DC9",
        decimals: 18,
        genesisHash: exports.SubstrateNetworkKeys.ACALA_TC4,
        order: 42,
        pathId: "acala_mandala_tc4",
        prefix: 42,
        title: "Acala Mandala TC4",
        unit: "ACA"
    },
    _b[exports.SubstrateNetworkKeys.CENTRIFUGE] = {
        color: "#FCC367",
        decimals: 18,
        genesisHash: exports.SubstrateNetworkKeys.CENTRIFUGE,
        order: 6,
        pathId: "centrifuge",
        prefix: 36,
        title: "Centrifuge Mainnet",
        unit: "RAD"
    },
    _b[exports.SubstrateNetworkKeys.CENTRIFUGE_AMBER] = {
        color: "#7C6136",
        decimals: 18,
        genesisHash: exports.SubstrateNetworkKeys.CENTRIFUGE_AMBER,
        order: 7,
        pathId: "centrifuge_amber",
        prefix: 42,
        title: "Centrifuge Testnet Amber",
        unit: "ARAD"
    },
    _b[exports.SubstrateNetworkKeys.EDGEWARE] = {
        color: "#0B95E0",
        decimals: 18,
        genesisHash: exports.SubstrateNetworkKeys.EDGEWARE,
        order: 4,
        pathId: "edgeware",
        prefix: 7,
        title: "Edgeware",
        unit: "EDG"
    },
    _b[exports.SubstrateNetworkKeys.KULUPU] = {
        color: "#003366",
        decimals: 18,
        genesisHash: exports.SubstrateNetworkKeys.KULUPU,
        order: 5,
        pathId: "kulupu",
        prefix: 16,
        title: "Kulupu",
        unit: "KULU"
    },
    _b[exports.SubstrateNetworkKeys.KUSAMA] = {
        color: "#000",
        decimals: 12,
        genesisHash: exports.SubstrateNetworkKeys.KUSAMA,
        order: 2,
        pathId: "kusama",
        prefix: 2,
        title: "Kusama",
        unit: "KSM"
    },
    _b[exports.SubstrateNetworkKeys.KUSAMA_CC2] = {
        color: "#000",
        decimals: 12,
        genesisHash: exports.SubstrateNetworkKeys.KUSAMA,
        order: 2,
        pathId: "kusama_CC2",
        prefix: 2,
        title: "Kusama",
        unit: "KSM"
    },
    _b[exports.SubstrateNetworkKeys.KUSAMA_DEV] = {
        color: "#000",
        decimals: 12,
        genesisHash: exports.SubstrateNetworkKeys.KUSAMA_DEV,
        order: 99,
        pathId: "kusama_dev",
        prefix: 2,
        title: "Kusama Development",
        unit: "KSM"
    },
    _b[exports.SubstrateNetworkKeys.POLKADOT] = {
        color: "#E6027A",
        decimals: 12,
        genesisHash: null,
        order: 1,
        pathId: "polkadot",
        prefix: 0,
        title: "Polkadot",
        unit: "DOT"
    },
    _b[exports.SubstrateNetworkKeys.SUBSTRATE_DEV] = {
        color: "#18FFB2",
        decimals: 12,
        genesisHash: exports.SubstrateNetworkKeys.SUBSTRATE_DEV,
        order: 100,
        pathId: "substrate_dev",
        prefix: 42,
        title: "Substrate Development",
        unit: "UNIT"
    },
    _b[exports.SubstrateNetworkKeys.WESTEND] = {
        color: "#660D35",
        decimals: 12,
        genesisHash: exports.SubstrateNetworkKeys.WESTEND,
        order: 3,
        pathId: "westend",
        prefix: 42,
        title: "Westend",
        unit: "WND"
    },
    _b);
var ethereumNetworkBase = (_c = {},
    _c[exports.EthereumNetworkKeys.FRONTIER] = {
        color: "#8B94B3",
        ethereumChainId: exports.EthereumNetworkKeys.FRONTIER,
        order: 101,
        secondaryColor: colors.background.card,
        title: "Ethereum"
    },
    _c[exports.EthereumNetworkKeys.CLASSIC] = {
        color: "#1a4d33",
        ethereumChainId: exports.EthereumNetworkKeys.CLASSIC,
        order: 102,
        secondaryColor: colors.background.card,
        title: "Ethereum Classic"
    },
    _c[exports.EthereumNetworkKeys.ROPSTEN] = {
        ethereumChainId: exports.EthereumNetworkKeys.ROPSTEN,
        order: 104,
        title: "Ropsten Testnet"
    },
    _c[exports.EthereumNetworkKeys.GOERLI] = {
        ethereumChainId: exports.EthereumNetworkKeys.GOERLI,
        order: 105,
        title: "Görli Testnet"
    },
    _c[exports.EthereumNetworkKeys.KOVAN] = {
        ethereumChainId: exports.EthereumNetworkKeys.KOVAN,
        order: 103,
        title: "Kovan Testnet"
    },
    _c);
var ethereumDefaultValues = {
    color: "#434875",
    protocol: exports.NetworkProtocols.ETHEREUM,
    secondaryColor: colors.background.card
};
var substrateDefaultValues = {
    color: "#4C4646",
    protocol: exports.NetworkProtocols.SUBSTRATE,
    secondaryColor: colors.background.card
};
function setDefault(networkBase, defaultProps) {
    return Object.keys(networkBase).reduce(function (acc, networkKey) {
        var _a;
        return __assign(__assign({}, acc), (_a = {}, _a[networkKey] = __assign(__assign({}, defaultProps), networkBase[networkKey]), _a));
    }, {});
}
exports.ETHEREUM_NETWORK_LIST = Object.freeze(setDefault(ethereumNetworkBase, ethereumDefaultValues));
exports.SUBSTRATE_NETWORK_LIST = Object.freeze(setDefault(substrateNetworkBase, substrateDefaultValues));
exports.UNKNOWN_NETWORK = Object.freeze(unknownNetworkBase);
var substrateNetworkMetas = Object.values(__assign(__assign({}, exports.SUBSTRATE_NETWORK_LIST), exports.UNKNOWN_NETWORK));
exports.PATH_IDS_LIST = substrateNetworkMetas.map(function (meta) { return meta.pathId; });
exports.NETWORK_LIST = Object.freeze(Object.assign({}, exports.SUBSTRATE_NETWORK_LIST, exports.ETHEREUM_NETWORK_LIST, exports.UNKNOWN_NETWORK));
exports.defaultNetworkKey = exports.SubstrateNetworkKeys.KUSAMA;
// function getGenesis(name: string): string {
//   const network = networks.find(({ network }) => network === name);
//   assert(network && network.genesisHash[0], `Unable to find genesisHash for ${name}`);
//   return network.genesisHash[0];
// }
// export const KUSAMA_GENESIS = getGenesis("kusama");
// export const POLKADOT_GENESIS = getGenesis("polkadot");
