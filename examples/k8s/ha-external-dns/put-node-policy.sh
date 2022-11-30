#!/bin/bash


DEFAULT_REGION="us-east-2"
AWS_REGION="${AWS_REGION:-${DEFAULT_REGION}}"

NODE_ROLE="nodes.mhorejsek.traskaws.net"

export AWS_REGION

aws iam put-role-policy --role-name ${NODE_ROLE} --policy-name external-dns-policy --policy-document '{
 "Version": "2012-10-17",
 "Statement": [
   {
     "Effect": "Allow",
     "Action": [
       "route53:ChangeResourceRecordSets"
     ],
     "Resource": [
       "arn:aws:route53:::hostedzone/*"
     ]
   },
   {
     "Effect": "Allow",
     "Action": [
       "route53:ListHostedZones",
       "route53:ListResourceRecordSets"
     ],
     "Resource": [
       "*"
     ]
   }
 ]
}'
