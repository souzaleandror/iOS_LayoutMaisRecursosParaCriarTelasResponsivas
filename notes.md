#### 29/07/2023

Curso de iOS layout: mais recursos para criar telas responsivas

@01-Criando nova ViewModel

@@01
Apresentação

[00:00] Olá, boas-vindas ao curso de Auto Layout com Stack View. Eu sou o Andriu, instrutor na Alura. O objetivo desse curso é continuarmos estudando sobre Auto Layout para iOS utilizando o framework UIKit, mas dessa vez com o uso de Stack View.
[00:19] Então, caso você não tenha feito a primeira parte desse curso, que é o Auto layout com constraints, eu aconselho que você faça esse curso antes de continuar conosco porque lá vamos falar dos conceitos fundamentais sobre Auto Layout e o uso de constraints.

[00:37] Nessa segunda etapa, vamos utilizar também constraints, só que com o uso de Stack View, que é outro componente muito legal que nos auxilia na criação dessas views.

[00:52] Vamos começar o curso falando um pouco sobre a primeira tela do nosso aplicativo Alura Viagens, onde nós criamos e listamos algumas viagens.

[01:04] Na primeira etapa, nós vamos aprender a criar células customizadas. Vamos falar um pouco sobre TableView com vários tipos de células, como é o caso aqui, onde nós mostramos células diferentes.

[01:17] Depois, vamos falar um pouco sobre o uso de Stack View na tela de detalhes. Quando o usuário seleciona uma viagem, vamos mostrar a tela de detalhes, onde temos vários componentes de interface do usuário, como imagem, labels, botões.

[01:36] E o objetivo principal é continuar praticando o Stack View, que é uma forma de você empilhar elementos tanto na horizontal quanto na vertical, e é uma forma muito mais rápida de se trabalhar, porque não precisamos ficar reposicionando as constraints, não precisamos ficar calculando o espaço disponível. Tudo isso o Stack View nos auxilia.

[02:02] Ao final do curso, vamos chegar na criação de uma tela parecida com essa, que é a tela de detalhes da viagem. Vamos também aprender a utilizar o scroll view e todos esses componentes de interface do usuário.

[02:17] Esse é o conteúdo que vamos ver durante esse curso, e espero você.

@@02
Projeto inicial

Baixe aqui o ZIP com os arquivos para o projeto inicial deste curso.

@@03
Criando célula de ofertas

[00:00] Estamos iniciando a segunda etapa do nosso curso de Auto Layout para iOS aqui na Alura. Já iniciamos o nosso projeto no curso anterior, o projeto chamado “Alura Viagens”, é um aplicativo que lista viagens.
[00:14] Temos aqui já a home do nosso app, ou seja, a tela inicial, e a ideia é avançarmos com as implementações desse aplicativo, com novas funcionalidades, e estudar uma nova técnica chamada Stack View. É outro componente que nos ajuda também a criar projetos responsivos e trabalhar com Auto Layout.

[00:38] No curso anterior, nós aprendemos uma técnica chamada constraint, que é uma técnica super importante, muito utilizada no UIKit para desenvolver os nossos projetos, e agora vamos avançar desenvolvendo novas funcionalidades e aprendendo uma nova técnica chamada Stack View.

[00:58] Antes de começarmos a desenvolver as nossas tarefas, eu vou relembrar alguns pontos importantes. Estamos utilizando, por exemplo, para listar as viagens, o nosso “Mock”, que nada mais é do que um JSON que temos aqui no nosso projeto, que simula a resposta de um servidor.

[01:19] Como vimos, não estamos trabalhando com requisições, nós temos aqui, então, um JSON com várias viagens. No curso anterior, nós utilizamos essa chaves, essa key do JSON de destaques para listar as viagens na home e agora vamos continuar utilizando essas outras keys para nos ajudar com as nossas outras implementações.

