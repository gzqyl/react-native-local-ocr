import {NativeModules} from 'react-native';

const {RNOCRModule} = NativeModules;

export const recognizeImage = (url: string) => {
  return RNOCRModule.recognizeImage(url);
};