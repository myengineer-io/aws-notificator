variable "destination_number" {
  # Numero do seu celular neste modelo: "whatsapp:+55***********"
  type    = string
}

variable "from_number" {
  # Numero from do twilio
  type    = string
}

variable "account" {
  # Nome da sua conta da AWS
  type    = string
}

variable "threshold" {
  # Valor em USD que você deseja ser alertado
  type    = string
}

variable "tags" {
  # Tags dos recursos na aws
  type = list(map(any))
}

variable "account_sid" {
  # account sid do twillio
  type = string
}

variable "auth_token" {
  # auth_token do twillio
  type = string
}

variable "discord" {
  # Deseja notificar via discord?: true ou false
  type = bool
}

variable "whatsapp" {
  # Deseja notificar via whatsapp?: true ou false
  type = bool
}

variable "discord_webhook_url" {
  # Webhook do discord
  type = string
}