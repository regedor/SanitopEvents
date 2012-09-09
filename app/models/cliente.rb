# -*- coding: utf-8 -*-
class Cliente < ActiveRecord::Base

  validates_uniqueness_of :codigo_convite, :message => "este convite parece já ter sido utilizado"
  validates_presence_of :numero_cliente, :message => "o número de cliente não pode estar em branco"
  validates_presence_of :numero_agencia, :message => "o número da loja não pode estar em branco"
  validates_format_of   :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :message => "tem de introduzir um email válido"
  validates_format_of   :telemovel, :with => /^9[0-9]{8}$/i, :message => "o telemovel introduzido é inválido"		      
  validates_presence_of :c1_nome, :message => "deve inscrever pelo menos um convidado"

  def convidado(numero)
    case numero
      when 1
        return Convidado.new(self,1) unless self.c1_nome.blank? 	   
      when 2
        return Convidado.new(self,2) unless self.c2_nome.blank? 	   
      when 3
        return Convidado.new(self,3) unless self.c3_nome.blank? 	   
    end
    return nil
  end    

  def convidados
    [self.convidado(1), self.convidado(2),self.convidado(3)].compact
  end

  def nr_de_convidados
    self.convidados.compact.size + self.adultos_int + self.criancas_int
  end

  def nr_de_convidados_adultos
    convidados.select do |convidado|
      not convidado.tipo
    end.size + self.adultos_int
  end

  def nr_de_convidados_nao_adultos
    nr_de_convidados - nr_de_convidados_adultos
  end

  def nr_de_convidados_alojamento
    convidados.select do |convidado|
      convidado.alojamento
    end.size.+ ((self.adultos_alojamento and self.adultos_int) ? self.adultos_int : 0 ).+(
                (self.criancas_alojamento and self.criancas_int) ? self.criancas_int : 0 )
  end

  def nr_de_convidados_adultos_alojamento
    convidados.select do |convidado|
      convidado.alojamento and (not convidado.tipo)
    end.size.+ ((self.adultos_alojamento and self.adultos_int) ? self.adultos_int : 0 )
  end

  def nr_de_convidados_nao_adultos_alojamento
    nr_de_convidados_alojamento - nr_de_convidados_adultos_alojamento
  end

  def nr_de_convidados_transporte_all
    convidados.select do |convidado|
      not convidado.transporte.blank?
    end.size.+ (self.adultos_transporte ? self.adultos_int : 0 ).+(
                self.criancas_transporte ? self.criancas_int : 0 )
  end

  def nr_de_convidados_transporte(local)
    convidados.select do |convidado|
      convidado.transporte == local
    end.size.+ (self.adultos_transporte == local ? self.adultos_int : 0 ).+(
                self.criancas_transporte == local ? self.criancas_int : 0 )
  end
  
  def self.human_attribute_name(attribute); ""; end

protected

  def validate
    codigo_convite =~ /(\d+)(.\d)(\d+)/
    unless numero_cliente.to_i*4 == $3.to_i and numero_agencia.to_i*4 == $1.to_i and ["Y1","Z2","X3","B4","C5","L6"].include? $2
      errors.add("codigo_convite","o convite não parece corresponder ao cliente") 
    end
  end
end
