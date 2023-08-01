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

#### 30/07/2023

@02-Utilizando UIStackView

@@01
Projeto da aula anterior

Se você deseja começar o curso a partir desta aula, pode fazer o download do projeto desenvolvido até o momento.

https://github.com/alura-cursos/alura-viagens-parte-II/archive/a0cde55f68d4a010a74607b83b8fc9729f4bf499.zip

@@02
Trabalhando com UIStackView

[00:00] De volta com o nosso projeto, nós acabamos de criar a célula de oferta, e a partir de agora a ideia é mostrar para você que é possível trabalhar com uma única Table View que renderiza diferentes tipos de células. Inclusive, é muito comum hoje em dia termos Table Views com várias células diferentes.
[00:19] O segundo tema, que é muito importante, que vamos começar a ver nesse vídeo, é sobre um novo componente que nos ajuda a trabalhar com Auto Layout no iOS, que se chama UIStack View. É um outro componente muito interessante que vamos começar a aprender nesse vídeo.

[00:38] Primeira coisa que vamos fazer é ver como esse Stack View funciona. Vou abrir o “Library” e vou procurar por esse componente. Vou digitar “Stack”, repara que ele me traz dois elementos: o “Horizontal Stack View” e o “Vertical Stack View”. Nós vamos entender a diferença dos dois.

[01:00] Eu vou começar clicando, arrastando e colocando o Stack View dentro da nossa célula de ofertas. Repara que quando eu o incluo dentro da célula de ofertas, ele não tem nenhuma característica diferente dos outros elementos, como uma view ou algo do tipo, ele realmente não tem nenhum conteúdo.

[01:20] Mas, para começar, é importante entendermos que o Stack View trabalha junto com as constraints, não é que um anula o outro. Na verdade, nós vamos utilizar essas duas técnicas e essas técnicas vão nos permitir trabalhar com layouts responsivos.

[01:38] Como acabamos de incluir uma Stack View aqui dentro, ele precisa saber onde ele deve ficar dentro dessa view, ou seja, qual é a coordenada XY, qual é a altura e qual é a largura.

[01:50] Vamos começar configurando as constraints para indicar onde ele deve ficar na tela. Vou abrir o menu das constraints e vou setar algumas constraints. Vou prendê-lo com 20 pontos acima, 20 pontos à esquerda e 20 pontos à direita, e aqui vou deixar “250”.

[02:17] Vou dar um “Adicionar”, ele setou as constraints aqui dentro. Lembre-se que nós colocamos um “Horizontal Stack View”. O conceito de Stack View nada mais é do que empilhar elementos, então nós conseguimos de uma forma muito fácil empilhar elementos lado a lado quando estamos trabalhando com “Horizontal Stack View”.

[02:39] Vou mostrar isso para você agora. Só para ilustrar como exemplo, vou adicionar algumas views. Vou procurar por “view”, vou clicar aqui, “View”, vou arrastar para dentro do Stack View e vou setar uma cor. Aqui, em “Background”, vou configurar uma cor, pode ser, por exemplo, laranja.

[03:04] O Stack View, como acabei de falar, tem essa característica de empilhar elementos, porém, ele tem uma propriedade que se chama “Distribution”, que se encontra aqui, lado superior direito. Vou selecionar o Stack View e a propriedade “Distribution” está aqui, no “Attributes inspector”, e tenho aqui essa propriedade.

[03:30] O que ela significa? Como vou distribuir os elementos dentro do Stack View? A primeira opção está marcada como “Fill”, ou seja, preencher. Por isso que, quando eu coloquei um view dentro do Stack View, ela ocupou todo o tamanho disponível, por causa desse “Distribution: Fill”.

[03:50] E se eu quiser, por exemplo, colocar mais uma “View”? Eu vou abrir aqui o meu “Object Library”, vou procurar por “View” e vou adicionar mais uma view aqui dentro do Stack View.

[04:04] Solto e ele aponta erros de constraints. Por que ele apontou erro de constraint? Porque o “Distribution”, no nosso Stack View, está marcado como “Fill”, ou seja, ele já preencheu todos o espaço disponível, e quando eu adicionei uma nova “View”, ele não sabe qual é a largura que ele deve ocupar, já que a primeira “View” está ocupando todo o espaço disponível.

[04:28] Então, quando eu trabalho com esse tipo de distribuição no Stack View, distribuição de “Fill/Preencher”, eu preciso citar algumas constraints para indicar qual é a largura desses elementos.

[04:40] Por exemplo, se eu quisesse deixar com a largura de 50, eu teria que vir aqui, adicionar uma constraint de “50”. Aí eu tenho, então, a minha view.

[04:56] Colocar aqui azul. Repara que agora sumiram os erros de constraint. Então, esse é o primeiro esquema de distribuição que nós temos no Stack View. Tem uma outra configuração muito interessante que se chama “Fill Equaly”, que é, na verdade, a distribuição por tamanhos iguais.

[05:21] Vou selecionar mais uma vez o meu Stack View, vou vir aqui em “Distribution” e vou marcar a opção “Fill Equally”. O que muda? Vou adicionar uma nova “View” e vou arrastar para dentro do Stack View.

[05:40] Vou mudar a cor para essa, por exemplo, e com a distribuição “Fill Equally”, repara que ele pega o espaço disponível e divide pelo número de elementos que eu colocar dentro do Stack View.

[05:55] Então, já começa a ficar interessante, vou colocar mais uma “View”. Venho, clico, arrasto e adiciono dentro do Stack View. Vou mudar a cor só para conseguir visualizar. Repara que, mais uma vez, ele distribuiu de forma igual todos os elementos de dentro do Stack View.

[06:14] O melhor, nesse caso, sem utilizar as constraints. Então, nesse modo de distribuição, não preciso me preocupar com as constraints que eu tenho nos elementos de dentro do Stack View.

[06:30] Já começamos, vamos praticar muito mais isso durante o curso, aqui é só uma introdução para pegarmos o jeito da coisa. Agora vamos começar a falar um pouco sobre o “Vertical Stack View”.

[06:41] Vou excluir esse “Horizontal Stack View” e vou colocar um “Vertical Stack View”. Aqui é o mesmo esquema, vou setar umas constraints como “20”, “20” e “20”, e ele está reclamando que ele precisa de uma constraint, ou da margem inferior, ou de uma altura.

[07:11] Temos duas formas de resolver isso: colocando o elemento dentro, aí ele vai assumir que altura é o elemento que eu colocar, ou setando uma constraint. Nesse caso, vou colocar uma “Label”, por exemplo, vou clicar, arrastar e ele resolver o problema das constraints.

[07:29] Por quê? Porque ele assume que a altura do Stack View é a altura do elemento que eu coloquei dentro dele. Vou alterar o nome, por exemplo, “Porto de Galinhas”, vou colocar mais uma label, dar um “Command + C” e “Command + V”.

[07:49] “Aéreo + Hotel”, vou dar mais um “Command + C” e “Command + V”. Vou colocar, por exemplo, “Três diárias”. O que eu quero dizer com isso? Repara que é muito mais fácil eu empilhar elementos um embaixo do outro quando estou trabalhando com Stack View.

[08:15] Em momento algum, eu setei constraint de um em relação ao outro, e isso nos ajuda muito, porque a célula que vamos construir nas próximas aulas é algo parecido com isso. Eu vou ter uma célula e dentro dessa célula eu vou ter duas views que dão a impressão de serem duas células dentro da mesma célula, mas na verdade não é.

[08:40] Eu tenho aqui duas views dentro da mesma célula. E aqui tenho algumas labels, tenho imagens. Repara como é muito mais fácil de dar manutenção nas views quando trabalhamos com Stack View.

[08:54] Se eu estivesse trabalhando com constraints, eu teria que colocar constraint de uma label em relação a outra. Vamos supor que o time de produto nos peça para fazer um experimento e coloque mais uma “Label” entre “Porto de Galinhas” e “Aéreo + Hotel”.

[09:11] É só eu clicar e arrastar, eu não preciso apagar as constraints, reposicionar os elementos manualmente e setar as constraints novamente. Com o Stack View, eu coloco, excluo de uma forma muito simples, eu não tenho problema de constraints de um elemento em relação ao outro.

[09:32] Então, é muito mais fácil de conseguirmos trabalhar com as views quando utilizamos o Stack View. Relembrando, o Stack View é um novo elemento que nós acabamos de conhecer, que nos ajuda a trabalhar com Auto Layout e ele tem essa vantagem da manutenção da view.

[09:49] Então, eu consigo colocar e excluir elementos de uma forma muito mais simples. Nós vamos praticar mais na próxima aula.

@@03
Empilhando elementos

[00:00] De volta com o nosso projeto, nós acabamos de dar os primeiros passos com o Stack View. Aprendemos que conseguimos empilhar elementos na horizontal e na vertical, e agora é hora de utilizarmos isso, colocarmos a mão na massa para criar a nossa célula utilizando o Stack View.
[00:20] A ideia é criarmos algo parecido com isso. Temos aqui uma view com duas células dentro. Baseado no que nós acabamos de ver, no vídeo anterior, quando estudamos o conceito e um pouco da prática do Stack View, o que nós poderíamos colocar nessa célula para nos ajudar?

[00:43] Como temos duas, uma ao lado da outra, nós podemos empilhar duas células, nós poderíamos então utilizar um “Horizontal Stack View''. Então, vamos lá, é isso que vamos fazer.

[00:56] Eu vou apagar, aqui no “Library” vou procurar por “Horizontal Stack View”, e vou adicioná-lo dentro da célula. Lembra que o Stack View, por si só, não consegue se encontrar na tela, então precisamos setar constraints na primeira vez.

[01:21] Vou abrir o painel das constraints e vou setar uma constraint com “10” em todos os lados. Repara que ele vai ficar parecido com isso que estamos vendo, e vou começar adicionando duas views dentro desse Stack View.