[01:49] O que vamos começar a fazer? Nós temos aqui uma home que lista três viagens. Com certeza você já viu algum aplicativo, principalmente marketplace, que tem uma table view ou algum componente similar que lista várias células diferentes.

[02:10] Não lista somente uma view, como temos aqui. Nós temos uma célula que já criamos, que é essa célula de “Viagem”, e estamos utilizando esse modelo de view para todos os tipos de viagens que estamos exibindo na Table View.

[02:29] Então, qual é a ideia de primeira tarefa que vamos desenvolver? Vamos criar uma nova célula e vamos exibir essa célula dentro da Table View. Então, é possível ter uma Table View que renderize várias células diferentes, e é isso que vamos começar a fazer agora.

[02:50] Nós já temos uma célula, que é essa “ViagemTableViewCell”, que renderiza essas viagens de destaques. Então, só para manter a organização do nosso projeto, vou criar um novo grupo, vou chamar de “Destaque”, e vou colocar essa célula dentro dessa pasta.

[03:14] Vou criar uma nova pasta, um novo grupo, que vou chamar de “Oferta”. Dentro de “Oferta”, vou criar um novo arquivo, vou escolher essa opção “Cocoa Touch Class”, vou dar um “Next”. “Subclasse” não vai ser de “UIViewController” e, sim, de “UITableViewCell”.

[03:39] E qual vai ser o nome dessa célula? Vamos chamar de “OfertaTableViewCell”, esse é o nome que vamos dar para a nossa célula. É importante já marcarmos essa opção “Allow create XIB file” para ele criar um XIB, ou seja, uma view junto com o arquivo.

[04:00] Vou dar um “Next” e vou dar um “Create”. Ele já vem com alguns métodos, nós não vamos utilizar nesse momento, então vou apagar, vou deixar um arquivo vazio.

[04:16] E aqui nós temos, então, o XIB da nossa célula. Vamos começar alterando o tamanho, a largura e a altura. Vou vir aqui, canto superior direito, vou vir nessa opção onde ele vai mostrar a altura e a largura, e vamos alterar para “320”, já está, e a altura “385”.

[04:50] Dei um “Enter”, ele já renderizou aqui a célula do tamanho que vamos utilizar. Então, vamos começar a desenhar em cima dessa view para criar a nova célula que vamos exibir na home do nosso app.

@@04
Criando ViewModel

[00:00] Nós acabamos de criar a célula de oferta e antes de a configurarmos, colocar identificador e todas as coisas que precisamos colocar para que ela seja exibida no Table View, eu vou relembrar qual arquitetura estamos utilizando.
[00:18] Nesse projeto, nós estamos utilizando MVVM. Nós começamos a utilizar no curso passado, vou relembrar dessa camada de View Model, que é onde vamos ter que mexer agora.

[00:30] Basicamente, a View Model, como o próprio nome sugere, é um modelo para a nossa view, ou seja, o que a nossa view vai exibir que precisamos montar para passar para ela. É essa abstração que precisamos fazer aqui.

[00:45] Temos aqui um protocolo chamado ViagemViewModel que nos facilita muito quando precisamos criar um novo ViewModel, um tipo diferente de viagem.

[00:58] Se entrarmos nesse arquivo JSON, nós temos alguns tipos como destaques, que foi o que nós já utilizamos no curso, tem essas três viagens; nós temos aqui ofertas, que vamos utilizar agora para criar uma nova célula para a nossa TableView; e temos também essas viagens internacionais. Para cada tipo, nós temos mapeado no nosso enum ViagemViewModelType.

[01:27] Se depois, fazendo uma comparação com o mundo real, a nossa equipe de desenvolvimento acordar que vai ter um novo tipo no nosso aplicativo, além de “Ofertas”, “Destaques” e “Viagens internacionais”, que são esses que nós já estamos mapeando aqui, seria muito mais fácil colocar mais um case no enum e criar uma nova ViewModel.

