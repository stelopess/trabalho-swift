import Foundation

// Enum para definir as prioridades de notificação
enum Prioridade {
    case baixa, media, alta
}

// Protocolo Notificavel
protocol Notificavel {
    var mensagem: String { get set }
    var prioridade: Prioridade { get set }
    
    func enviarNotificacao()
}
// Extensão do protocolo Notificavel com implementação padrão
extension Notificavel {
    func enviarNotificacao() {
        print("Enviando notificação...")
    }
}
// Struct Email
struct Email: Notificavel {
    var mensagem: String
    var prioridade: Prioridade
    var enderecoEmail: String
    
    func enviarNotificacao() {
        let prioridadeTexto: String
        switch prioridade {
        case .baixa:
            prioridadeTexto = "[Baixa Prioridade]"
        case .media:
            prioridadeTexto = "[Média Prioridade]"
        case .alta:
            prioridadeTexto = "[Alta Prioridade] URGENTE!"
        }
        print("Enviando email para \(enderecoEmail): \(mensagem) \(prioridadeTexto)")
    }
}

// Struct SMS
struct SMS: Notificavel {
    var mensagem: String
    var prioridade: Prioridade
    var numeroTelefone: String
    
    func enviarNotificacao() {
        let prioridadeTexto: String
        switch prioridade {
        case .baixa:
            prioridadeTexto = "[Baixa Prioridade]"
        case .media:
            prioridadeTexto = "[Média Prioridade]"
        case .alta:
            prioridadeTexto = "[Alta Prioridade] URGENTE!"
        }
        print("Enviando SMS para \(numeroTelefone): \(mensagem) \(prioridadeTexto)")
    }
}

// Struct PushNotification
struct PushNotification: Notificavel {
    var mensagem: String
    var prioridade: Prioridade
    var tokenDispositivo: String
    
    func enviarNotificacao() {
        let prioridadeTexto: String
        switch prioridade {
        case .baixa:
            prioridadeTexto = "[Baixa Prioridade]"
        case .media:
            prioridadeTexto = "[Média Prioridade]"
        case .alta:
            prioridadeTexto = "[Alta Prioridade] URGENTE!"
        }
        print("Enviando Push Notification para o dispositivo \(tokenDispositivo): \(mensagem) \(prioridadeTexto)")
    }
}
// Criar instâncias de canais de notificação
let email = Email(mensagem: "Promoção especial para você!", prioridade: .alta, enderecoEmail: "cliente@example.com")
let sms = SMS(mensagem: "Lembre-se de sua reunião às 14h.", prioridade: .media, numeroTelefone: "+5511999999999")
let pushNotification = PushNotification(mensagem: "Alerta de segurança na sua conta.", prioridade: .baixa, tokenDispositivo: "abcd1234")

// Array com canais de notificação
var canais: [Notificavel] = [email, sms, pushNotification]

// Iterar sobre o array e enviar notificações
for canal in canais {
    canal.enviarNotificacao()
}