[01:45] Vou abrir aqui, vou procurar por “View”, é a última, arrasto para cá. E se eu tentar duplicar essa “View”, olha só, vou segurar a tecla “Option” no Mac, vou clicar e vou arrastar. Então, consigo duplicar aqui.

[02:07] Ele automaticamente já aponta um erro. Por que ele aponta esse erro? Por causa da distribuição do Stack View. Estou com o Stack View selecionado, venho em “Distribution”, e está a opção “Fill”, ou seja, preencher.

[02:26] Nós colocamos duas views aqui dentro e ela vai ocupar o espaço total do Stack View, mas ele não sabe quanto ocupa cada uma. Então, se eu quisesse, por exemplo, trabalhar com valores alternados, não fossem tamanhos iguais, eu poderia citar uma constraint de largura.

[02:49] Vamos supor que eu quisesse colocar aqui, por exemplo, “250”. Uma view vai ocupar “250” e a outra view vai ocupar o espaço que sobrou. Essa view não tem constraint. Por que não tem constraint? Porque ela está ocupando o espaço que sobrou dentro do Stack View.

[03:06] Vou alterar, por exemplo, para “150”. Agora, uma view tem a largura de “150” e a outra tem a largura que sobrou, que é o valor de “118”. Ele parou de reclamar porque nós indicamos para ele uma largura. Mas não é isso que nós queremos agora, nós queremos duas views exatamente iguais, uma ao lado da outra.

[03:35] Então, o que temos que fazer? Temos que selecionar a view, ver qual é a largura e dividir por dois? Não, nós não precisamos fazer isso. Basta mudarmos a distribuição do Stack View.

[03:49] Olha só o que eu vou fazer, vou remover esse constraint, vou selecionar o “Stack View” e vou, então, alterar esse campo do “Distribution”. Onde está “Fill”, eu vou colocar “Fill Equally”, ou seja, preencher igualmente.

[04:06] O número de elementos que estiver dentro da Stack View vai ser igual para todos os itens. Então, clico aqui e agora temos aqui uma view de um lado e uma view do outro.

[04:21] Vou até alterar a cor de fundo dela para visualizarmos mais fácil. Tenho aqui uma view, tenho aqui outra view. Repare que temos um espaço entre as duas, entre uma view e outra, temos um espaço. Como fazemos para colocar esse espaço?

[04:42] Seleciono o “Stack View” e tenho a opção “Spacing”. Vou colocar, por exemplo, “10”. Então, tenho aqui o espaçamento. Tenho dois elementos empilhados um ao lado do outro.

[04:59] Vamos começar a trabalhar agora. Vou voltar para a cor branca, “White”, e vamos analisar o próximo passo. Temos aqui uma imagem e aqui embaixo várias labels. Vou começar colocando uma imagem. Vou vir aqui, “Image”, clico e arrasto para cá.

[05:29] Essa imagem vai ter a altura parecida com a que nós utilizamos na outra célula. Vamos dar uma olhada, temos aqui uma altura de “180”. Vamos manter esse mesmo tamanho, se precisar depois nós alteramos a altura.

[05:50] O que importa é que eu vou citar uma constraint, “0” no topo, “0” na margem esquerda, “0” na margem direita e uma altura de “180”.

[06:06] No próximo passo, vamos analisar essas labels. Temos que ter calma para entendermos qual componente vamos utilizar. Nesse caso, fica claro que podemos utilizar um “Vertical Stack View”, para colocar uma label embaixo da outra.

[06:25] Por que não coloquei a imagem dentro desse Stack View que vamos criar? Porque repara que a imagem não tem nenhuma borda, ela fica com zero de margem esquerda, direita e superior. E o Stack View que vamos utilizar tem uma margem que separa as labels tanto da margem esquerda quanto da margem direita.

[06:49] Então, eu optei por deixar a imagem de fora por causa disso. Vou colocar aqui um “Vertical Stack View”, vou posicioná-lo embaixo da imagem, e o que vou fazer? Vou ter que setar uma constraint para ele.

[07:14] Repara que sempre estamos trabalhando com Stack View e constraint. Não é que existe um melhor do que o outro, os dois se complementam para criarmos o nosso layout da melhor forma possível. Não é que um exclui o outro, os dois se complementam.

[07:31] Acabei de colocar um Stack View, agora vou setar as constraints. Vou colocar “10” em todas as margens e vou dar um “Add constraint”. Tenho aqui já um Stack View.

[07:50] A ideia, então, é empilhar uma label embaixo da outra. Para ganhar tempo, para não precisarmos colocar label, ficar formatando e mudando cor, eu vou utilizar a mesma label que nós já temos aqui.

[08:03] Vou selecionar essa, seleciono o Stack View e coloco aqui. Aqui, talvez, a única coisa que tenhamos que fazer é alterar o número de linhas. Onde está “Lines: 1”, eu vou deixar com “2” linhas. E também vou diminuir um pouco o tamanho da fonte.

[08:25] Uma coisa importante que nós fizemos aqui é o seguinte: nós setamos esse Stack View em todas as bordas. Quando eu coloco um elemento dentro dele, ele vai preencher todo o espaço disponível.

[08:40] Na verdade, eu não quero que ele preencha todo o espaço disponível, eu quero que a altura do meu Stack View seja em relação ao número de elementos que tem dentro dele.

[08:49] Então, da forma que está aqui, ele está ficando no meio, porque está ocupando todo o espaço disponível. Eu vou apagar a constraint onde nós “pinamos” o nosso Stack View na margem de baixo para que ele ocupe o espaço que temos com o número de elementos dentro.

[09:08] Então, vou mostrar que fica mais fácil. Selecionei o Stack View, venho aqui, clico na margem inferior e aperto o “Delete”. Olha só, agora eu tenho aqui a label ocupando a parte superior. Por quê? Porque nós não prendemos mais o Stack View abaixo.

[09:32] Se ele estivesse preso com a margem aqui embaixo, ele teria que ocupar todo o espaço disponível, por isso a label ficou no meio. Então, eu já tenho aqui a primeira label, vamos continuar colocando a próxima, que é de subtítulo.

[09:50] Vou fazer a mesma coisa para ganhar tempo. Selecioná-la, vou vir aqui, clico no Stack View. Ele não ficou dentro, vou clicar e colocá-lo para cá, ele tem que ficar na mesma hierarquia.

[10:09] Seleciono a label, uma alteração que vou fazer também, aqui no menu de “Inspector”, é o número de linhas, vou deixar com “2” linhas e vou diminuir o tamanho da fonte, vou deixar com o tamanho “13”.

[10:29] Vamos para a próxima. Então, “a partir de” e o valor, vou colocar aqui, seguro o “Option”, arrasto para baixo. Qual é a frase? “A partir de 12.500”. E, por último, o valor, vamos ter uma label com o valor.

[10:57] Vou colocar, por exemplo, “1.500”, que é o valor real da viagem. Aqui é o valor promocional e aqui é o valor original. Vou setar aqui um espaçamento entre os elementos. Selecionei o Stack View, aqui onde tem “Spacing” vou colocar um espaço de “3”. Só para os elementos não ficarem muito próximos.

[11:39] Então, já temos a primeira célula que nós criamos, e agora vamos duplicar essa célula para não precisarmos desenhá-la novamente. O que eu vou fazer? Vou apagar essa view, então clico e a apago.

[11:55] E aqui, vou fazer o seguinte. Repara que ele ocupou agora todo o espaço do Stack View disponível, mas vou fazer o seguinte: vou selecionar essa “View”, apertar o “Option” e arrastá-la para baixo.

[12:10] E agora nós temos, então, duas views iguais dentro da mesma célula. Nós precisamos terminar de formatar e depois setar os outlets desses elementos no nosso código.

@@04
Criando outlets

[00:00] Faltaram alguns detalhes para terminarmos essa primeira etapa da célula de ofertas, então vamos fazer esses ajustes agora.
[00:10] A primeira coisa que vamos fazer é colocar a sombra de fundo que temos aqui nas outras células. Para fazer isso, vamos precisar criar mais dois outlets, que são os outlets da “View” de fundo que temos aqui.

[00:27] Nós temos a primeira “View” e a segunda. Nós precisamos desses dois outlets para aplicar o efeito da sombra. Vamos criar esses outlets. Vou vir no “Assistant”, e aqui vou criar o primeiro outlet.

[00:50] Vou clicar aqui, nessa primeira “View”, seguro a tecla “Ctrl” e vou arrastar para cá. Vou alterar aqui também para “Outlet Collection” e vou colocar aqui um nome que vai ser “fundoViews”. Escolhi “Views”, porque tem mais de uma, vamos criar um “Outlet Collection”.

[01:14] Vou clicar em “Connect” e agora vou clicar e arrastar para a segunda “View”. Quando eu coloco o ponteiro do mouse em cima, ele me mostra, então, a seleção nas duas views.

[01:26] Nós já temos o outlet, vou voltar para a visualização única. E aqui logo eu posso setar os outlets, posso fazer o seguinte, posso percorrer essa lista, então fundoViews.forEach. Vou dar um nome para a view que ele está percorrendo, viewAtual, por exemplo.

[01:47] E aqui eu pego a viewAtual.addSombra. Só isso já vai dar um efeito bem bacana, então vou rodar o projeto, vamos ver como ficou. Olha só, temos aqui uma célula com o fundo já bem legal.

[02:05] Precisamos ainda corrigir alguns espaçamentos, como, por exemplo, essa borda, a de baixo também que, por default, já vem na Table View com o valor 18 ou 20, que faz com que fique esse espaço.

[02:23] Vou vir aqui no “storyboard”, vou clicar na Talbe View, abrir a tela direita e aqui em “Sections”, repara que ele tem esse “Header Height” e o “Footer Height”. Então, está com o valor de “18”, vamos deixar “0” e “0” aqui também.

