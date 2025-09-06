Task.destroy_all

Task.create!([
  { nome: "Reforma da fachada", inicio: "2024-02-21", conclusao: "2024-04-21", custo_estimado: 10000.00, status: "Em andamento" },
  { nome: "Manutenção do elevador", inicio: "2024-05-10", conclusao: "2024-05-12", custo_estimado: 2500.50, status: "Pendente" },
  { nome: "Pintura do hall de entrada", inicio: "2024-01-15", conclusao: "2024-01-30", custo_estimado: 5000.00, status: "Concluído" }
])

if Task.any?
  Task.first.comments.create!(author: "Síndico", content: "Esta é a principal prioridade para este trimestre.")
end

puts "Dados de exemplo criados com sucesso!"