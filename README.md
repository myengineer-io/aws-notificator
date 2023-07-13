# **aws-notificator**
📦☁️🔔💬 Um notificador de alertas da AWS para WhatsApp e Discord, plug and play!


# **🔴 Configure as dependências**:
  1. Crie um bucket S3 na sua conta AWS para armazenar o tfstate
  2. Tenha um usuário IAM na conta AWS com as credenciais em mãos para rodar o terraform e criar os recursos
  3. Caso queira usar o **WhatsApp**, você precisa criar uma conta na Twillio e assinar o serviço de api, aqui tem um tutorial, você sairá do tutorial com `destination_number`, `from_number`, `account_sid` e `auth_token` em mãos: [primeiro tutorial](https://www.twilio.com/docs/whatsapp/tutorial/requesting-access-to-whatsapp), [segundo tutorial](https://www.twilio.com/docs/whatsapp/tutorial/send-and-receive-media-messages-whatsapp-python#gather-your-twilio-account-information).
  4. Caso queira usar o discord, crie um webhook no seu canal e copie o link: [tutorial](https://support.discord.com/hc/pt-br/articles/228383668-Usando-Webhooks).
  5. Tenha o docker instalado, ou se preferir, rode o terraform direto, eu prefiro com o docker :)

# **⚪ Explicando as variáveis**:
  - **destination_number** *Numero do seu celular neste modelo: "whatsapp:+55xxxxxxxxxx" - Obs: Se não quiser whatsapp, deixe a tag vazia, mas declare.*
  - **from_number** *Numero from do twilio - Obs: Se não quiser whatsapp, deixe a tag vazia, mas declare.*
  - **account** *Nome da sua conta da AWS*
  - **threshold** *Valor em USD que você deseja ser alertado*
  - **account_sid** *account_sid do twillio - Obs: Se não quiser whatsapp, deixe a tag vazia, mas declare.*
  - **auth_token** *auth_token do twillio - Obs: Se não quiser whatsapp, deixe a tag vazia, mas declare.*
  - **discord** *Deseja notificar via discord?: true ou false*
  - **whatsapp** *Deseja notificar via whatsapp?: true ou false*
  - **discord_webhook_url** *Webhook do discord*
  - **region** **Região AWS*
  - **AWS_ACCESS_KEY_ID** *Access Key ID do usuário IAM criado acima*
  - **AWS_SECRET_ACCESS_KEY** *Secret Access Key do usuário IAM criado acima*

# **👨🏻‍🏫 Como usar**:
⚠️ **Isso é um exemplo e os valores das variáveis devem ser alterados de acordo com a sua realidade para funcionar⚠️**

- Clona o repositório e entra na raiz
```
git clone https://github.com/myengineer-io/aws-notificator.git
cd aws-notificator
```
- Cria variaveis para as credenciais da AWS
```
export AWS_ACCESS_KEY_ID="AKIAIOSFODNN7EXAMPLE"
export AWS_SECRET_ACCESS_KEY="wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY"
```

- terraform init
```
docker run --user root:root --entrypoint="" --network host -w /app -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY -v $(pwd)/terraform:/app hashicorp/terraform:1.1.6 \
  terraform init \
  -backend-config="bucket=hashicorp-aws-notificator-bucket" \
  -backend-config="region=us-east-1" \
  -backend-config="key=aws-notificator"
```

- terraform apply
```
docker run --user root:root --entrypoint="" --network host -w /app -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY -v $(pwd)/terraform:/app hashicorp/terraform:1.1.6 \
  terraform apply \
  -auto-approve \
  -var "region=us-east-1" \
  -var "destination_number=whatsapp:+5511999999999" \
  -var "from_number=whatsapp:+551155555555" \
  -var "account=hashicorp" \
  -var "threshold=100" \
  -var "account_sid=xxxxxXxxxX4" \
  -var "auth_token=26x55X5x45X55623" \
  -var "discord=true" \
  -var "whatsapp=true" \
  -var "discord_webhook_url=https://discord.com/api/webhooks/000000000000000/_-xxxXxXxXxXXXXXXXxxxxxXXXxxxxxxxxXXXxxxxxxxxxxxdxxxx"
```
# **🟢 Demo**
- **Assim que você aplicar o terraform serão criados os seguintes recursos na sua conta**:
  - *aws_sns_topic*
  - *aws_sns_topic_subscription*
  - *aws_iam_role*
  - *aws_lambda_function*
  - *aws_lambda_permission*
  - *aws_cloudwatch_log_group*
  - *aws_iam_policy*
  - *aws_iam_role_policy_attachment*
  - *aws_cloudwatch_metric_alarm*

- **E quando o alarme atingir o threshold, você será notificado**:
  - via Discord
  ![](https://i.imgur.com/TwnnkDb.png)

  - via WhatsApp
  ![](https://i.imgur.com/kOv8LMe.png)


# **🛣️ Roadmap**:
[✅❌⌛]
- Cadastro na twilio ✅
- Código para enviar mensagem para o whatsapp ✅
- Subir tópico SNS ✅
- Subir o código na lambda ✅
- Criar alerta para orçamento ✅
- Testar enviar mensagem para o whatsapp usando o SNS ✅
- Notificação no discord ✅
- Multiplos thresholds ⌛
- Conversão do valor em Reais ⌛

# **📩 Mensagem SNS para teste da lambda**:
```
{
  "account": "aws-prod",
  "threshold": "100",
  "discord": "true",
  "whatsapp": "true",
  "from_number": "whatsapp:+14155238886",
  "destination_number": "whatsapp:+5511952249624",
  "discord_webhook_url": "https://discord.com/api/webhooks/000000000000000/_-xxxXxXxXxXXXXXXXxxxxxXXXxxxxxxxxXXXxxxxxxxxxxxdxxxx"
}
```
# **Autor**
👤 **Marcus Neves**
* Github: [@nevesm](https://github.com/nevesm)
* LinkedIn: [Marcus Neves](https://www.linkedin.com/in/mnevesti/)

## 🤝 **Contribuições são bem-vindas! Por favor, envie uma issue ou PR se você acredita que algo possa ser atualizado/melhorado!**