[02:45] Vamos rodar o projeto de novo para vermos como está. Legal, já diminuímos esse espaçamento. Outra coisa que está me incomodando é o seguinte: o ideal era essa célula acompanhar, ficar com o mesmo espaçamento da célula de cima. Como aplicamos uma borda de 10, ele está pegando uma margem a mais que não deveria.

[03:11] Então, vamos aproveitar e vamos corrigir isso. Vou vir aqui na célula de “Oferta”. Se eu clicar na Stack View que nós adicionamos, ele tem uma borda com o valor de “10”. Vou deixar para que ele pegue a borda que ele está indicando aqui, que já vai corrigir esse problema.

[03:35] Então, todos os espaços que estão com “10”, eu vou deixar “0” para que ele fique com o tamanho normal. Vamos testar novamente, fazer um scroll. Agora já ficou melhor, já temos a célula meio que no mesmo espaço da superior.

[04:02] Nós podemos também diminuir o tamanho dessa célula, vamos ver no próximo capítulo. Quando formos trabalhar novamente com Stack View, vamos alterar algumas coisas na home.

[04:14] E, para finalizar, agora eu vou somente corrigir esse espaçamento. Nós colocamos uma “Horizontal Stack View” com duas labels empilhadas uma ao lado da outra, só que a ideia é que essa label ficasse próxima ao valor.

[04:29] Então, vou inverter a constraint. Nós tínhamos setado a constraint nessa label, então vou clicar na constraint – cuidado para não apagar a label, mas caso você apague, é só apertar “Command + Z” que ela volta – e vou setar uma constraint nessa label, na que tem o valor.

[04:50] Então, onde está “65”, vou colocar “60”. Coloquei um valor muito baixo, vou voltar aqui, “Command + Z”. Onde está “68”, vou colocar “60”, dar um “Enter”.

[05:08] Deixa eu ver se ficou bom esse tamanho, se ficar, nós colocamos na label ao lado. Aqui ele está respeitando o espaço correto, então vou aplicar esse mesmo valor na view ao lado, que é constraint de “60”.

[05:27] Vou apagar essa constraint da label “em até 12x”, ele vai reclamar, não tem problema, nós setamos novamente a constraint de largura. Então, agora temos as duas células com toda formatação que nós precisávamos. Vamos testar novamente.

[05:51] Aqui, nós já quase terminamos a home. O que eu queria mostrar para você nesse capítulo, nessa aula, era exatamente o uso do Stack View. Nós vamos continuar praticando bem mais no decorrer desse curso.

[06:06] E mostrar que a combinação de constraint com Stack View deixa as nossas ferramentas de construção de layout muito mais poderosas porque aí nós já sabemos que, com Stack View, nós conseguimos empilhar os elementos de uma forma mais fácil, não precisamos nos preocupar em pinar um elemento em relação ao outro.

[06:27] Mas é importante também saber utilizar as constraints junto com o Stack View, que é a forma que nós utilizamos aqui. Vamos supor que seja necessário colocar mais uma label, como estamos utilizando Stack View, basta acrescentar essa label dentro do Stack View.

[06:45] Nós não precisaríamos nos preocupar com a relação de constraints e tudo mais. Esse é um exemplo clássico que nos ajuda a entender como se trabalha com Stack View.

@@06
Uso do UIStackView

Há diversas maneiras de se criar uma View, e pensando em boas práticas o ideal é entendermos o contexto geral da View para que possamos tomar as melhores decisões, principalmente em relação a manutenibilidade, ou seja, a capacidade de mudanças na View sem que prejudique o que foi construído. Pensando nesse assunto, qual a principal vantagem que vimos no StackView em relação as constraints?

A principal vantagem é que o UIStackView aplica constraints nos elementos automaticamente. Assim não temos o trabalho de aplicar constraints em todos os elementos.
 
O stackview não aplica as constraints automaticamente nos elementos de dentro dele.
Alternativa correta
A principal vantagem do UIStackView em relação as constraints é a fácil manutenção do layout quando precisamos adicionar ou remover algum elemento.
 
Alternativa correta! Alternativa correta! Como vimos na aula, o UIStackView empilha os elementos e os distribui de forma dinâmica. Já as constraints prende um elemento em relação ao outro. Ou seja, se precisarmos apagar algum elemento com constraint teremos que identificar e recolocar as constraints necessárias para que a implementação fique correta.
Alternativa correta
A principal vantagem é que quando trabalhamos com UIStackView, não podemos utilizar constraints, por isso a implementação fica mais fácil.

@@07
Faça como eu fiz: Configurando o header

Nessa aula, introduzimos o assunto principal do curso que é o uso do UIStackView. Com ele podemos fácilmente empilhar elementos tanto na horizontal quanto na vertical. Esse componente pode ser utilizado sempre que você precisar colocar elementos um embaixo do outro ou lado a lado. Como podemos adicionar um UIStackView?

Opinião do instrutor

Para adicionar um StackView na View, devemos abrir a biblioteca de elementos no interface builder e arrastar um novo StackView para dentro do local que estamos trabalhando. Logo em seguida, precisamos aplicar as constraints no StackView.

@@08
O que aprendemos?

Nesta aula, aprendemos:
Uso do StackView
O StackView permite que você aproveite o poder do Auto Layout, criando interfaces de usuário que podem se adaptar dinamicamente à orientação do dispositivo, ao tamanho da tela e qualquer alteração disponível no espaço disponível.

@03-Criando uma nova tela

@@01
Projeto da aula anterior

Se você deseja começar o curso a partir desta aula, pode fazer o download do projeto desenvolvido até o momento.

https://github.com/alura-cursos/alura-viagens-parte-II/archive/c06844e01476cff6124e2bea89a9fec33f17a47f.zip

@@02
Criando novo ViewController

[00:00] Com a nova célula para a home criada, agora vamos partir para uma nova funcionalidade que vai ser a tela de detalhes. A ideia é o usuário conseguir selecionar uma viagem, um pacote de viagem na home, e nós o levemos para a tela de detalhes.
[00:20] O objetivo desse capítulo é continuarmos estudando sobre UIStack View. Nós começamos a ver na criação da célula para a home e agora vamos praticar mais um pouco para aprendermos como desenvolvemos de fato utilizando a Stack View para telas um pouco mais complexas, como essa daqui.

[00:20] Quando falamos em criar uma nova tela, logo vem em mente criarmos um novo “View Controller”, uma nova view. Então, tem basicamente duas maneiras de se fazer isso quando estamos utilizando o Interface Builder, que é através do Storyboard ou utilizando XIB. Vamos ver essas duas formas.

[01:05] Começando pelo Storyboard, como eu faria? Vou vir aqui no nosso “storyboard”, vou vir no menu “Library”, clico nele e procuro por “View Controller”. Seleciono o “View Controller” e arrasto para dentro do Storyboard.

[01:26] Então, criei uma nova view. Quando crio uma nova view, eu preciso criar um arquivo que herde de “UIViewController” para controlar de fato essa view, e é isso que vamos fazer agora. Eu tenho a view e preciso do arquivo que controle essa view.

[01:45] Dentro da pasta “View”, no menu lateral esquerdo, vou clicar com o botão direito, vou vir em “New File/Novo Arquivo”, vou optar essa opção “Cococa Touch Class”, vou dar um “Next”, e aqui é importante que a opção “Subclasse de” esteja selecionada a opção “UIViewController”.

[02:09] Se no seu caso não estiver, basta você selecionar essa flecha do lado e procurar por “UIViewController”. Vamos deixar desmarcada essa opção “Also create XIB file” nesse momento, e vou dar um nome para o “ViewController, vou chamar de “DetalheViewController”.

[02:29] Vou dar um “Next” e um “Create”. Ele criou aqui para baixo então vamos organizar um pouco. Vou fechar essa pasta, vou fechar essa pasta do “Header” e vou arrastá-lo aqui logo embaixo do nosso “ViewController.swift” da home.

[02:49] Então, quando eu crio uma view aqui no Storyboard, eu preciso indicar para essa view que existe um arquivo que vai controlá-la. Então, como fazemos isso? Vou selecionar o “View Controller”, vou abrir o menu lateral direito e, nessa quarta opção, temos essa caixa de “Class”.

[03:13] Repara que não tem nenhum arquivo aqui, e é exatamente aqui que vamos configurá-lo indicando que esse novo arquivo que nós criamos vai controlar essa view.

[03:23] Então, vou digitar “DetalheViewController” e, outra coisa que também precisamos fazer é colocar um identificador para essa view. No momento que formos instanciar esse “Controller”, nós precisamos indicar qual “View Controller” dentro do Storyboard nós queremos instanciar.

[03:46] Repara que podemos ter vários. Já temos a home, temos a tela de detalhes, poderíamos ter um terceiro, um quarto, um quinto, enfim, muitas possibilidades. O que eu recomendo é não utilizar. Se você optar por trabalhar com Storyboard, use o mesmo Storyboard para todos os fluxos da sua aplicação.

[04:07] Já trabalhei em projetos que para carregar o Storyboard demorava muito tempo, o projeto começa a ficar pesado. Então, se você optar por utilizar o Storyboard, você pode criar vários Storyboards.

[04:18] Por exemplo, se você tem um aplicativo e você precisa do fluxo de login, você pode criar um Storyboard somente para o fluxo de login. “Mas tenho também o fluxo de cadastrar usuário, são várias telas”, posso criar outro Storyboard com somente as telas de cadastro de usuário.

[04:38] Então, deixar toda a aplicação dentro de um único Storyboard não é aconselhável. Se você optar por trabalhar com Storyboard, tem essa possibilidade que fica bem melhor: um Storyboard para cada fluxo do seu app.

[04:53] Voltando aqui então, vou deixar por enquanto sem o identificador para você ver como vamos utilizá-lo, depois voltamos e o colocamos. O importante é que colocamos aqui que essa classe “DetalheViewController” vai ser a classe que vai controlar essa view.

