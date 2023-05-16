class Question {
  final int id, answer;
  final String question;
  final List<String> options;

  Question(
      {required this.id,
      required this.question,
      required this.answer,
      required this.options});
}

const List sampleData = [
  {
    "id": 1,
    "question": "De quem é a famosa frase “Penso, logo existo”?",
    "options": ['Platão', 'Descartes', 'Sócrates', 'Galileu Galilei'],
    "answer_index": 3,
  },
  {
    "id": 2,
    "question":
        "Qual o nome do presidente do Brasil que ficou conhecido como Jango?",
    "options": [
      'Jânio Quadros',
      'Jacinto Anjos',
      'Getúlio Vargas',
      'João Goulart'
    ],
    "answer_index": 4,
  },
  {
    "id": 3,
    "question": "Qual o livro mais vendido no mundo a seguir à Bíblia?",
    "options": [
      'O Senhor dos Anéis',
      'Dom Quixote',
      'O Pequeno Príncipe',
      'Nárnia'
    ],
    "answer_index": 2,
  },
  {
    "id": 4,
    "question":
        "Atualmente, quantos elementos químicos a tabela periódica possui?",
    "options": ['113', '109', '108', '118'],
    "answer_index": 3,
  },
];
