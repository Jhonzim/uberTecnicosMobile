import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tech_share/valores_e_funcoes.dart';

class TermsOfService extends StatefulWidget {
  const TermsOfService({super.key});

  @override
  State<TermsOfService> createState() => _TermsOfServiceState();
}

class _TermsOfServiceState extends State<TermsOfService> {
  TextStyle textoTitulo = const TextStyle(
      fontSize: 16,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.bold,
      height: 3);
  TextStyle textoNormal = const TextStyle(
      fontSize: 14,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.normal,
      height: 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        const SliverAppBar(
          title: Text('TERMOS DE SERVIÇO'),
          floating: true,
        ),
        SliverToBoxAdapter(
          child: FractionallySizedBox(
            widthFactor: 0.9,
            child: SingleChildScrollView(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SelectableText.rich(
                  textAlign: TextAlign.justify,
                  TextSpan(
                  children: [
                    TextSpan(
                        text: 'Termos de serviço\n',
                          style: textoTitulo,
                          children: [
                            TextSpan(
                                text:
                                    '  Ao baixar ou usar o aplicativo, esses termos serão automaticamente aplicados a você - portanto, certifique-se de lê-los com cuidado antes de usar o aplicativo. Você não tem permissão para copiar ou modificar o aplicativo, qualquer parte do aplicativo ou nossas marcas comerciais de qualquer forma. Você não tem permissão para tentar extrair o código-fonte do aplicativo e também não deve tentar traduzir o aplicativo para outros idiomas ou criar versões derivadas. O aplicativo em si e todas as marcas comerciais, direitos autorais, direitos de banco de dados e outros direitos de propriedade intelectual relacionados a ele ainda pertencem a João Pedro do Couto Oliveira Almeida.\n',
                                style: textoNormal),
                            TextSpan(
                                text:
                                    '  João Pedro do Couto Oliveira Almeida está comprometido em garantir que o aplicativo seja o mais útil e eficiente possível. Por esse motivo, reservamo-nos o direito de fazer alterações no aplicativo ou cobrar por seus serviços a qualquer momento e por qualquer motivo. Nunca cobraremos pelo aplicativo ou seus serviços sem deixar muito claro para você exatamente pelo que está pagando.\n',
                                style: textoNormal),
                            TextSpan(
                                text:
                                    '  O aplicativo Tech Share armazena e processa dados pessoais que você nos forneceu para fornecer meu serviço. É sua responsabilidade manter seu telefone e acesso ao aplicativo seguro. Portanto, recomendamos que você não faça jailbreak ou root no seu telefone, que é o processo de remover restrições e limitações de software impostas pelo sistema operacional oficial do seu dispositivo. Isso pode tornar seu telefone vulnerável a malware / vírus / programas maliciosos, comprometer os recursos de segurança do seu telefone e pode significar que o aplicativo Tech Share não funcionará corretamente ou não funcionará.\n',
                                style: textoNormal),
                            TextSpan(
                                text:
                                    '  O aplicativo usa serviços de terceiros que declaram seus Termos de serviço.\n',
                                style: textoNormal),
                            TextSpan(
                                text:
                                    '  Link para Termos de serviço dos provedores de serviços de terceiros usados pelo aplicativo:\n',
                                children: [
                                  TextSpan(
                                    text: '    · Google Play Services\n',
                                    recognizer: TapGestureRecognizer()..onTap = () => openUrl(Uri.parse('https://google.com/policies/privacy/')),
                                    style: const TextStyle(
                                      color: Colors.blue,
                                      height: 1.5
                                    )
                                  ),
                                  TextSpan(
                                    text: '    · AdMob\n',
                                    recognizer: TapGestureRecognizer()..onTap = () => openUrl(Uri.parse('https://support.google.com/admob/answer/6128543?hl=pt-BR')),
                                    style: const TextStyle(
                                      color: Colors.blue,
                                      height: 1.5
                                    )
                                  ),
                                ],
                                style: textoNormal),
                            TextSpan(
                                text:
                                    '  Você deve estar ciente de que existem certas coisas pelas quais João Pedro do Couto Oliveira Almeida não assumirá a responsabilidade. Certas funções do aplicativo exigirão que o aplicativo tenha uma conexão ativa com a Internet. A conexão pode ser Wi-Fi ou fornecida pelo seu provedor de rede móvel, mas João Pedro do Couto Oliveira Almeida não pode assumir a responsabilidade pelo aplicativo não funcionar com funcionalidade total se você não tiver acesso a Wi-Fi e não tiver nenhuma franquia de dados restante.\n',
                                style: textoNormal),
                            TextSpan(
                                text:
                                    '  Se você estiver usando o aplicativo fora de uma área com Wi-Fi, lembre-se de que os termos do acordo com seu provedor de rede móvel ainda serão aplicáveis. Como resultado, você pode ser cobrado pelo seu provedor de celular pelo custo de dados durante a conexão enquanto acessa o aplicativo ou outras cobranças de terceiros. Ao usar o aplicativo, você assume a responsabilidade por tais cobranças, incluindo cobranças de roaming de dados se usar o aplicativo fora de sua região ou país de origem sem desativar o roaming de dados. Se você não é o pagador da conta do dispositivo em que está usando o aplicativo, esteja ciente de que assumimos que você recebeu permissão do pagador da conta para usar o aplicativo.\n',
                                style: textoNormal),
                            TextSpan(
                                text:
                                    '  Da mesma forma, João Pedro do Couto Oliveira Almeida não pode sempre assumir a responsabilidade pela maneira como você usa o aplicativo. Por exemplo, você precisa garantir que seu dispositivo esteja carregado - se a bateria acabar e você não puder ligá-lo para usar o serviço, João Pedro do Couto Oliveira Almeida não pode aceitar a responsabilidade.\n',
                                style: textoNormal),
                            TextSpan(
                                text:
                                    '  Com relação à responsabilidade de João Pedro do Couto Oliveira Almeida pelo seu uso do aplicativo, é importante ter em mente que, embora nos esforcemos para garantir que o aplicativo esteja sempre atualizado e correto, dependemos de terceiros para nos fornecer informações para que possamos disponibilizá-las para você. João Pedro do Couto Oliveira Almeida não aceita nenhuma responsabilidade por qualquer perda direta ou indireta que você possa experimentar como resultado de confiar totalmente nessa funcionalidade do aplicativo.\n',
                                style: textoNormal),
                            TextSpan(
                                text:
                                    '  Em algum momento, podemos desejar atualizar o aplicativo. O aplicativo está atualmente disponível para Android e iOS (e para quaisquer sistemas adicionais que decidamos estender a disponibilidade do aplicativo) e os requisitos do sistema podem mudar, e você precisará baixar as atualizações se quiser continuar usando o aplicativo. João Pedro do Couto Oliveira Almeida não promete que sempre atualizará o aplicativo para que seja relevante para você e/ou funcione com a versão que você tem instalada em seu dispositivo. No entanto, você se compromete a sempre aceitar as atualizações do aplicativo quando oferecidas a você. Também podemos desejar parar de fornecer o aplicativo e podemos encerrar o uso dele a qualquer momento, sem aviso prévio de rescisão para você. A menos que informemos o contrário, após qualquer rescisão, (a) os direitos e licenças concedidos a você nestes termos terminarão; (b) você deve parar de usar o aplicativo e, se necessário, excluí-lo do seu dispositivo.\n',
                                style: textoNormal),
                        ]),
                        TextSpan(
                          text: 'Alterações a estes termos de serviço\n',
                          style: textoTitulo,
                          children: [
                            TextSpan(
                                text:
                                    '  Podemos atualizar nossos termos de serviço de tempos em tempos. Portanto, você é aconselhado a revisar esta página periodicamente para quaisquer alterações. Vamos notificá-lo de quaisquer alterações postando os novos termos de serviço nesta página. Estes termos de serviço são efetivos a partir de 2023/04/20.\n',
                                style: textoNormal)
                        ]),
                        TextSpan(
                          text: 'Contate-Nos\n',
                          style: textoTitulo,
                          children: [
                            TextSpan(
                                text:
                                    '  Se você tiver alguma dúvida ou sugestão sobre nossos termos de serviço, não hesite em entrar em contato conosco pelo e-mail ',
                                    children: [
                                      TextSpan(
                                        text: 'Joaopedroalmeida2004@gmail.com.',
                                        recognizer: TapGestureRecognizer()..onTap = () => sendEmail(),
                                        style: const TextStyle(
                                          decoration: TextDecoration.underline,
                                          color: Colors.blue
                                        )
                                      )
                                    ],
                                style: textoNormal)
                        ]),
                        /* 
                        * exemplo de como adicionar mais campos
                        
                        TextSpan(
                          text: 'Titulo\n',
                          style: textoTitulo,
                          children: [
                            TextSpan(
                                text:
                                    '  Corpo\n',
                                style: textoNormal)
                        ]),
                        */
                  ]),
                ),
                SizedBox(height: 2.h,)
              ],
            )),
          ),
        ),
      ],
    ));
  }
}