[05:11] Agora vamos voltar na home, que é esse “ViewController”, e precisamos pensar no seguinte: quando eu faço um clique em uma célula da Table View, eu preciso, de alguma forma, ter acesso a esse evento, ou seja, eu preciso saber quando o usuário deu um clique na Table View.

[05:30] Tem um método bem interessante, que faz parte do protocolo de “UITableViewDelegate”, que se chama “didSelectRow”, ou seja, acabou de selecionar uma célula”, algo nesse sentido. Quando o usuário acaba de selecionar uma célula, é disparado esse método e nós conseguimos, então, fazer o que nós precisamos que, no caso, é chamar um novo “View Controller”.

[05:53] Então, dentro da extensão do nosso ViewController, onde estamos implementando o protocolo de UITableViewDelegate, eu vou procurar por didSelectRow. Repara que ele já nos traz como sugestão esse método e é exatamente ele que nós precisamos.

[06:11] E, dentro dele, eu posso fazer tudo que eu quiser quando o usuário fizer um clique em um item da Table View. O que eu vou fazer, então? Vou precisar instanciar aquele “View Controller”. Como faço isso?

[06:28] Vou declarar uma constante, vou chamar de detalheController. Como ele está dentro do nosso “Main.storyboard”, que é esse arquivo aqui, eu preciso chamar a classe UIStoryboard e posso inicializar um Storyboard através do nome.

[06:54] Vamos lá então, qual é o nome do nosso Storyboard? O nome do nosso Storyboard é “Main”, “Main.storyboard”, então coloco só a primeira parte antes do ponto. Vou colocar aqui “Main”. O Bundle está no mesmo pacote de arquivos, então não preciso especificar nada, posso passar aqui nil.

[07:16] Só que quando eu faço isso, eu tenho acesso ao Storyboard, e eu não quero ter acesso ao Storyboard inteiro. Eu quero ter acesso ao Storyboard e, dentro dele, quero ter acesso a esse controller que acabamos de criar.

[07:31] Então, como faço isso? Tem um método aqui que se chama instantiateViewController e eu passo um identificador. E é nesse momento que nós vamos utilizar o identificador que ainda não colocamos. Por isso que é importante colocar o identificador para cada ViewController dentro do Storyboard.

[07:52] Eu costumo colocar o mesmo nome do arquivo, então repara que aqui o nome da nossa classe é “DetalheViewController”, eu vou utilizar o mesmo nome no “Storyboard ID”. Mas se você quiser colocar qualquer coisa, você pode colocar, desde que coloque o mesmo valor no método, senão pode ocorrer um crash.

[08:13] Eu costumo colocar o mesmo nome da classe, então já setei esse valor. E quando eu volto e coloco o identificador, eu tenho acesso ao ViewController. O que eu vou fazer agora? Vou fazer a navegação para a próxima tela. Para qual tela? Para a tela de detalhes.

[08:37] Então, o que vou fazer? navigationController.push, quero puxar o próximo ViewController, e passo aqui o detalheController. Aqui eu tenho uma flag, se quero fazer isso de forma animada ou não, então vou passar true, porque quero que seja de forma animada.

[09:00] Vamos ver se dessa forma que está aqui ele vai funcionar. Vou rodar no simulador do iPhone 11, vou gerar um build e vamos testar se vai funcionar dessa forma.

[09:16] Acabamos de subir o simulador, vou clicar em cima de uma célula e repara que não está acontecendo nada. Eu clico e não ocorre nada. Nós podemos investigar esse problema de algumas formas. Primeiro, precisamos ver se realmente está caindo nesse método quando eu faço o clique na célula.

[09:40] O curso não é especificamente de debug, mas vou utilizar um break point, que é essa flecha azul. Isso significa que quando esse código for chamado, ele vai parar nessa etapa, e aí nós conseguimos fazer alguma coisa.

[09:57] Ou seja, se eu fizer um clique na célula e realmente para nesse break point, significa que o nosso método está sendo disparado de forma correta. Então, vamos testar.

[10:09] Cliquei aqui, ele caiu dentro desse método. Significa que o evento está sendo disparado. Vou passar, vou clicar nesse botão de baixo para continuar a execução do nosso programa.

[10:27] Primeira coisa que precisávamos ver era se o método estava sendo chamado. Vimos que está. Agora precisamos ver essa linha aqui, que de fato é a linha que faz o push, ou seja, que faz a navegação para a próxima tela. Nós precisamos ver se essa parte está funcionando.

[10:46] Então, vou fazer a mesma coisa. Vou clicar novamente em uma célula, só que agora vou para a linha de baixo. Para ir para a linha de baixo, vou clicar nessa seta aqui, “Próxima etapa”.

[11:00] Cliquei aqui, ele parou agora na linha 73. Nesse bloco, eu consigo fazer alguns comandos para verificar se, por exemplo, a variável navigationController existe, ou seja, ela deve existir para conseguir fazer o push.

[11:18] Vou digitar uma palavra reservada que é po, espaço e o nome da variável, navigationController. Vou dar um “Enter” e olha só que interessante, navigationController está retornando nil, ou seja, não tem valor nenhum dentro dessa variável navigationController.

[11:37] Como ela está nil, ou seja, não há valor nenhum, ele não consegue fazer a navegação para a próxima etapa. O debug serviu para nos ajudar a entender que, se alguma vez você estiver tentando fazer uma navegação clicando ou de alguma outra forma e não estiver acontecendo nada, uma dica é verificar se a variável navigationController existe.

[12:00] Vou tirar esse break point do código, vou clicar e arrastar para fora, e vou continuar a execução do programa clicando nessa seta aqui.

[12:11] A variável navigationController está nil, então precisamos entender o porquê disso. Eu vou voltar no “storyboard”, vou dar um zoom um pouco menor. Então, nós temos duas telas: a home e a nova tela de detalhes que estamos criando agora.

[12:33] Quando trabalhamos com navegação de telas, existe um componente chamado “Navigation Controller”, e precisamos dele para fazer essa navegação. Nós não temos aqui no nosso Storyboard. Então, é esse o problema. Sem o “Navigation Controller”, nós não conseguimos fazer a navegação de telas.

[12:55] Para resolver esse problema, vamos incluir um novo navigationController no Storyboard. Aqui de novo na “Library”, na nossa “Biblioteca”, eu vou procurar por “Navigation Controller”, que é esse aqui, vou clicar e arrastar aqui para dentro.

[13:13] Repara que, quando eu faço isso, ele já traz um “Root View Controller”. É um View Controller que ele traz por padrão, por default, para começarmos o nosso aplicativo. Nesse caso, não vou utilizar esse “View Controller” aqui, vou utilizar somente o “Navigation Controller”.

[13:35] Então, vou clicar fora, clico nesse “View Controller” que eu não quero e aperto o “Delete”. Eu preciso, somente, do “Navigation Controller”.

[13:49] Outra coisa importante: tem uma seta aqui, quando trabalhamos com Storyboard, que indica qual “View Controller” deve ser instanciado quando esse Storyboard for utilizado.

[14:00] Nesse caso, é a home, mas nós queremos que, a partir de agora, o primeiro elemento dentro do Storyboard que vai ser executado, que ele vai ler, seja o “Navigation Controller’. Então, vou clicar nessa seta e arrastar para trás.

[14:16] E quando faço isso, eu preciso indicar para o “Navigation Controller” qual é o primeiro “Controller” que ele deve enter como o “View Controller” que ele vai navegar, ou seja, que ele vai mostrar.

[14:27] Nesse caso, vai ser o “View Controller” da home. Então, vou segurar a tecla “Ctrl” e vou arrastar para cá. Aí ele abre esse popover aqui com várias opções, a opção que vamos selecionar é esse “root view controller”.

[14:46] Então, vou gerar um novo build só para testarmos essa implementação do “Navigation Controller” que é importante entendermos. Repara que quando colocamos o “Navigation Controller”, ele já traz uma barra superior que vamos ignorar daqui a pouco, mas o importante é clicarmos e ele nos levar de fato para uma próxima tela.

[15:13] Então, o objetivo desse vídeo era isso, mostrar como nós fazemos navegação entre telas. Nós criamos um “View Controller” dentro do Storyboard, e a seguir nós continuamos estudando outras formas de se trabalhar com a navegação de telas e criação do “View Controller”.

@@03
Criando ViewController com xib

[00:00] Nós acabamos de criar o novo “View Controller” de detalhes através do Storyboard. Nós temos aqui o “Controller” de detalhe. Uma coisa que eu queria mostrar para você é que, quando nós colocamos um “Navigation Controller”, ele adicionou essa nova barra aqui em cima, que é a top bar do “Navigation Controller”, e nós conseguimos ocultar isso da seguinte maneira:
[00:27] Eu vou selecionar o “Navigation Controller”, vou abrir o menu lateral direito e tenho essa opção chamada “Top Bar”, vou escolher a opção “Nenhuma”, clico aqui.

[00:41] Repara que aqui ele já sumiu da nossa “View”. Vou rodar de novo o simulador para testarmos e essa configuração vai solucionar esse problema para nós.

[00:55] Quando faço o scroll, repara que agora não tenho mais a barra superior, porque nós ocultamos através do “Top Bar”. Outra forma de criarmos essas views e o “View Controller” é através do XIB, que é isso que quero mostrar para você nesse vídeo.

[01:15] Nós utilizamos aqui o Storyboard, incluímos mais um “View Controller”, criamos a classe para controlá-lo, porém, existe outra maneira que também é muito utilizada no mercado, que vou mostrar para você.

[01:30] Para fazer isso, eu vou excluir esse “View Controller”, vou deletá-lo daqui, e também vou excluir essa classe que nós criamos aqui. Vou vir em “Delete” e vou escolher a opção “Move to Trash”, essa primeira opção.

