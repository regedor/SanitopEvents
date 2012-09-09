# -*- coding: utf-8 -*-
class Convidado
  attr_accessor :id_cliente, :numero_cliente, :empresa, :nome, :tipo, :transporte, :alojamento

  def initialize(cliente, id_convidado)
    self.numero_cliente = cliente.numero_cliente
    self.id_cliente     = cliente.id
    self.empresa        = cliente.nome
    case id_convidado
      when 1
        self.nome           = cliente.c1_nome
        self.tipo           = cliente.c1_tipo
        self.transporte     = cliente.c1_transporte
        self.alojamento     = cliente.c1_alojamento
      when 2
        self.nome           = cliente.c2_nome
        self.tipo           = cliente.c2_tipo
        self.transporte     = cliente.c2_transporte
        self.alojamento     = cliente.c2_alojamento
      when 3
        self.nome           = cliente.c3_nome
        self.tipo           = cliente.c3_tipo
        self.transporte     = cliente.c3_transporte
        self.alojamento     = cliente.c3_alojamento
    end
  end

  def self.find_all_by_tipo(tipo)
    Cliente.find_all_by_tipo(tipo).collect(&:convidados).flatten
  end

  def self.find_all
    Cliente.find(:all).collect(&:convidados).flatten
  end

end	
