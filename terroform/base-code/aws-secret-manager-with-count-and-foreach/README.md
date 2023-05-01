
#### How can I immediately delete a Secrets Manager secret so that I can create a new secret with the same name?

- [Use the AWS Secrets Manager console to get the deleted Secrets Manager secret ID](https://aws.amazon.com/premiumsupport/knowledge-center/delete-secrets-manager-secret/#:~:text=Open%20the%20Secrets%20Manager%20console,switch%2C%20and%20then%20choose%20Save.)

#### Delete a secret
https://docs.aws.amazon.com/secretsmanager/latest/userguide/manage_delete-secret.html
```
aws secretsmanager delete-secret --secret-id sonar --force-delete-without-recovery --region us-east-1
aws secretsmanager delete-secret --secret-id splunk_key --force-delete-without-recovery --region us-east-1
aws secretsmanager delete-secret --secret-id datadog --force-delete-without-recovery --region us-east-1
aws secretsmanager delete-secret --secret-id argocd --force-delete-without-recovery --region us-east-1
aws secretsmanager delete-secret --secret-id aws-key --force-delete-without-recovery --region us-east-1
```

