import {NativeModules, Platform} from 'react-native';

const {Madservices} = NativeModules;

class AdServices {
    static isSupportAdServices = async () => {
        let res = true;
        if (Platform.OS === 'ios') {
            res = await Madservices.isSupportAdServices();
        }
        return res;
    }

    static getAttributionToken = async () => {
        let res = {
            code: 0,
            token: '',
            msg: '未知错误',
        };
        if (Platform.OS === 'ios') {
            res = await Madservices.getAttributionToken();
        }
        return res;
    }

    static getAttributionData = async () => {
        let res = {
            code: 0,
            token: '',
            msg: '未知错误',
        };
        if (Platform.OS === 'ios') {
            res = await Madservices.getAttributionData();
        }
        return res;
    }
}

export default AdServices;