# awsutils
cli utils for use on AWS

## includes

```
aws
cfn-elect-cmd-leader
cfn-get-metadata
cfn-hup
cfn-init
cfn-send-cmd-event
cfn-send-cmd-result
cfn-signal
curl
jq
wget
```

## notes

in order to use awscli without specifying keys, you must set up an IAM instance profile
and apply it to your instance/launch configuration:

```
    "cliROrole": {
      "Type": "AWS::IAM::Role",
      "Properties": {
        "AssumeRolePolicyDocument": {
          "Statement": [
            {
              "Effect": "Allow",
              "Principal": {
                "Service": [
                  "ec2.amazonaws.com"
                ]
              },
              "Action": [
                "sts:AssumeRole"
              ]
            }
          ]
        },
        "Policies": [
          {
            "PolicyName": "CLIROAccess",
            "PolicyDocument": {
              "Statement": [
                {
                  "Effect": "Allow",
                  "Action": [
                    "ec2:Describe*"
                  ],
                  "Resource": "*"
                },
                {
                  "Effect": "Allow",
                  "Action": [
                    "autoscaling:Describe*"
                  ],
                  "Resource": "*"
                }
              ]
            }
          }
        ],
        "Path": "/"
      }
    },
    "CLIROAccessProfile": {
      "Type": "AWS::IAM::InstanceProfile",
      "Properties": {
        "Path": "/",
        "Roles": [
          {
            "Ref": "cliROrole"
          }
        ]
      }
    }
```
