class CreateMembros < ActiveRecord::Migration
  def self.up
    create_table :clientes do |t|
      t.integer  :tipo
      t.string   :codigo_convite
      t.string   :numero_agencia
      t.string   :numero_cliente
      t.string   :email
      t.string   :nome
      t.string   :telemovel
      t.string   :morada
      t.string   :c1_nome
      t.boolean  :c1_tipo
      t.string   :c1_transporte
      t.boolean  :c1_alojamento
      t.string   :c2_nome
      t.boolean  :c2_tipo
      t.string   :c2_transporte
      t.boolean  :c2_alojamento
      t.string   :c3_nome
      t.boolean  :c3_tipo
      t.string   :c3_transporte
      t.boolean  :c3_alojamento
      t.integer  :adultos_int            , :default => 0
      t.string   :adultos_transporte
      t.boolean  :adultos_alojamento
      t.integer  :criancas_int           , :default => 0
      t.string   :criancas_transporte
      t.boolean  :criancas_alojamento
      t.string   :aux

      t.timestamps
    end
  end

  def self.down
    drop_table :clientes
  end
end