[02:00] Então, já temos um ViewModel de destaques, que são as viagens em destaques na home, e agora precisamos criar uma nova ViewModel para as ofertas, para as viagens de ofertas.

[02:15] Repara que fica bem fácil porque basta criarmos um novo arquivo e implementar esse protocolo que já temos a ViewModel que nós precisamos para configurar no nosso arquivo de serialização, no caso aqui, no nosso “DecodableData”.

[02:33] Nós temos aqui uma parte onde estamos mapeando os destaques, vamos ter que também mapear as ofertas. Mas antes, vamos criar o nosso ViewModel.

[02:45] Vou vir aqui na pasta “ViewModel”, vou clicar com o botão direito, “Novo arquivo”, vou escolher a opção “Swift File”, vou dar um “Next” e o nome do nosso arquivo vai ser “ViagemOfertaViewModel”.

[03:13] Vou dar dois cliques e copiar o nome desse arquivo, vou dar um “Create”. Ele nos traz um arquivo vazio. Vou criar uma classe onde vou dar o mesmo nome que dei no arquivo, class ViagemOfertaViewModel.

[03:28] Repara que nós já temos aqui um ViewModel que é o de Destaque, onde implementa esse protocolo ViagemViewModel, que é esse protocolo aqui. Quando nós implementamos um protocolo, na verdade, um protocolo nada mais é do que uma casca com alguns métodos que não têm implementação.

[03:47] Quando nós implementamos isso na nossa classe, nós vamos dar vida a esse protocolo, vamos colocar os valores que precisamos para criar a nossa ViewModel.

[03:57] E é isso que eu vou fazer, vou implementar esse protocolo. Logo quando implemento, ele já vai reclamar, porque necessita implementar todas aquelas características e métodos do protocolo. Quando eu clico em “Fix”, ele já traz um modelo para nós.

[04:17] Então, vamos lá. Título da sessão, tituloSessao, vai ser ofertas. Então, venho aqui e dou um return “Ofertas. Qual é o tipo? O tipo é oferta, então, vamos dar um return do tipo, que é o tipo return .ofertas, que é aquele enum que eu mostrei para você aqui em cima, que são esses três tipos disponíveis. Estamos utilizando esse, ofertas.

[04:48] Continuando, aqui nós temos uma lista de viagens, que vamos ter que criar um método construtor que vai receber essas viagens, e o var numeroDeLinhas vamos colocar aqui um return e vamos deixar com return 1.

[05:06] Ele está reclamando porque precisa de um inicializador, então vou criar aqui um pragma MARK: - Inicializador, vou criar um método construtor, onde vou receber essas viagens: [Viagem].

[05:30] O que eu vou fazer com ele? Eu pego as self.viagens = viagens que tenho aqui e seto o valor que estou recebendo por parâmetro.

[05:42] Então, a ideia aqui foi criar essa nova ViewModel de ofertas baseado no que já vimos no curso anterior, então nós relembramos. E em seguida, nós vamos utilizar essa ViewModel para separar quais viagens são do tipo ofertas para preencher esse ViewModel.

@@05
Configurando célula

[00:00] Nós acabamos de criar a ViewModel de ofertas para construirmos a nossa nova célula na home do nosso aplicativo. Antes de utilizarmos esse ViewModel, vou voltar em “ViewController.swlft” só para mostrar para você onde nós vamos utilizá-lo.
[00:16] Aqui no “ViewController”, nós temos diversos métodos, entre eles os métodos da TableView, que por enquanto são os mais importantes para nós, onde estamos montando de fato a célula do nosso aplicativo.

[00:29] Temos aqui o método cellForRowAt, onde nós criamos a célula, e aqui dentro temos uma constante chamada viewModel. O que essa constante faz? Ela acessa, de dentro da lista de secaoDeViagens, qual é o tipo de viewModel que estamos trabalhando no momento, de acordo com a seção.

