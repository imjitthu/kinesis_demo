import json
import boto3

def lambda_handler(event, context):
    print('event:::')
    print(event, context)
    return event

response = lambda_handler("Jithendar", "Dharmapuri")

print(response)
