# -*- coding: utf-8 -*-
require 'fastercsv'

class ClientesController < ApplicationController
  before_filter :login_required, :except => [ :new, :create, :sucess]
  
#User

  def new
    if params[:code]
      params[:cliente] = {}
      params[:cliente][:codigo_convite] = params[:code]
      create
    else
      @cliente = Cliente.new
      render :home
    end
  end

  def create
    @cliente = Cliente.new(params[:cliente])
    if @cliente.codigo_convite == "forumsanitop2010admin"
      session[:login] = Time.now
      redirect_to :action => 'index'
    elsif not @cliente.codigo_convite =~ /(\d+)([A-Z]\d)(\d+)/
      flash[:notice] = "O codigo do convite é inválido"
      render :home 
    else
      @cliente.tipo = $2[1..1]
      @cliente.numero_agencia = ($1.to_i / 4).to_s
      define_title
      if params[:cliente].size < 2
        render :new
      else
        @cliente.c1_transporte ||= false
        @cliente.c2_transporte ||= false
        @cliente.c3_transporte ||= false
        @cliente.c1_alojamento ||= false
        @cliente.c2_alojamento ||= false
        @cliente.c3_alojamento ||= false
        if @cliente.save
          redirect_to sucess_path
        else
          render :new
        end
      end
    end
  end

  def suceess
  end


# Admin

  def index
    @clientes = Cliente.find(:all)
    respond_to do |format|
      format.html # index.html.erb
      format.csv  { 
        filename = I18n.l(Time.now, :format => :short) + "-forum_2010_clientes.csv"
        content  = FasterCSV.generate(:col_sep => "\t") do |tsv|
          tsv << %w/Id Tipo Nr_Loja Nr_Cliente Nome Telemovel Email Adultos Criancas 
                    Transporte_Faro Transporte_Lisboa Transporte_Brangança Transporte_Viseu Alojamento_adultos Alojamento_Crianças/  
          @clientes.each do |cliente|
            tsv << [
              cliente.id,
              cliente.tipo,
              cliente.numero_agencia,
              cliente.numero_cliente,
              cliente.nome,
              cliente.telemovel,
              cliente.email,
              cliente.nr_de_convidados_adultos,
              cliente.nr_de_convidados_nao_adultos,
              cliente.nr_de_convidados_transporte("Faro"),
              cliente.nr_de_convidados_transporte("Lisboa"),
              cliente.nr_de_convidados_transporte("Bragança"),
              cliente.nr_de_convidados_transporte("Viseu"),
              cliente.nr_de_convidados_adultos_alojamento,
              cliente.nr_de_convidados_nao_adultos_alojamento,
            ]
          end
        end
        content  = "\377\376" + Iconv.conv("utf-16le", "utf-8", content)
        send_data content, :filename => filename, :type => "text/plain", :disposition => 'attachment'
      }
    end
  end

  def show
    @cliente = Cliente.find(params[:id])
  end

  def edit
    @cliente = Cliente.find(params[:id])
    define_title
  end

  def update
    @cliente = Cliente.find(params[:id])
    define_title
    if @cliente.update_attributes(params[:cliente])
      flash[:notice] = 'Actualizado com sucesso'
      redirect_to :action => 'index'
    else
      render :edit
    end
  end

  def destroy
    @cliente = Cliente.find(params[:id])
    @cliente.destroy
    redirect_to(clientes_url)
  end

 protected
 def define_title
   case @cliente.tipo
     when 1,2,3
       @sub_titulo = "8 de Outubro, sexta-feira"
     when 4,5,6
       @sub_titulo = "9 de Outubro, sábado"
   end
 end

end
