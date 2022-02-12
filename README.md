# flashcards-cli

## 概要

コマンドラインで使える単語帳です。

## 使用方法

1. [Docker Compose](https://docs.docker.com/compose/install/) をインストールします。
2. このリポジトリをダウンロードします（`git clone` など）。
3. コマンドプロンプトを起動後、リポジトリのディレクトリ内に移動して、以後の手順に従います。

## 英単語のリストを作成

```sh
# words.txt が作成されます。
docker-compose run --rm genwords
```

※作成される単語のリストは [wamerican](https://packages.ubuntu.com/focal/wamerican) に含まれるファイルのコピーです。

## 単語帳を使用

```sh
docker-compose run --rm cards words.txt
```

## 翻訳・辞書の表示

```sh
# 英日翻訳
docker-compose run --rm trans -j en:ja sentence
# 英日辞書を表示
docker-compose run --rm trans -d -j en:ja word
```

## 単語・翻訳・辞書の保存

単語帳で表示された単語の意味は cards ディレクトリに、翻訳結果や表示された辞書は logs ディレクトリにテキストファイルとして保存されています。  
※ただしアルファベット以外の文字を含む単語や文章など（日本語など）は保存されない場合があります。

`less -R` コマンドでファイルを読めます。

メモ帳でもファイルを開けますが、読みにくい場合があります。

## ショートカット

bin ディレクトリのパスを環境変数 PATH に登録することにより、短いタイプ数で単語帳の使用や翻訳ができるようになります。

```sh
# 単語帳
cards words.txt
# 英日辞書を表示
den word
# 日英辞書を表示
dja 言葉
# 日英翻訳
en これは日本語の文章です。
# 英日翻訳
ja This is an English sentence.
# translate-shell を使用
trans -d -j en:ja word
```

※内部で [translate-shell](https://packages.ubuntu.com/focal/translate-shell) を使用しています。  
英語、日本語以外の言語を使用したいときは translate-shell のドキュメントを参照してください。
