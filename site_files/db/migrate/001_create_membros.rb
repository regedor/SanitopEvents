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
      t.boolean  :c1_transporte
      t.boolean  :c1_alojamento
      t.string   :c2_nome
      t.boolean  :c2_tipo
      t.boolean  :c2_transporte
      t.boolean  :c2_alojamento
      t.string   :c3_nome
      t.boolean  :c3_tipo
      t.boolean  :c3_transporte
      t.boolean  :c3_alojamento
      t.string   :aux
      t.integer  :up_crianca 
      t.integer  :up_adulto 
      t.string   :up_alojamento
      t.string   :up_transporte

      t.timestamps
    end
  end

  def self.down
    drop_table :clientes
  end
end
