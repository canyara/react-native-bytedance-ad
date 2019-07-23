# react-native-bytedance-ad

## Getting started

`$ npm install react-native-bytedance-ad --save`

### Mostly automatic installation

`$ react-native link react-native-bytedance-ad`

### Manual installation

#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-bytedance-ad` and add `RNBytedanceAd.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNBytedanceAd.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`

- Add `import com.reactlibrary.RNBytedanceAdPackage;` to the imports at the top of the file
- Add `new RNBytedanceAdPackage()` to the list returned by the `getPackages()` method

2. Append the following lines to `android/settings.gradle`:
   ```
   include ':react-native-bytedance-ad'
   project(':react-native-bytedance-ad').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-bytedance-ad/android')
   ```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
   ```
     compile project(':react-native-bytedance-ad')
   ```

## Usage

```javascript
import RNBytedanceAd from "react-native-bytedance-ad";

// TODO: What to do with the module?
RNBytedanceAd;
```
