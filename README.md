# Undershows 📱🎸

Aplicativo iOS do **Undershows**, projeto que divulga shows underground de metal, punk e hardcore no Brasil todo — direto no seu bolso!

O app carrega o site [https://shows.undershows.com.br](https://shows.undershows.com.br) em formato mobile e responsivo, com suporte a atualização de cartazes frequente.

---

## 📦 Sobre o projeto

- Desenvolvido com **Xcode + SwiftUI**
- Utiliza **WKWebView** para exibir o site Undershows
- Tela de carregamento (LaunchScreen) personalizada
- Ícone próprio baseado no logo do projeto
- Navegação bloqueada para modo retrato (portrait only)
- Suporte a zoom, rolagem e fallback para mensagem offline

---

## 🚀 Status

Depois de muitas tentativas junto a Apple, desistimos, todos ajustes foram em vão, eles não aceitam web content.

Quem quiser instalar via método PWA vai funcionar

1) Abra o Safari pelo iPhone;
2) Digite https://shows.undershows.com.br;
3) Clique em Compartilhar e depois em Área de Trabalho;
4) Pronto, o app está instalado no teu iPhone, quando você abrir pelo ícone da Undershows na área de trabalho, ele abrirá em tela cheia, igual qualquer outro app.

---

## 🛠️ Como abrir o projeto

1. Instale o Xcode (versão 15 ou superior recomendada)
2. Clone este repositório:

```bash
git clone git@github.com:undershows/ios.git
cd ios
```

3. Abra o projeto pelo Xcode através do arquivo Undershows.xcodeproj

4. Execute em um simulador ou dispositivo real (mínimo iOS 16)

## 📁 Estrutura de pastas

```
Undershows/
 ├── Assets.xcassets/        # Ícones, cores e splash screen
 ├── ContentView.swift       # Componente principal com o WebView
 ├── UndershowsApp.swift     # Arquivo @main da aplicação
 ├── LaunchScreen.storyboard # Tela inicial do app
 └── Undershows.xcodeproj    # Projeto Xcode
```

---

## 📜 Licença

Pode fazer fork a vontade, contribuir, compartilhar — e apoiar a cena independente.\
Copyleft!\
A/E 🖤
