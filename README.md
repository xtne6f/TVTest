デジタル放送汎用視聴プログラム実装研究資料
==========================================
デジタル放送汎用視聴プログラム実装研究資料(略称 TVTest)は、パーソナルコンピュータ上において、デジタル放送の視聴を行うプログラムの実装を研究する目的で頒布される研究資料です。

この資料は MPEG-2 TS を扱うための基本的な機能を実装しています。  
CAS 処理は実装されていないため、一般のテレビ放送を視聴することはできません。


依存ライブラリ
--------------
* [DirectShow BaseClasses](https://github.com/Microsoft/Windows-classic-samples/tree/master/Samples/Win7Samples/multimedia/directshow/baseclasses)
* [FAAD2](http://www.audiocoding.com/faad2.html)
* [libmad](http://www.underbit.com/products/mad/)
* [liba52](http://liba52.sourceforge.net/)
* [libjpeg](http://www.ijg.org/)
* [libpng](http://libpng.org/)
* [zlib](http://zlib.net/)


ライセンス
----------
GPL v2


このフォークについて
----------
[DBCTRADO/TVTest](https://github.com/DBCTRADO/TVTest) をMSYS2上の [MinGW-w64](https://sourceforge.net/projects/mingw-w64) でビルドできるよう調整します。

[ビルド]
1. [MSYS2](https://www.msys2.org/) の `msys2-i686-日付.exe`(32bitOS用) または `msys2-x86_64-日付.exe`(64bitOS用) をインストール  
   上記サイトに従って`pacman -Syu` →(必要なら)`pacman -Su`でパッケージをアップデート
2. スタートメニューの"MSYS2 MinGW 32-bit"(x64ビルド時は64-bit)を開き、起動した黒窓で以下を実行してmakeとgccとcmakeをインストール  
   `$ pacman -S make mingw-w64-i686-gcc mingw-w64-i686-cmake` (x86ビルド時)  
   `$ pacman -S make mingw-w64-x86_64-gcc mingw-w64-x86_64-cmake` (x64ビルド時)
3. つづけて以下を実行 (この文書が"C:\TVTest"にある場合。src/LibISDBに[LibISDB](https://github.com/xtne6f/LibISDB)を展開しておく)
   ```
   $ cd /c/TVTest/src
   ($ cd /c/TVTest/sdk/Samples #サンプルプラグイン)
   $ mkdir build
   $ cd build
   $ cmake -G "MSYS Makefiles" -DCMAKE_BUILD_TYPE=MinSizeRel ..
   ($ cmake -G "MSYS Makefiles" -DCMAKE_BUILD_TYPE=MinSizeRel -DGEN_TVTEST_VERSION_HASH=1 -DGEN_LIBISDB_VERSION_HASH=1 .. #バージョン情報にgitハッシュを表示)
   ($ cmake -G "MSYS Makefiles" -DCMAKE_BUILD_TYPE=MinSizeRel -DNOMAKE_LIBISDB=1 .. #LibISDBをビルドしない)
   $ make
   ```
