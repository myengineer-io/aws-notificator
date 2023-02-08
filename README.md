# aws-notificator
📦☁️🔔💬 Um notificador de alertas da AWS para WhatsApp e Discord, plug and play!

## Como usar:

## Roadmap:
[✅❌⌛]

- Cadastro na twilio ✅
- Código para enviar mensagem para o whatsapp ✅
- Subir tópico SNS ✅
- Subir o código na lambda ✅
- Criar alerta para orçamento ✅
- Testar enviar mensagem para o whatsapp usando o SNS ✅
- Notificação no discord ✅
- Multiplos thresholds ⌛

## Mensagem SNS para teste da lambda:
```
{
  "account": "aws-prod",
  "threshold": "50",
  "discord": "yes",
  "whatsapp": "yes",
  "from_number": "whatsapp:+14155238886",
  "destination_number": "whatsapp:+5511952249624",
  "discord_webhook_url": "https://discord.com/api/webhooks/000000000000000/_-xxxXxXxXxXXXXXXXxxxxxXXXxxxxxxxxXXXxxxxxxxxxxxdxxxx"
}
```