[01:49] Nós continuamos com a home e o “Navigation Controller”, e vamos então criar uma nova view. O que eu vou fazer aqui só para manter o nosso projeto um pouco mais organizado?

[02:04] Vou criar uma nova pasta, “New Group”, vou nomear como “DetalheViewController”, vou arrastá-la um pouco para baixo e, aqui dentro, crio o nosso arquivo de XIB e a classe para controlá-lo.

[02:25] Então, vou vir em “Novo Arquivo”, aqui vou manter a opção “Cocoa Touch Class” selecionada. Aqui é importante você manter a opção de “Subclasse de UIViewController”, caso o seu ainda não esteja. E vamos nomear, então, para “DetalheViewController”.

[02:45] Aqui, vou marcar essa opção “Também criar o XIB file”. Vou ticar essa opção, vou dar um “Next” e ele vai criar para nós, dentro dessa pasta que acabamos de criar.

[03:01] Vou começar apagando alguns comentários que nós não vamos utilizar, vou apagar aqui também. Qual a diferença, então? Repara que agora eu tenho a classe do ViewController e tenho a view desacoplada do Storyboard.

[03:18] Então, o que eu vou fazer? Vou selecionar essa view de fundo, vou alterar o “Background” dele para qualquer outra cor, só para testarmos. Vou escolher essa cor, por exemplo.

[03:29] E agora temos que voltar no método onde temos a ação do clique de um elemento para conseguimos refatorar porque nós não estamos mais utilizando Storyboard, estamos utilizando XIB, então precisamos inicializar de uma forma um pouco diferente.

[03:49] O evento que é disparado quando selecionamos um item na Table View é esse de didSelectRowAt. Aqui, nós estamos utilizando o UIViewController e, dessa forma, instanciamos a view que estiver dentro do Storyboard.

[04:05] Mas, como eu disse, nós não estamos mais utilizando Storyboard, então vou apagar essa parte aqui e vou instanciar a view de detalhe. Como faço isso? DetalheViewController. Tenho aqui alguns tipos de inicialização, vou escolher essa aqui, nibName.

[04:25] O nibName nada mais é do que o nome da própria view, então, entre string, vou passar o nome da view que nós criamos, ”DetalheViewController”, e o segundo parâmetro é esse bundle, que é o pacote. Como está tudo no mesmo pacote, não temos outros targets, então eu passo como nil.

[04:45] Estou inicializando o meu XIB dessa maneira, agora vou rodar mais uma vez o simulador para testarmos e ver se realmente a nossa implementação está funcionando.

[05:01] Vou selecionar aqui qualquer viagem, clico aqui e abro da mesma maneira que estávamos abrindo a view no Storyboard. Então, tem duas maneiras que vimos aqui de se trabalhar com o Interface Builder: através do Storyboard e através do XIB.

[05:18] Qual a diferença? Qual é melhor, qual é pior? Na verdade, é um pouco polêmico isso porque cada desenvolvedor tem suas considerações sobre esse assunto, mas o que é fato é que todas elas têm pontos positivos e pontos negativos.

[05:34] Quando falamos, por exemplo, do Storyboard, é muito mais fácil entender o fluxo do aplicativo quando você consegue desenhar esse fluxo dentro de um mesmo Storyboard.

[05:47] Por exemplo, se você vai desenvolver o fluxo de login, é muito mais fácil de entender se você criar as telas com a navegação lado a lado do fluxo de login, então você olha o Storyboard e já tem uma noção de como é o fluxo do seu aplicativo.

[06:03] Quando você cria uma view isolada com o XIB, você não tem muita noção de onde é chamado, de onde vem, então esse é um dos pontos negativos do XIB e um dos pontos positivos do Storyboard.

[06:17] Quando nós criamos através do XIB, o maior ganho que a galera da comunidade costuma comentar é em relação ao desacoplamento dessa view do Storyboard. Como assim, desacoplamento?

[06:31] Quando nós começamos a criar as view no Storybard, nós criamos uma espécie de dependência entre as views. Por exemplo, eu tenho aqui uma “Table View” e quando faço o clique em uma célula da “Table View”, eu abro outra tela, um outro “View Controller”. Estou ilustrando o exemplo.

[06:51] Porém, essa tela que está dentro do fluxo do Storyboard pode ser chamada de outro lugar da aplicação. Então, será que faz sentido ela estar dentro do fluxo do login, por exemplo, se ela pode ser chamada de outro lugar?

[07:05] Você começa a criar algumas dependências que não são tão interessantes com o Storyboard. Já o XIB é muito melhor nessa questão por causa disso, porque você consegue criar a view desacoplada e fica muito mais fácil de você reutilizar essa view em outros pontos da sua aplicação.

[07:27] Então, a comunidade costuma trabalhar um pouco mais com o XIB quando falamos de Interface Builder por causa disso. Também nós temos criação de layout via código, que se chama View Code, que tem também seus prós e contras.

[07:45] Como, por exemplo, é muito mais fácil fazer o code review quando você desenha a view via código porque você consegue ver o código da view. E quando nós desenhamos utilizando Interface Builder, ele gera um XML que nós não conseguimos entender muito bem o que está acontecendo.

[08:06] Não tem como fazer um code review de uma view desse tipo por conta disso, então isso acaba sendo uma desvantagem.

[08:15] Porém, é muito mais demorado no começo, quando você trabalha com View Code, de você criar as suas views, porque é mais trabalhoso, você tem que digitar todo o código na mão, você não tem essa facilidade de ir arrastando os elementos da biblioteca para dentro da view.

[08:34] Então, não tem melhor, não tem pior, é importante você conhecer todos, porque você vai trabalhar em uma empresa, então provavelmente você vai pegar projetos diferentes ao decorrer do tempo, e pode ser que um esteja utilizando o Storyboard, outro esteja utilizando XIB e outro esteja utilizando o View Code.

[08:53] Então, o ideal é você conhecer bem esses três tipos diferentes de construir o layout com UIkit.

@@04
Trabalhando com ScrollView

[00:00] De volta com o nosso projeto, a ideia é continuarmos com a tela de detalhes, mas antes, eu queria mostrar para você um componente muito utilizado na criação da interface do usuário, das telas de aplicativos, que é o ScrollView.
[00:19] O ScrollView nada mais é do que uma barra de rolagem que serve para mostrar mais elementos do que cabe na tela. Então, provavelmente você já viu em aplicativos, principalmente de marketplace, quando você clica em um produto e você vai ver os detalhes do produto.

[00:35] Então, sempre tem um ScrollView que auxilia o usuário a visualizar mais informações do que pode caber na tela. Antes, de fato, de começarmos a implementação dessa tela, vamos falar um pouco sobre ScrollView, porque é muito importante você saber como usar.

[00:55] Vou abrir a nossa biblioteca, vou procurar por “ScrollView”, vou clicar e arrastar para dentro. O ScrollView é um pouco mais chato de utilizar do que outros componentes porque tem algumas configurações a mais que precisamos fazer para que ele funcione.

[01:15] Para começar, quando eu coloco qualquer elemento dentro do View Controller, eu posso citar as constraints para posicioná-lo onde eu quero na tela. Então, vou começar fazendo isso. Tenho o ScrollView selecionado, vou abrir o painel de “Constraints”, e vou colocar uma constraint 0 na margem superior, na margem da esquerda, da direita e aqui de baixo.

[01:40] E vou clicar em “Adicionar constraints”. Repara que logo quando eu faço isso, ele já aponta erros. Se eu tivesse feito isso com qualquer outro elemento, funcionaria, como, por exemplo, uma view, uma imagem, uma label, qualquer coisa ele iria funcionar.

[01:56] O que eu vou fazer aqui? Para corrigir esse problema, nós precisamos desabilitar uma configuração que o ScrollView tem, que é essa opção do “Content Layout Guides”.

[02:15] Então, desabilitando essa opção, eu consigo utilizar as configurações da constraint que acabei de setar. Para vermos como funciona o ScrollView, vou utilizar um “Vertical Stack View” e vamos empilhar algumas views dentro do Stack View que vai estar dentro do ScrollView.

[02:37] Então, a ideia é colocarmos várias Views coloridas que ultrapassem o tamanho da tela para vermos o scroll funcionando. Vou abrir a biblioteca, vou procurar por “View”, vou selecionar esse elemento e arrastar para dentro do ScrollView.

[03:00] Na verdade, vamos utilizar uma Stack View, então vai ser uma “Vertical Stack View”. Vou arrastar para dentro do ScrollView. Eu costumo clicar e redimensionar do mesmo tamanho do Scroll manualmente.

[03:22] “Mas poderia setar constraints com a margem com valor de 0”. Poderia, mas às vezes o Scode buga e não funciona muito bem, então eu costumo fazer isso manualmente, redimensioná-lo e depois, de fato, setar as constraints, que é o que vou fazer agora.

[03:43] Com o Stack View selecionado, vou abrir o painel de constraints e vou setar constraints em todas as margens com o valor de “0”. Feito isso, vou clicar em “Adicionar”. Repara que temos vários erros: erro na margem esquerda e direita, erro na margem superior e erro na margem inferior.

[04:06] Então, temos que corrigir algumas coisas. A primeira coisa que vamos fazer para corrigir esse erro da margem tanto esquerda quanto direita, é falar que a largura do “Stack View” vai ser a mesma largura do “Scroll View”.

[04:24] Então, esses detalhes peculiares na utilização do ScrollView é importante você fazer e refazer várias vezes para pegar o jeito de como você configura corretamente o Scroll View. É legal praticar várias vezes para pegar o jeito de como faz a configuração do Scroll.

[04:46] Então, o que eu vou fazer? Selecionei o “Stack View”, vou segurar a tecla “Ctrl”, vou arrastar para o “Scroll View” e vou selecionar essa opção, “Equal Widths”, que é a largura igual à do “Scroll View”.