[00:54] Ele pega o indexPath.section da TableView, ou seja, qual seção da TableView é a primeira seção, a segunda, a terceira. Ele começa com a indexação no zero, então, é 0, 1, 2, e assim por diante.

[01:11] Então, baseado nessa posição, ele acessa a lista e pega a respectiva viewModel. Nesse caso, só temos apenas uma, que é a de destaques, que é essa viewModel aqui que estamos construindo essas células.

[01:28] E a partir de agora vamos adicionar mais uma viewModel dentro dessa lista para que consigamos, então, ter mais um case aqui de ofertas.

[01:39] Então, vamos lá, nós precisamos utilizar a ViewModel nesse arquivo de “Decodable”, onde estamos lendo o JSON, tem várias etapas. A que interessa para nós é onde, de fato, verificamos qual tipo que é, e criamos, então, uma nova ViewModel.

[01:59] Estamos criando a ViewModel de destaques e, a partir de agora, vamos criar uma nova ViewModel, que é a ViewModel de case .ofertas. Então, o que vou fazer? Basicamente, é parecido com o caso de cima.

[02:15] Vou verificar se existe a lista de ofertas, vou pegar esse if let ofertas = tiposDeViagens?, que é essa constante que está aqui em cima, que ela lê do JSON que estamos trazendo, .ofertas. Se essa lista existir, nós vamos criar a ViewModel.

[02:36] let ofertaViewModel = a essa classe que nós acabamos de criar. Repara que para nós inicializarmos essa classe, nós precisamos passar uma lista de viagens. Essa lista de viagens nós já temos, que é essa validação que estamos fazendo no if let.

[02:57] Nós estamos extraindo, com segurança, essas viagens de uma variável opcional. Se ela existir, significa que existem elementos dentro dessa lista, então podemos criar a ViewModel.

[03:11] Vou passar aqui a lista de ofertas, vou adicionar na listaViagemViewModel.append e vou adicionar, então, ofertaViewModel. Nós já temos mais um caso onde estamos separando quais são as viagens de oferta, criando a ViewModel e adicionando a listaDeViagens nessa ViewModel.

[03:42] Agora, podemos voltar no arquivo do “ViewController” e podemos, então, criar um novo case, uma nova célula, que é essa de fato que nós acabamos de criar aqui, que por enquanto está em branco.

[04:00] Mas, perceba que interessante, ele pega o ViewModel de acordo com a seção. Ele pega esse indexPath.section. Por default, por padrão, ele sempre retorna um valor que é a primeira seção e, nesse caso, como vamos ter várias seções, nós precisamos indicar isso para a TableView.

[04:23] Senão ele nunca vai cair em outros casos, ele sempre vai cair com o valor padrão. Então, quando queremos ter mais de uma seção na TableView, nós precisamos indicar para ela através do método. Então, vamos implementar esse método aqui.

[04:39] Esse método se chama numberOfSections. O número da seção nada mais é do que o número de ViewModels que estiver dentro da lista. Temos aqui, por enquanto, dois ViewModels, dois elementos dentro da lista.

[05:02] E é isso que vou retornar aqui, vou dar um return do número de elementos que estiver dentro dessa lista de seção de viagens, return secaoDeViagens?.count. Aqui é opcional, então, vou fazer uma validação aqui, ??. Se não tiver nenhum elemento ou se estiver nil, ele vai citar como 0.

[05:31] Agora que nós já temos um método que diz qual é o número de seções que a nossa TableView vai ter, nós precisamos, então, implementar a célula.

[05:43] Como fazemos? Nós vamos, então, no método de ReusableCell, eu vou adicionar um novo case, que é o case .ofertas, e vou criar a célula. Vou passar essa parte para dentro de .destaques, isso significa que nós estamos instanciando a célula ViagemTableViewCell, e aqui dentro de .ofertas vamos ter que fazer algo parecido.

