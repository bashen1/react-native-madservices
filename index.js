import {NativeModules, Platform} from 'react-native';

const {Madservices} = NativeModules;

class AdServices {
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
}

export default AdServices;