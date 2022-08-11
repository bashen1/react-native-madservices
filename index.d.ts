export interface IGetAttributionToken {
    /**
     * 状态码
     */
    code: number;
    /**
     * 归因 token
     */
    token: string;
    /**
     * 错误信息
     */
    msg: string;
}

export interface IGetAttributionData {
    /**
     * 状态码
     */
    code: number;
    /**
     * 归因数据
     */
    data: any;
    /**
     * 错误信息
     */
    msg: string;
}

export default class AdServices {
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
}