# vocabulary-cli

## 概要 About

コマンドラインで使える単語帳です。 Command Line Vocabulary.

## 使用方法 Usage

1. [Docker Compose](https://docs.docker.com/compose/install/) をインストールします。 Install Docker Compose.
2. このリポジトリをダウンロードします（`git clone` など）。 Download this repo (by using `git clone` etc).
3. コマンドプロンプトを起動後、リポジトリのディレクトリ内に移動して、以後の手順に従います。 Run commands bellow.

## 英単語のリストを作成 Make the list of words

```sh
# words.txt が作成されます。 To make words.txt
docker-compose run --rm genwords
```

※作成される単語のリストは [wamerican](https://packages.ubuntu.com/focal/wamerican) に含まれるファイルのコピーです。 words.txt is extracted from the package wamerican.

## 単語帳を使用 Use vocabulary

```sh
docker-compose run --rm cards words.txt
```

## 翻訳・辞書の表示 Translation and the dictionary

```sh
# 英日翻訳 English to japanese.
docker-compose run --rm trans -j en:ja sentence
# 英日辞書を表示 Use the dictionary.
docker-compose run --rm trans -d -j en:ja word
```

## 単語・翻訳・辞書の保存 About saved files

単語帳で表示された単語の意味は cards ディレクトリに、翻訳結果や表示された辞書は logs ディレクトリにテキストファイルとして保存されています。 There're translated files for using vocabulary in ./cards directory, for translating and the dictionary in ./logs directory.  
※ただしアルファベット以外の文字を含む単語や文章など（日本語など）は保存されない場合があります。 Files includes multibyte characters are might not saved.

`less -R` コマンドでファイルを読めます。 To read these, run `less -R`.

メモ帳でもファイルを開けますが、読みにくい場合があります。 These files could be open by Nodepad, but it's maybe hard to read.

## ショートカット Shortcut

bin ディレクトリのパスを環境変数 PATH に登録することにより、短いタイプ数で単語帳の使用や翻訳ができるようになります。 Shortcuts are available with appending ./bin directory to Path.

```sh
# 単語帳 Vocabulary
cards words.txt
# 英日辞書を表示 English Japanese dictionary
den word
# 日英辞書を表示 Japanese English dictionary
dja 言葉
# 日英翻訳 Translate to English
en これは日本語の文章です。
# 英日翻訳 Translate to Japanese
ja This is an English sentence.
# translate-shell を使用 Use translate-shell
trans -d -j en:ja word
```

---

※内部で [translate-shell](https://packages.ubuntu.com/focal/translate-shell) を使用しています。 This app using translate-shell.  
英語、日本語以外の言語を使用したいときは translate-shell のドキュメントを参照してください。 If you want to use other languages, read the documents of translate-shell.
