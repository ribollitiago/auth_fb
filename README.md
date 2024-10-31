# app-club

Um aplicativo para uma empresa de "Clube de benefícios" com foco em consultas médicas, foi desenvolvido inicialmente por nós, juntamente ao sistema interno [web-club](https://github.com/GabrielFMA/web-club), mas depois foi vendido para ser continuado pelos desenvolvedores da empresa.

## 🛠️ Construído com

* [Flutter](https://flutter.dev/) - Framework
* [Firebase](https://firebase.google.com/) - Banco de Dados
* [ViaCep](https://viacep.com.br) - API para a pesquisa de CEP
* [MobX](https://mobx.pub/) - Gerenciamento de estado reativo

### Organização e Gerenciamento de Estado com MobX

Para manter o código organizado e escalável, este projeto utiliza o [MobX](https://pub.dev/packages/mobx) como base para gerenciamento de estado. O MobX é uma biblioteca que permite a implementação de um padrão de programação reativa, facilitando o gerenciamento de estados complexos de maneira previsível e fluida. 

Com o MobX, foi possível separar e organizar o código em **stores** (repositórios de estado), que armazenam o estado da aplicação e permitem uma sincronização em tempo real das mudanças de estado com a interface do usuário. Esse modelo reativo simplifica o acompanhamento de estados em diferentes telas e componentes, proporcionando uma arquitetura mais modular e fácil de manter.

# Telas
Detalhes das telas desenvolvidas no aplicativo.

## Tela Inicial
Tela que é carregada ao entrar no aplicativo pela primeira vez.

<img src="https://github.com/user-attachments/assets/5bdea62f-969c-4d86-828d-d0733326537a" width="300" alt="Tela Inicial" />

## Login
Tela de login, utilizamos o FirebaseAuth para o Login dos usuários, juntamente com os tratamentos de erros.

<img src="https://github.com/user-attachments/assets/d7aa3320-cc86-4f02-a124-ec95e72569f4" width="300" alt="Login" />

## Cadastro
Tela de cadastro com implementação da ViaCep para facilitar o cadastro do endereço do cliente.

<img src="https://github.com/user-attachments/assets/9300e25d-b3c4-4ffa-ac38-e43cfc0c0bf1" width="300" alt="Cadastro" /> <img src="https://github.com/user-attachments/assets/dd5f6b53-d041-4de5-9591-34a1de8dc617" width="300" alt="Cadastro 2" />

## Home
Tela home resgatando os dados do Firestore, e atualizando em tempo real os "parceiros" cadastrados no [web-club](https://github.com/GabrielFMA/web-club).

<img src="https://github.com/user-attachments/assets/e266d730-1f50-4ad4-93ca-e9d23f9dbb90" width="300" alt="Home" />

## 📡 API

Este projeto integra-se com a [API ViaCep](https://viacep.com.br) para consulta de CEPs, permitindo preenchimento automático do endereço durante o cadastro dos usuários. A API é gratuita e fornece informações detalhadas de endereço a partir do CEP informado, facilitando o processo de cadastro e melhorando a experiência do usuário.

## 📌 Versão

(Projeto finalizado) Última versão projetada por nós.

## ✒️ Autores

[Tiago Ribolli](https://gist.github.com/ribollitiago) e [Gabriel Figueiredo](https://gist.github.com/GabrielFMA)

---
⌨️ por [Tiago Ribolli](https://gist.github.com/ribollitiago)
