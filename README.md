# greatest_common_divisor

## 概要
2つの数の最大公約数を求めるシェルスクリプト(calc.sh)と  
その動作を確認するテストスクリプト(test.sh)です。  
テストスクリプトはTravis Clで動作を確認済みです。  
参考）
テスト結果：travis.png
URL：https://github.com/kuroetky/greatest_common_divisor.git

## 使い方
シェルが使える環境にて、./calc.sh (数字1) (数字2)と入力してください。  
2つの数の最大公約数を求めるので引数が1以上の整数が2つ必要です。    
小数や負の数はエラーメッセージが表示されます。

ex1) 通常操作  
./calc.sh 4 12   
Greatest common is 4  
  
ex2) エラーの場合  
ERROR : argument is not integer #引数が整数ではありません。  
ERROR : argument number is invalid !! #引数の数が不正です。  
ERROR : argument is not natural number!! #引数が自然数ではありません。

## エラー処理
cals.shには下記のエラー処理が含まれています。
整数判定（小数、文字列）
引数の数判定
自然数判定

## license
レポジトリにあるソースコードはMITとします。  
ご自由にご利用ください。  
ただし作者は利用にあたって生じた事象に責任を持ちません。
