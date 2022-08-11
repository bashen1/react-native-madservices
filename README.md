# react-native-mAdServices

[![npm version](https://badge.fury.io/js/react-native-madservices.svg)](https://badge.fury.io/js/react-native-madservices)

获取iOS下的自归因数据与token

## 安装

```sh
npm i react-native-madservices -E
cd ios
pod install
```

## 接口

```javascript
/**
 * 是否支持 AdServices 调用
 * iOS only
 */
static isSupportAdServices(): Promise<boolean>;

/**
 * 获取自归因数据 Token(AdServices)
 * 此token需要到 https://api-adservices.apple.com/api/v1/ 换取归因数据
 * iOS only
 */
static getAttributionToken(): Promise<IGetAttributionToken>

/**
 * 获取自归因数据 (iAd)
 * iOS only
 */
static getAttributionData(): Promise<IGetAttributionData>
```

## License

MIT
