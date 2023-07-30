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

@02-Utilizando UIStackView

@@01
Projeto da aula anterior
PRÓXIMA ATIVIDADE

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
PRÓXIMA ATIVIDADE

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
PRÓXIMA ATIVIDADE

Nessa aula, introduzimos o assunto principal do curso que é o uso do UIStackView. Com ele podemos fácilmente empilhar elementos tanto na horizontal quanto na vertical. Esse componente pode ser utilizado sempre que você precisar colocar elementos um embaixo do outro ou lado a lado. Como podemos adicionar um UIStackView?

Opinião do instrutor

Para adicionar um StackView na View, devemos abrir a biblioteca de elementos no interface builder e arrastar um novo StackView para dentro do local que estamos trabalhando. Logo em seguida, precisamos aplicar as constraints no StackView.

@@08
O que aprendemos?
PRÓXIMA ATIVIDADE

Nesta aula, aprendemos:
Uso do StackView
O StackView permite que você aproveite o poder do Auto Layout, criando interfaces de usuário que podem se adaptar dinamicamente à orientação do dispositivo, ao tamanho da tela e qualquer alteração disponível no espaço disponível.