#!/bin/sh

DEFAULT_REGION='ap-northeast-1'
INSTANCE_ID='i-05a8d876d14d99ba1'
echo ""
echo "instance-id:["$INSTANCE_ID"]"

## 指定EC2インスタンスの起動(aws ec2 start-instances).
if [ -n "$1" ] && [ $1 = '--start' ] ; then
 
        echo "status is stopped."
        aws ec2 start-instances --instance-ids $INSTANCE_ID --region $DEFAULT_REGION
        echo "ec2 instance starting..."

## 指定EC2インスタンスの停止(stop). 
elif [ -n "$1" ] && [ $1 = '--stop' ] ; then
 
        echo "status is running."
        aws ec2 stop-instances --instance-ids $INSTANCE_ID --region $DEFAULT_REGION
        echo "ec2-instance stopping..."

## 引数無しの場合は何もしない.
else
    if [ -z "$1" ] ; then
        echo "argument is required( --start / --stop ). nothing to do."
    else
        echo "argument is invalid. valid argument is --start or --stop."
    fi
fi
echo ""