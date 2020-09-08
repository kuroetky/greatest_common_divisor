#!/bin/sh

# *********************************
# *   関数処理
# *********************************

# 整数判定
IsInteger(){
  P1=0

  # 文字列の長さが0より大きい
  if [ ! -z $1 ]; then
    P1=$1
  fi 
  
  # exprは整数以外の計算で2,3を返す
  expr $P1 + 1 > /dev/null 2>&1
  RET=$?
 
  if [ $RET -gt 1 ];then
    echo "ERROR : argument is not integer"
    exit
  fi
}

# 引数チェック
CheckArgument(){
  # 引数の数
  if [ $# -ne 2 ]; then
    echo "ERROR : argument number is invalid !!"
    exit
  fi

  # 整数判定
  IsInteger $NUM1
  IsInteger $NUM2

  # 自然数判定
  if [ $NUM1 -lt 1 ] || [ $NUM2 -lt 1 ]; then
    echo "ERROR : argument is not natural number!!"
    exit
  fi
}

# *******************************
# *  メイン処理
# *******************************

# 変数
NUM1=$1
NUM2=$2
TEP=0

# 引数チェック
CheckArgument $NUM1 $NUM2

# ユークリッド互除法
if [ $NUM1 -lt $NUM2 ]; then
  TMP=$NUM1
  NUM1=$NUM2
  NUM2=$TMP
fi

R=$((NUM1%NUM2))
while [ $R -ne 0 ]
do
  NUM1=$NUM2
  NUM2=$R
  R=$((NUM1%NUM2))
done

echo "Greatest common is ${NUM2}"
exit
