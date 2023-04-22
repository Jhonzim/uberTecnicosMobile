import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tech_share/valores_e_funcoes.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
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
          title: Text('POLÍTICA DE PRIVACIDADE'),
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
                        text: 'Política de privacidade\n',
                          style: textoTitulo,
                          children: [
                            TextSpan(
                                text:
                                    '  João Pedro do Couto Oliveira Almeida e Fabio Gustavo Apolinário da Silva desenvolveram o aplicativo Tech Share como um aplicativo com suporte de anúncios. Este SERVIÇO é fornecido por João Pedro do Couto Oliveira Almeida gratuitamente e destina-se a ser utilizado como está. Esta página é usada para informar os visitantes sobre minhas políticas com a coleta, uso e divulgação de informações pessoais, caso alguém decida usar meu serviço. Se você escolher usar meu serviço, concorda com a coleta e uso de informações em relação a esta política. As informações pessoais que coletamos são usadas para fornecer e melhorar o serviço. Não usaremos ou compartilharemos suas informações com ninguém, exceto conforme descrito nesta Política de Privacidade. Os termos usados nesta Política de Privacidade têm o mesmo significado que em nossos Termos e Condições, acessíveis no Tech Share, a menos que definido de outra forma nesta Política de Privacidade.\n',
                                style: textoNormal)
                        ]),
                        TextSpan(
                          text: 'Coleta e Uso de Informações\n',
                          style: textoTitulo,
                          children: [
                            TextSpan(
                                text:
                                    '  Para uma melhor experiência, ao usar nosso Serviço, posso solicitar que você nos forneça certas informações pessoalmente identificáveis. As informações que solicito serão retidas em seu dispositivo e não são coletadas por mim de forma alguma. O aplicativo usa serviços de terceiros que podem coletar informações usadas para identificá-lo.\nLink para a política de privacidade dos provedores de serviços de terceiros usados pelo aplicativo:\n',
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
                                style: textoNormal)
                        ]),
                        TextSpan(
                          text: 'Dados de registro\n',
                          style: textoTitulo,
                          children: [
                            TextSpan(
                                text:
                                    '  Quero informar que sempre que você usar meu Serviço, em caso de erro no aplicativo, eu coletarei dados e informações (por meio de produtos de terceiros) no seu telefone chamados Dados de Log. Esses Dados de Log podem incluir informações como o endereço de Protocolo de Internet ("IP") do seu dispositivo, nome do dispositivo, versão do sistema operacional, configuração do aplicativo ao utilizar meu Serviço, a hora e a data do uso do Serviço e outras estatísticas\n',
                                style: textoNormal)
                        ]),
                        TextSpan(
                          text: 'Cookies\n',
                          style: textoTitulo,
                          children: [
                            TextSpan(
                                text:
                                    '  Cookies são arquivos com uma pequena quantidade de dados que são comumente usados como identificadores exclusivos anônimos. Eles são enviados para o seu navegador a partir dos sites que você visita e são armazenados na memória interna do seu dispositivo.  Serviço não usa explicitamente esses "cookies". No entanto, o aplicativo pode usar código e bibliotecas de terceiros que usam "cookies" para coletar informações e melhorar seus serviços. Você tem a opção de aceitar ou recusar esses cookies e saber quando um cookie está sendo enviado para o seu dispositivo. Se você optar por recusar nossos cookies, pode não ser capaz de usar algumas partes deste Serviço.\n',
                                style: textoNormal)
                        ]),
                        TextSpan(
                          text: 'Provedores de Serviço\n',
                          style: textoTitulo,
                          children: [
                            TextSpan(
                              text:
                                  '  Posso empregar empresas terceirizadas e indivíduos devido às seguintes razões:\n',
                              children: const [
                                TextSpan(
                                  text: '    · Para facilitar nosso Serviço;\n',
                                  style: TextStyle(
                                    height: 1.5
                                  )
                                ),
                                TextSpan(
                                  text: '    · Para fornecer o Serviço em nosso nome;\n',
                                  style: TextStyle(
                                    height: 1.5
                                  )
                                ),
                                TextSpan(
                                  text: '    · Para executar serviços relacionados ao Serviço; ou\n',
                                  style: TextStyle(
                                    height: 1.5
                                  )
                                ),
                                TextSpan(
                                  text: '    · Para nos ajudar a analisar como nosso Serviço é usado.\n',
                                  style: TextStyle(
                                    height: 1.5
                                  )
                                )
                              ],
                              style: textoNormal),
                        TextSpan(
                          text: '  Quero informar aos usuários deste serviço que esses terceiros têm acesso às suas informações pessoais. O motivo é realizar as tarefas atribuídas a eles em nosso nome. No entanto, eles são obrigados a não divulgar ou usar as informações para qualquer outro propósito.\n',
                          style: textoNormal
                        )
                        ]),
                        TextSpan(
                          text: 'Segurança\n',
                          style: textoTitulo,
                          children: [
                            TextSpan(
                                text:
                                    '  Eu valorizo sua confiança em nos fornecer suas informações pessoais, por isso estamos nos esforçando para usar meios comercialmente aceitáveis ​​para protegê-las. No entanto, lembre-se de que nenhum método de transmissão pela internet ou de armazenamento eletrônico é 100% seguro e confiável, e não posso garantir sua segurança absoluta.\n',
                                style: textoNormal)
                        ]),
                        TextSpan(
                          text: 'Links para outros sites\n',
                          style: textoTitulo,
                          children: [
                            TextSpan(
                                text:
                                    '  Este serviço pode conter links para outros sites. Se você clicar em um link de terceiros, será direcionado para esse site. Observe que esses sites externos não são operados por mim. Portanto, aconselho veementemente que você revise a Política de Privacidade desses sites. Não tenho controle sobre e não assumo responsabilidade pelo conteúdo, políticas de privacidade ou práticas de quaisquer sites ou serviços de terceiros.\n',
                                style: textoNormal)
                        ]),
                        TextSpan(
                          text: 'Privacidade das crianças\n',
                          style: textoTitulo,
                          children: [
                            TextSpan(
                                text:
                                    '  Estes serviços não se destinam a menores de 13 anos. Não coletamos intencionalmente informações de identificação pessoal de crianças menores de 13 anos. No caso de descobrirmos que uma criança menor de 13 anos nos forneceu informações pessoais, imediatamente excluiremos essas informações de nossos servidores. Se você é pai ou responsável e está ciente de que seu filho nos forneceu informações pessoais, entre em contato conosco para que possamos tomar as medidas necessárias.\n',
                                style: textoNormal)
                        ]),
                        TextSpan(
                          text: 'Alterações a esta política de privacidade\n',
                          style: textoTitulo,
                          children: [
                            TextSpan(
                                text:
                                    '  Podemos atualizar nossa Política de Privacidade de tempos em tempos. Portanto, recomendamos que você revise esta página periodicamente para verificar possíveis mudanças. Notificaremos você sobre quaisquer alterações publicando a nova Política de Privacidade nesta página.\n\nEsta política é efetiva a partir de 20 de abril de 2023.\n',
                                style: textoNormal)
                        ]),
                        TextSpan(
                          text: 'Contate-Nos\n',
                          style: textoTitulo,
                          children: [
                            TextSpan(
                                text:
                                    '  Se você tiver alguma dúvida ou sugestão sobre nossa Política de Privacidade, não hesite em entrar em contato conosco pelo e-mail ',
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