[05:00] Clico aqui, então já temos a solução de dois problemas, que é a margem esquerda e a margem direita, então já fizemos essa configuração da igualdade de larguras justamente para isso. Porém, ainda continuamos com um problema na margem superior e inferior, que nada mais é do que a altura do Stack View.

[05:25] Ele não nenhuma altura, e o Stack View vai entender altura quando colocarmos algum elemento dentro. Por exemplo, vou colocar uma view e essa view vai ter uma altura, então ele assume que a altura do Stack View é a altura da view que eu citei com as constraints.

[05:45] Vamos ver na prática que é mais fácil. Vou abrir o painel de biblioteca mais uma vez, vou procurar por “View”, clicar e arrastar para dentro do “Stack View”.

[06:01] Uma coisa importante é você entender a hierarquia que está ocorrendo aqui. Tenho o “Scroll View”, dentro do “Scroll View” tenho o “Stack View”, e dentro do “Stack View” eu tenho essa “View” que acabei de adicionar.

[06:16] Então, quando você fizer essa aula junto comigo, é importante que você tenha certeza que essa hierarquia está sendo seguida. “Scroll View”, dentro dele o “Stack View”, e dentro dele o conteúdo que nada mais é do que a “View” que eu acabei de incluir.

[06:34] Continuamos com o problema de constraints, mas vamos solucionar agora. A “View” que eu acabei de colocar dentro do “Stack”, vou setar uma altura, por exemplo, de “200”. Poderia ser qualquer valor, estou colocando “200” só para ilustrar.

[06:50] Adicionei e agora não temos mais problemas com constraints. Clico em todos os elementos, está tudo azul. Já solucionamos o problema de altura com a constraint de altura.

[07:07] E como eu testo para ver se o Scroll View está funcionando? Vou começar alterando a cor dessa view, só para conseguirmos visualizar melhor, e vou copiar e colar essa view algumas vezes.

[07:21] Vou alterar de verde para cinza, vou alterar de verde para roxo e vou alterar para amarelo. Por enquanto, ele não ultrapassou o tamanho da tela. Vamos fazer um teste? Vou rodar o nosso projeto no simulador para vermos se o Scroll já está ativo.

[07:44] Não deveria, porque ainda não ultrapassamos o tamanho da tela do dispositivo, então só deveria mostrar de fato as views coloridas. E é isso que está acontecendo. Eu clico e arrasto, não acontece nada.

[08:04] A partir de agora, vou copiar mais uma vez algumas views aqui, “Command + C” e “Command + V” para ganharmos tempo. Vou alterar para rosa; fiz mais uma cópia, vou alterar para azul; fiz mais uma cópia, vou alterar para essa cor de palha.

[08:29] Agora, sim, nós temos mais conteúdo do que comporta o tamanho da tela. Então, provavelmente, quando eu testar isso no simulador, ele deve funcionar. Nós já temos aqui um componente que está funcionando com o Scroll View.

[08:52] Por que eu quis mostrar isso antes de começarmos a implementação da nossa tela de detalhes? Porque é muito importante você ter a visão do todo. O que eu quero dizer com isso? Quando estamos construindo uma view, é importante entendermos a possibilidade de essa view, por exemplo, crescer.

[09:12] Então, imagine se você não soubesse trabalhar com Stack View, que é o que estamos aprendendo agora, e se você não soubesse trabalhar com Scroll View, você fizesse essa tela de detalhes tudo com constraints, que foi o que aprendemos no curso anterior.

[09:29] Está errado? Não está errado, mas é muito mais trabalhoso. Imagine se o produto de o time de UX sugere uma alteração nessa view, vai precisar inserir, por exemplo, o mapa de localização entre o título e a label de dias, de quantidade de dias ou de valor.

[09:51] Você teria que remover todas as constraints, reposicionar todos os elementos manualmente, não teria Scroll, então seria um pouco bagunçado. Quando você já tem essa visão antes do desenvolvimento da view de “essa view pode crescer, não pode crescer, será que é melhor já começarmos utilizando Scroll View ou não?”.

[10:13] Então, precisamos ter esses detalhes que só conseguimos conforme formos praticando. Eu quis mostrar a importância do Scroll View justamente para isso. Se amanhã ou depois nós precisarmos adicionar mais elementos dentro desse Stack View, dessa tela de detalhes que nós vamos construir, a tela já está preparada para isso.

[10:37] Então, é muito interessante trabalharmos com o Scroll. Dá um leque de possibilidades muito maior para construirmos as nossas views.

[10:49] A última coisa que queria fazer aqui é essa configuração da safe area do iOS, que é essa barra branca que está aqui. Imagine que temos que implementar essa imagem da tela de detalhes e nós não vamos utilizar a safe area, então é interessante ignorarmos para conseguirmos aproveitar toda a parte de cima da nossa tela.

[11:14] Então, já vamos fazer essa configuração. A primeira coisa que tenho que fazer é selecionar a view, então selecionei a view. Vou vir nesse ícone da folha, que é o primeiro ícone, e vou desmarcar essa opção “Use Safe Area Layout Guide”.

[11:33] Clico nesse checkbox e ele já reposiciona aqui. Mas, quando eu estou utilizando o Scroll View, eu ainda preciso fazer uma outra configuração. Vou rodar aqui para você ver.

[11:48] Vou “buildar” de novo, clico aqui. Repare que ele ainda não respeita essa configuração que nós setamos para a view. Nós precisamos fazer outra configuração para o Scroll.

[12:00] O que eu vou fazer? Vou selecionar o “Scroll View” e vou vir aqui nessa quarta opção. Na verdade, nessa opção do “Show the Size inspector”, eu tenho essa opção que é esse “Content insets”, essa opção aqui.

[12:34] Ele está “Automático”, mas podemos colocar “Never”, que é justamente a configuração que nós queremos para o Scroll View entender essa configuração da safe area que acabamos de colocar. Quando eu clico aqui, agora sim ele aproveita todo o espaço que temos aqui.

[12:57] Então, vimos aqui várias coisas interessante que vamos utilizar daqui para frente, como o uso do Scroll View. Nós combinamos o uso do Scroll View com o Stack View e também aprendemos a utilizar essas configurações para customizar a nossa view. Então, é isso que eu queria te mostrar nesse vídeo.

@@05
Configuração do StackView

Uma das técnicas de auto layout, quando trabalhamos com o UIKit, se chama constraints. Através dela conseguimos configurar regras para determinados elementos, dizendo como devem se comportar.
De acordo com o que estudamos na aula, quais condições devemos satisfazer para estar em conformidade com as regras das constraints?

Para alterar a distribuição dos elementos de forma igual, basta alterar a propriedade 'Distribution' no storyboard para: 'Fill Equally'.
 
Alternativa correta! Correto! Quando setamos a propriedade 'Distribution' para 'Fill Equally', o Stackview divide seu tamanho igualmente entre os elementos.
Alternativa correta
Para alterar a distribuição dos elementos de forma igual, basta alterar a propriedade 'Distribution' no storyboard para: 'Fill'.
 
A opção 'Fill' preenche o espaço disponível do Stackview. Se o tamanho do elemento não preenche todo seu espaço, ele estica o elemento de acordo com sua prioridade.
Alternativa correta
Podemos alterar a distribuição do tamanho do stackview de forma igual, aplicando constraints de largura com o mesmo valor nos elementos.
 
Como estamos trabalhando com Stackview, não precisamos aplicar constraints para dividir o tamanho do Stackview.

@@06
Faça como eu fiz: Criando Views de diferentes maneiras

Há diversas maneiras de construir uma nova tela. Podemos simplesmente arrastar um novo UIViewController para o storyboard e começar a utilizar essa View. Outra forma seria a utilização de Views desacopladas do storyboard, através de xib. Dessa maneira, criamos Views com um maior índice de reutilização dentro do projeto, já que ela não de um fluxo específico no storyboard. E por último, podemos criar Views programaticamente, ou seja, através de código. Nesse caso, não temos ajuda do interface builder (parte visual). Como podemos criar uma View utilizando xib?

Opinião do instrutor

Quando criamos um novo ViewController, podemos marcar a opção do Xcode criar uma View junto com a classe de ViewController.

@@07
O que aprendemos?

Nesta aula, aprendemos:
Criar novas telas
Há diferentes maneiras de se trabalhar com Views no iOS. Aprendemos duas delas, que são: o uso de storyboard e xib. A vantagem do xib em relação ao storyboard é o desacoplamento da view e a reutilização em várias partes do projeto.
Uso do UIScrollView
ScrollView é um componente muito utilizado para colocar mais elementos do que a área visível do dispositivo.

#### 01/08/2023

@04-Criando View de detalhes

@@01
Projeto da aula anterior

Se você deseja começar o curso a partir desta aula, pode fazer o download do projeto desenvolvido até o momento.

https://github.com/alura-cursos/alura-viagens-parte-II/archive/7b58edc250f7630420ab6c74fe5a7066c9360994.zip

@@02
Estrutura da tela detalhes

[00:00] Continuando a implementação da nossa tela de detalhes, no vídeo anterior, nós estudamos sobre o uso do Scroll View, e nós ilustramos isso através de um Stack View com várias views coloridas.
[00:13] Vou começar, então, apagando esse “Stack View” que nós utilizamos apenas para exemplificar e vou deixar apenas o “Scroll View” que já havia configurado.

[00:24] A partir de agora, vamos analisar a tela de detalhes do simulador para entendermos por onde vamos começar. O primeiro elemento que temos aqui em cima é uma imagem, como você pode ver, a imagem da viagem selecionada.

[00:41] Nós temos um botão “Voltar” e logo abaixo temos várias labels e ícones também. O que é importante destacarmos agora é essa margem que nós temos entre as labels, tanto na margem esquerda, leading, quando na margem esquerda trailing.

[01:02] Nós temos um valor para deixar esse espaçamento, mas isso não acontece na imagem, a imagem fica realmente bem presa à margem com o valor de 0, tanto na esquerda quanto na direita e na parte superior.

