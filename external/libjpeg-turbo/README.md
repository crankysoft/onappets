# Build script for libjpeg-turbo

[https://github.com/libjpeg-turbo/libjpeg-turbo](https://github.com/libjpeg-turbo/libjpeg-turbo)

# How to Build

Note: これらのスクリプトはバージョン番号を設定しません。気にする方はjconfig.hとjconfigint.hを編集してください。

アーカイブをダウンロード、解凍し、'libjpeg-turbo'というフォルダ名で用意します。


## For Android

### Source version

- 'android_source.bat'を実行します
- 成果物は'output'に出力されます

```
> android_source.bat
```


### Prebuilt version

Note: Application.mkは他のネイティブライブラリと共通の設定にしなければなりません。通常、アプリケーションで使っているApplication.mkを指すようにしてください。

- Android NDKを用意します
- アプリケーションで使っているApplication.mkを用意します
  (なければ、直下にあるApplication.mkを、必要なら、改変して使ってください。)
- 'android_source.bat'を実行します
- 'android_prebuilt.bat'を実行します
- 成果物は'output'に出力されます

```
> android_source.bat
> android_prebuilt.bat Application.mk d:\sdk\android-ndk-r14b
```


## For Windows

- 'NASM'を使えるように準備してください。(これは'Visual Studio'の'MASM'ではありません。)
- 'windows_source.bat'を実行します
- 成果物は'output'に出力されます

```
>windows_source.bat d:\tools\nasm\nasm.exe
```
