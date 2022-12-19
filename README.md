# goからc++のライブラリを呼び出す

GoからC++のライブラリを呼び出す機構を作ってみる。

呼び出し検証済
- 静的ライブラリ
- 動的ライブラリ

## linuxから呼び出し

```shell
# linux向けビルド用コンテナの作成
$ make docker-build-builder

# linux向けライブラリのビルド
$ make docker-build-lib

# linux向け実行環境のビルド
$ make docker-build-executor

# linux向けライブラリを含めて実行
$ make docker-executor
> go run main.go
```

## 参考

- [ライブラリのリンク方法をきっちり区別しよう -Qiita](https://qiita.com/argama147/items/2f636a2f4fd76f6ce130)
- [CMake入門-基本概念と主な関数 -Qiita](https://qiita.com/sakaeda11/items/fc95f62b68a14ab861dc)
- [C#で書いたライブラリをPHPやGoから呼び出す -Qiita](https://qiita.com/Gaku_Ishii/items/ad4abb1e0073519877d7)
- [CMake Generator](https://cmake.org/cmake/help/latest/manual/cmake-generators.7.html)
- [チュートリアル: 独自のダイナミック リンク ライブラリを作成して使用する (C++)](https://learn.microsoft.com/ja-jp/cpp/build/walkthrough-creating-and-using-a-dynamic-link-library-cpp?view=msvc-170)