[01:19] É importante observarmos isso porque se utilizássemos, por exemplo, um Stack View e colocássemos essa imagem dentro do Stack View com espaçamento, com um valor entre a margem esquerda e direita, esse espaçamento também ocorreria na imagem, ficaria uma faixa branca.

[01:40] E nós não queremos deixar essa margem na imagem, somente nos elementos e nas labels de dentro do Stack View. Então, vamos começar criando uma view onde vamos colocar uma imagem dentro e, logo abaixo, colocamos um Stack View com o espaçamento.

[02:01] Dessa forma, o espaçamento vai ser aplicado na margem esquerda e direita de todas as labels que estiverem dentro do Stack View, e não na imagem.

[02:12] Então, vamos começar. Vou começar abrindo nossa biblioteca de elementos e vou procurar por “View”, clicar e arrastar para dentro da nossa tela. Vou alterar a altura dela para “235”, e agora vamos setar algumas constraints para prender essa view.

[02:44] Vou abrir o painel de constraints, vou prender com o valor “0”, porque queremos que a imagem não fique com nenhuma margem, tanto na esquerda quanto na direita e no topo.

[02:57] Aqui eu não vou deixar uma constraint de altura fixa, vou colocar uma constraint proporcional ao tamanho da tela. Nós falamos um pouco sobre proporcionalidade no curso anterior. Basicamente, ela nos ajuda se quisermos, por exemplo, escalar nosso projeto para iPad e tudo mais, ele não vai ter um tamanho fixo em relação à tela, ele vai ter um tamanho proporcional à tela.

[03:22] Então, nos ajuda nesse sentido. É isso que vou fazer. Aqui a “View” vou colocar um nome só para não nos perdermos ao longo do caminho porque vai ter vários elementos na nossa hierarquia. Então, “Image Viagem View”.

[03:47] Então, o que vou fazer? Vou segurar a tecla “Ctrl” do meu teclado, vou clicar e arrastar parao “Scroll View”. Tenho aqui várias opções e a opção que vou selecionar vai ser essa “Equal Widths”, então tenho que marcar essa opção.

[04:06] Isso já nos ajuda nesse sentido. E vou fazer a mesma coisa com a altura, então clico, arrasto e falo que ele tem uma altura igual à proporção da tela, no caso do Scroll View.

[04:25] Mas eu ainda tenho erro, porque não terminei de configurar a altura dos elementos que vão ficar dentro do Scroll View. Havíamos comentado que teríamos um Stack View com várias labels dentro, então é isso que vou colocar agora.

[04:44] Vou aproveitar e vou colocar um “Vertical Stack View” para terminarmos de solucionar esses problemas com as constraints. Vou clicar e vou reposicionar mais ou menos para o tamanho que quero que o meu Stack View fique, então vou clicar e redimensionar.

[05:05] Aqui, eu procuro não aplicar as constraints direto, como disse, às vezes o Scode dá uma travada, então prefiro clicar e arrastar manualmente.

[05:16] Aqui, vou deixar “0” na margem superior, “16” na margem lateral esquerda, porque nós queremos que as labels fiquem com espaçamento, “16” também na margem da direita, e “0” na margem de baixo.

[05:34] Vou clicar em “Adicionar”. Agora, o que vou fazer? Vou colocar uma label dentro do Stack View. Vou clicar, arrastar e colocar aqui, só para ele solucionar o problema da altura. Quando colocamos um elemento dentro do Stack View, ele assume a altura de acordo com o elemento que nós colocamos.

[05:56] Vou aproveitar e vou renomear essa label para começarmos a ganhar um pouco de cor nessa tela que estamos construindo. Vai ser assim, “Pacote de Viagem”. Isso aqui estamos deixando fixo porque vamos desenhar a tela, depois vamos criar os outlets e citar esses valores conforme a viagem selecionada.

[06:26] “Pacote de Viagem para Cancun All Inclusive”. Vamos aproveitar e vamos alterar a fonte, vamos utilizar aquela fonte que já estávamos utilizando, essa daqui, “Kohinoor Devanagari”.

[06:52] Também vamos alterar o estilo, vou colocar aqui “Semibold”, e o tamanho, que vai ser “21”. Vou alterar para “21”. Repara que a label não coube em uma linha só, então vamos colocar mais de uma linha através dessa opção “Lines” que temos aqui.

[07:15] No próximo passo, vou colocar uma UIImage dentro dessa view que nós criamos aqui em cima, vou setar as constraints para ela. Vou prendê-la ao topo, à esquerda, à direita e a baixo com o valor de “0”, ou seja, ela vai ficar presa.

[07:33] E, dessa forma, nós conseguimos deixar a imagem ocupando todo o espaço superior, e a label com uma margem que foi a do Stack View, quando setamos as constraints do Stack View. Então, conseguimos deixar esse espaçamento aqui.

[07:51] Vou rodar o projeto para testarmos. Clico aqui, então já estamos mostrando a label e, a seguir, nós continuamos com a implementação da imagem e dos outros elementos que temos aqui.

@@03
Empilhando elementos

[00:00] Continuando, nós vamos adicionar uma nova label, que é a label de subtítulo. Nós já temos aqui uma imagem, um título e vamos adicionar um subtítulo. Vou copiar e colar só para ganhar um pouco de tempo, vamos alterar apenas a formatação da fonte.
[00:17] Vou vir aqui, vou escolher esse tipo de fonte que é um pouco mais fina, “Kohinoor Telugu”, “Regular”, e o tamanho vai ser “14”. Vou alterar também o texto, vou colocar "Aéreo + Hospedagem”.

[00:48] Vou também setar uma imagem fixa por enquanto, enquanto nós não estamos utilizando a viagem selecionada na Table View, só para ver como está ficando a nossa view. Quando eu seto uma imagem fixa, repara que ele traz um corte tanto na esquerda quanto na direita.

[01:05] Nós podemos melhorar essa visualização mudando o “Content Mod”. Nós escolhemos a opção “Aspect Fill” e ele preenche esse espaço, como se fosse um zoom, para ocupar todo o espaço disponível.

[01:23] Vamos continuar agora colocando alguns ícones que vamos precisar utilizar para deixar nosso layout parecido com esse. Temos, aqui em cima, um botão “Voltar”, temos esse ícone do Sol, temos três ícones da hospedagem, do que está incluso, da passagem aérea.

[01:46] E esses ícones nós não temos ainda, eles vão estar disponíveis para você fazer o download nessa seção do curso, então você pode baixar sem nenhum problema. Depois você pode selecionar todos eles e pode incluir nessa pasta de “Assets”.

[02:09] Vamos voltar para a tela de detalhes. Vamos aproveitar e colocar o botão “Voltar” porque ele vai ser bem útil para testarmos e não precisarmos ficar buildando o app toda hora para voltar para a tela anterior.

[02:20] Vou procurar por “Button”, vou colocar o botão aqui. Repara que ele vem com o título escrito “Button” mesmo, então vamos tirar, vamos deixá-lo sem texto nenhum. Vou abrir aqui o menu lateral, vou apagar o título.

[02:39] E aqui nós temos uma seção de “Image”, onde podemos colocar uma imagem nesse botão. Vou procurar por “icon_back”, que é o “Voltar”, vou deixar o tamanho dele “25” por “25”, e vamos setar umas constraints aqui.

[03:03] Vou começar setando uma constraint na margem esquerda, leading, de “10”; na margem superior, “35”; e, altura e largura. Vou dar um “Add Constraint” e temos, então, um ícone na parte superior.

[03:22] Vou aproveitar e vou criar uma ação para esse botão, e também vou criar os outlets dessas labels e dessa imagem. Então, vamos lá, seleciono o elemento, clico nesse botão superior direito e venho em “Assistant”.

[03:38] Ele vai dividir a minha tela, uma parte com a view e outra parte com o ViewController, com o arquivo, com a classe. Vou criar um MARK para separar o nosso código e deixar mais organizado com os nossos IBOutlets.

[03:57] Vou criar o outlet da imagem, então vou colocar “viagemImage”, vou dar um “Connect”; com o título, clico e arrasto para cá, “tituloViagemLabel”; e com o subtítulo, que é essa label que nós acabamos de colocar aqui, “subtituloViagemLabel”, e vou dar um “Connect”.

[04:31] Vou criar um novo marcador para o nosso método viewDidLoad(), que é View life cycle, “ciclo de vida da view”, e vou criar aqui mais um marcador com os nossos Actions.

[04:42] Esses MARKs só servem para organizar o nosso código um pouco melhor. Por exemplo, se eu tivesse mais de um botão com ação, eu colocaria tudo dentro desse MARK: - Actions que eu criei aqui.

[04:58] Aqui é importante que, nessa opção “Connection”, esteja selecionada a opção “Action”. “Type” vou escolher “UIButton”, e o nome, geralmente, na maioria das vezes, nós escrevemos em inglês, mas estamos escrevendo o código em português.

[05:19] Se fosse em inglês, poderia ser “didTapBackButton”, por exemplo, ou “tapOnBackButton”, coisas desse tipo. Como estamos escrevendo em português, eu vou colocar “botaoVoltar”, e vou dar um “Connect”.

[05:43] Um ponto importante é entendermos sobre a navegação de telas mais uma vez. Quando precisamos chamar uma nova tela, nós utilizamos esse método do navigationController, chamado pushViewController.

[05:57] Mas, nós não queremos chamar um novo Controller igual ao que tínhamos agora a pouco, senão vamos instanciar mais uma vez o mesmo ViewController. Não é isso que nós queremos, nós queremos apenas voltar para o ViewController que já estava instanciado, que é a home.

[06:15] Então, quando já temos o ViewController instanciado e queremos voltar, é bem simples: nós chamamos o navigationController.popViewController, e aqui eu passo true.