[06:13] Vou criar uma constante, vou chamar de let celulaOferta, e vamos utilizar esse método da própria tableView.dequeueReusableCell. Aqui, nós passamos um identificador que, geralmente, é o nome da própria célula, isso nós ainda não fizemos.

[06:33] Então, vou pegar o nome da nossa célula, vou voltar no “ViewController” e vou tentar fazer um cast para esse tipo. Vou retorná-la aqui, return celulaOferta. Aqui, ele está apontando um erro porque precisamos retornar um objeto concreto, ele não pode ser opcional.

[07:08] Porque a célula pode vir vazia ou, por algum motivo, o identificador é alterado, então nós não conseguimos de fato instanciar a célula, o valor fica nil e nós tentamos passar um valor nulo para a TableView. Isso pode dar crash.

[07:25] Então, nós precisamos fazer aqui uma validação, igual está aqui em cima. Vou fazer um guard let. Se ele conseguir instanciar a célula, beleza, se não, nós vamos dar um fatalError e já sabemos que o problema foi na celulaOferta.

[07:44] Vamos fazer um teste, vou rodar o simulador para ver se está tudo funcionando. É sempre importante desenvolvermos um pouco, “buildarmos” e vermos se está tudo certo.

[07:56] Nós temos aqui um build e temos um erro, temos aqui um crash. Se formos ler, ele realmente está caindo nesse fatalError, ele está dando aqui no Console a mensagem “error to create OfertaTableViewCell”. Então, ele não está conseguindo criar essa célula.

[08:20] Por que ele não está conseguindo criar? Justamente porque nós precisamos colocar um identificador para a célula. E além do identificador, nós precisamos registrar essa célula na TableView. Então, é importante desenvolvermos, “buildarmos”, gerarmos um build, para vermos se realmente está tudo funcionando.

[08:39] Vamos fazer essas duas correções. Primeiro passo, vou vir na célula de oferta, clico em cima dela, vou vir nessa quarta opção, onde estou com o cursor do mouse, nesse “Identity inspector”. Já tem uma classe setada. Caso não esteja assim, é só você setar o nome da classe.

[09:07] Vou vir aqui no próximo ícone, nesse “Attributes inspector”, onde eu tenho aqui esse “Identifier”, que é muito importante nós citarmos um valor. Geralmente, eu coloco o nome da própria célula, mas aqui você pode colocar qualquer coisa, o importante é você colocar esse mesmo valor na hora de registrar a célula e na hora de utilizar a célula no cellForRowAt.

[09:33] Coloquei o identificador, vou voltar no “ViewController”, nós precisamos ainda registrar a célula. Nós já registramos uma célula, que é a célula de ofertas, a primeira célula, então vamos ter que fazer algo parecido aqui.

[09:51] register, aqui tem várias opções, vou escolher essa primeira que é com nib, UINib. Coloco aqui um nome, o nome é o nome do próprio arquivo, OfertaTableViewCell; o bundle é o mesmo, então nil, está tudo dentro do mesmo pacote.

[10:09] E o identificador tem que ser o que eu acabei de mostrar para vocês, OfertaTableViewCell. Então, deixa tudo configurado corretamente, agora é para funcionar. Vou rodar de novo, vamos fazer esse teste.

[10:25] A célula, em si, é essa daqui, mas olha perceba que estranho, ele está renderizando mais uma vez o header do aplicativo. Eu tenho ele aqui uma vez, e eu só quero essa única vez. Quando eu faço um scroll, ele vai para a próxima seção, que é a seção de ofertas, e ele exibe novamente o header.

[10:45] Então, nós temos um problema com a configuração da nossa célula. O que nós vamos ter que fazer? Olha só, nós temos aqui um método onde nós criamos o header, que é esse viewForHeaderInSection, ou seja, para cada seção, ele está criando um novo header.

[11:07] Se eu tivesse aqui, por exemplo, dentro dessa listaViagemViewModel, mais um case, como de viagens internacionais, ele iria renderizar mais um header, porque teria três seções, então para cada seção ele renderiza um header diferente.

