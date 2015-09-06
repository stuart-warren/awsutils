# awsutils
cli utils for use on AWS

## notes

in order to use awscli without specifying keys, you must set up an IAM instance profile
and apply it to your instace/launch configuration:

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