[06:29] Vou rodar nosso app para testarmos, vou clicar em qualquer viagem e ele vai abrir, então, a implementação que nós acabamos de fazer. Então, temos aqui o título, o subtítulo e a imagem.

[06:51] Por enquanto, eles estão sem os espaçamentos corretos, então vão ficar bem perto um do outro, mas, conforme formos avançando, vamos corrigindo todos esses espaçamentos.

@@05
Múltiplos StackViews

[00:00] Continuando o desenvolvimento da nossa view de detalhes, nós já adicionamos o número de dias com o ícone do Sol e a tarja de desconto. Agora, vamos seguir para o preço real do pacote junto com o período de validade.
[00:18] Então, podemos separar tudo isso daqui em um único bloco para desenvolvermos juntos. O que temos que ter atenção aqui? Mais uma vez, nos deparamos com informações lado a lado, então já podemos pensar em um “Horizontal Stack View” para empilharmos elementos lado a lado.

[00:38] Só que dentro de cada “Horizontal Stack View”, também temos elementos um embaixo do outro, então podemos ter um “Horizontal Stack View” e dois “Vertical Stack View”. Um aqui e o outro aqui.

[00:53] Isso nos mostra que é possível combinarmos o uso de Stack Views para conseguirmos solucionar o nosso problema de construção de view de desenhar as nossas telas. Então, é muito comum nós utilizarmos vários Stack Views um dentro do outro, com mais elementos, enfim, e ele nos ajuda na construção das views.

[01:17] Então, é isso que vamos fazer. Vamos começar colocando mais um “Horizontal Stack View”, vou clicar e arrastar para cá. Ele vai apontar vários problemas com constraints porque nós não colocamos nenhum elemento dentro, mas não tem problema, já solucionamos isso.

[01:38] Dentro desse “Horizontal Stack View”, vou colocar dois “Vertical Stack View”, um aqui, vou dar um “Command + C” e "Command + V”, e o outro aqui. Então, é essa a estrutura que tem que ficar: “Horizontal Stack View” e, dentro dele, dois “Vertical Stack View”.

[01:58] Então, vamos começar colocando uma label para ganharmos tempo, vou clicar e arrastar para cá. Aqui, nós temos um problema com a distribuição do nosso Stack View. Mais uma vez, precisamos utilizar a distribuição de igualdade, ou seja, o número de elementos que eu colocar dentro, ele vai dividir a largura e fazer com que todos caibam lá dentro.

[02:23] Então, vou selecionar aqui esse “Fill Equally”. Com a label, agora vamos começar a trabalhar de verdade. Vou alterar o valor, então o texto vai ser “Válido para o período de:”. Então, ele vai ficar assim.

[02:44] Vou aproveitar para setar uma constraint de altura porque vamos precisar diminuir um pouco esse espaço, então vou setar uma constraint com o tamanho de “21”, e vou alterar a fonte.

[02:57] Vamos vir aqui em “Custom”, vamos utilizar aquela fonte que já estamos acostumados, essa “Telugu”, vou alterar o tamanho para “14” e vou dar um “Done” para confirmar.

[03:17] Para ganhar tempo, como já formatamos a label, vou dar um “Command + C” e um “Command + V”, e vou alterar apenas o texto, “1 de setembro a 30 de novembro”.

[03:31] E, do outro lado, vamos fazer algo parecido. Vou copiar uma label, vou colar aqui. Só precisamos ter atenção para que ele fique dentro da hierarquia do Stack View. Ele está fora, vou clicar e vou arrastar aqui para dentro.

[03:47] Vou fazer mais uma cópia, “Command + C” e “Command + V”. Agora vamos alterar os textos. Aqui, vou colocar o valor real do pacote com o desconto, “R$ 4.299”, e vou alterar a fonte. A fonte vai ser essa aqui, “Kohinoor Devanagari”, tamanho vai ser “22”.

[04:20] Vou alinhá-la à direita e vou alterar também o estilo da fonte que está “Regular”, colocar “Semibold”, e a cor, “System Orange Color”. Vamos escolher a cor laranja. Aqui embaixo vou alterar também o texto, aqui vai ser “até 12x no cartão”. Vou, novamente, alinhar à direita e vou diminuir o tamanho para “10”.

[05:03] Então, vou rodar o projeto para testarmos e vermos como ficou. Vamos subir o simulador, vou clicar em qualquer viagem. Olha que interessante, temos já um resultado bem parecido com o do nosso simulador.

[05:23] Vou só aproveitar e colocar um espaçamento entre esse Stack View que acabamos de desenvolver e essa linha divisória. Então, vamos fazer isso agora, vamos colocar um espaçamento, uma view com uma altura de “1”, uma cor cinza e outro espaçamento.

[05:45] É importante falarmos de dois aspectos. Nós conseguimos colocar um espaçamento dentro do Stack View, então, por exemplo, se eu selecionar esse Stack View principal que tem todos os elementos dentro, eu tenho aqui essa opção “Spacing”, onde posso colocar um espaçamento geral em todos os elementos.

[06:06] Vou mexer aqui, presta atenção na view, como os elementos vão se comportar. Estou clicando, repara essa label aqui, “Aéreo + Hospedagem”. Vou aumentar o espaçamento.

[06:19] Repara que está ficando com o espaço cada vez maior, mas não é somente nesse Stack View aqui, nós estamos aplicando em todos os elementos, todas as labels estão ficando com o mesmo espaçamento de “14”.

[06:35] Nesse caso, não é isso que nós queremos fazer. Vou colocar aqui um “0” para nós tirarmos o espaçamento que colocamos. O que queremos fazer é colocar um espaçamento em pontos específicos. Eu quero colocar um espaçamento aqui, na linha divisória, e outro espaçamento para separar o próximo bloco.

[06:56] Para colocarmos esse espaçamento, podemos colocar uma view com a cor de fundo e setar uma constraint de altura. Isso vai nos ajudar com o espaçamento. Olha que bacana, vou pegar uma view, vou clicar e vou arrastar para cá, e vou setar uma constraint de altura.

[07:20] Vou colocar aqui uma constraint de “10”, por exemplo, “10” de altura. Vou aplicar e nós temos aqui uma view que vai nos dar esse espaçamento que estamos precisando.

[07:35] Vou até renomear aqui para nos ajudar, “Espaçamento”. Agora, vamos colocar uma linha divisória que é mais ou menos o mesmo esquema. Vou até copiar e colar isso aqui, vou dar o “Command + C” e “Command + V”, e ao invés de “Espaçamento”, vou colocar o nome “Divisor”, que podemos utilizar em outros pontos.

[08:02] A única coisa que vou fazer é alterar a constraint de altura que está “10”, vou alterar para “1”, e também alterar a cor de fundo. Vou selecionar o “Divisor > Background” e vou escolher essa cor aqui, “System Gray 5 Color”.

[08:22] Clico aqui e coloco outro espaçamento. “Command + C” e “Command + V” e arrasto para baixo da linha divisória. Então, ficou assim: o “Stack View” que acabamos de implementar, o “Espaçamento” com altura de “10”, o “Divisor” e outro “Espaçamento”.

[08:42] Vou rodar mais uma vez o projeto para testarmos, vamos subir o simulador, clico em uma viagem. Olha que bacana, temos aqui um espaçamento e uma linha dividindo igual estamos copiando do simulador.

[09:03] Durante a aula, eu estou mostrando a fonte, o tamanho, a altura e tudo mais, mas se você trabalha já em uma empresa de desenvolvimento de apps, você já deve ter visto alguma ferramenta como Zeplin ou Figma que nos ajuda a construir esse layout.

[09:22] Geralmente, é um time de X designers que deixa todo o material pronto lá para nós podermos utilizar. Aqui, como eu já tenho as medidas, eu vou passando para vocês ao longo da aula para deixarmos o nosso projeto igual esse ao lado.

[09:40] Agora falta essa última etapa que é “O que está incluso”, com esses ícones, e a ideia é continuarmos praticando o uso do Stack View, que é um componente muito importante na criação de layout para iOS.

@@06
Entendendo erros de constraints

Conforme estudamos na aula, por padrão o UIStackView preenche seu espaço com o tamanho dos elementos que adicionamos dentro dele (dependendo da distribuição configurada).
Em um StackView com a distribuição .fill, como podemos alterar o tamanho de uma imagem colocada dentro dele?

Podemos simplesmente configurar sua altura e largura no campo Show the Size Inspector.
 
Alternativa correta
Podemos alterar a distribuição do StackView para equally.
 
Alternativa correta
Podemos configurar constraints de altura e largura na imagem.
 
Alternativa correta! Ao adicionar constraints na imagem, conseguimos configurar o tamanho do elemento.

@@07
Faça como eu fiz: StackView dentro de StackView

O uso de UIStackView é muito interessante na hora de montar o layout de um aplicativo. Nessa aula praticamos seu uso em um layout um pouco mais complexo, onde precisamos utilizar múltiplos StackViews.

Opinião do instrutor

É muito comum o uso de mais de um StackView dentro da hierarquia de Views. Ele acaba nos ajudando a empilhar elementos na horizontal e na vertical. No nosso caso, na tela de detalhes, em alguns momentos havia título de uma seção seguido de ícones na horizontal. Por isso, optamos por utilizar vertical StackView e horizontal StackView na mesma hierarquia.

@@08
O que aprendemos?

Nesta aula, aprendemos:
Distribution
Há algumas maneiras de distribuir elementos dentro do StackView. As principais são: Fill onde os elementos ocupam todo espaço disponível. E também a 'Fill equally' onde todos os elementos ocupam espaços iguais dentro do StackView.
Multiplos StackViews
Podemos fazer uso de vários StackViews para conseguir desenvolver o layout proposto. No nosso caso, na tela de detalhes discutimos essa técnica que nos auxilia empilhar elementos lado a lado ou um embaixo do outro dentro da mesma View.