[11:28] Então, não é isso que nós queremos, nós queremos que, se a seção for a primeira, que começa com a indexação 0, eu quero que ele crie o header. Vamos rodar para ver.

[11:48] Como eu preciso retornar algo, se não for a primeira, eu retorno return nil. Vamos testar, olha que bacana, ele não está mais utilizando a view do header, porém, o espaço ainda está aqui, eu tenho o espaço da célula e o espaço do header.

[12:08] Então, nós precisamos ainda fazer esse último ajuste. O que acontece aqui é o seguinte: nesse método heighForHeaderInSection, nós estamos retornando o valor de 300, independente da seção. Nós queremos que seja 300 se tiver o header, ou seja, se existir o header, o tamanho vai ser 300.

[12:30] Então, aqui nós precisamos fazer uma última validação que é a seguinte: if section == 0. Se for a primeira, que começa na indexação 0, nós vamos retornar o valor 300, então return 300; se não for, nós retornamos o 0, porque não queremos nenhum espaçamento a mais, nós queremos apenas se houver o header.

[12:55] Vamos testar então? Vou buildar o app mais uma vez, vou fazer o scroll. Agora sim, perfeito, nós temos aqui apenas o espaçamento da célula de oferta.

@@06
Para saber mais: TableView com múltiplas células

Nesse capítulo continuamos o projeto Alura Viagens e iniciamos os estudos com a criação de uma nova célula para a TableView da home. Hoje em dia, é muito comum a necessidade do aplicativo mostrar células diferentes na mesma TableView.
Portanto, exemplificamos o uso de várias células, através da célula de Ofertas, onde temos duas Views representando as viagens.

Para fazer isso, primeiro criamos uma nova célula (UITableViewCell), implementamos a View como o proposto e em seguida registramos a célula na TableView e adicionando um identificador para célula criada.

@@07
Configurando células da TableView

Está cada vez mais comum aplicativos listarem diferentes conteúdos na mesma lista. Por isso, aprendemos na aula como podemos configurar a TableView para que exiba diferentes tipos de células. Para fazer isso precisamos:

Criar um novo arquivo subclasse de UITableViewCell, registrá-lo na TableView e colocar um identificador para célula.
 
Alternativa correta! A TableView precisa conhecer quais células estão disponíveis para ela utilizar. Fazemos isso através do método register. Além disso temos também que identificar a célula para utilizá-la.
Alternativa correta
Colocar um NavigationController na TableView para que ela saiba para qual célula deve navegar.
 
Alternativa correta
Criar um novo arquivo subclasse de UITableViewCell e registrá-lo na TableView.

@@08
Faça como eu fiz: Trabalhando com células distintas

Nesse primeiro capítulo, começamos a configurar o novo ViewModel de ofertas de viagens. Fizemos isso através da implementação do protocolo ViagemViewModel, que nos fornece todas as informações necessárias para criar um novo tipo de Viagem (no nosso caso, a Oferta). Outro assunto importante foi entender como um UITableView pode exibir células diferentes. De que maneira podemos exibir células diferentes na TableView?

Primeiro devemos criar um novo arquivo subclasse de UITableViewCell e desenhar a célula como precisarmos. Em seguida devemos adicionar um identificador para célula e por último devemos registrá-la atráves do método:
viagensTableView.register(UINib(nibName: "OfertaTableViewCell", bundle: nil), forCellReuseIdentifier: "OfertaTableViewCell")COPIAR CÓDIGO
Através dessas configurações, podemos utilizá-la no método cellForRow AtIndexPath sem nenhum problema.

@@09
O que aprendemos?

Nesta aula, aprendemos:
TableView com múltiplas células
A TableView é sem dúvida um dos componentes mais utilizados na construção da interface do usuário. Por isso, avançamos nossos conhecimentos entendendo como podemos utilizá-la para mostrar mais de uma célula na lista.