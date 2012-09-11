# -*- coding: utf-8 -*-
class ConvidadosController < ApplicationController

  before_filter :login_required
  # GET /membros
  # GET /membros.xml
	
  def index
    @convidados = Convidado.find_all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @convidados }
    end
  end

  # GET /membros/1
  # GET /membros/1.xml
  def show
    @convidados = Convidado.find_all_by_tipo(params[:id])

    respond_to do |format|
      format.html { render :action => "index" }
      format.xml  { render :xml => @convidados }
    end
  end

  # GET /membros/new
  # GET /membros/new.xml
  def new
    @membro = Membro.new
    @tipo = str2tipo(params[:xpto])
    
    case @tipo
      when 10
	      @sub_titulo = "4 de Outubro, sábado"
      when 11
	      @sub_titulo = "4 de Outubro, sábado"
      when 20
	      @sub_titulo = "3 de Outubro, sexta-feira"
      when 21
	      @sub_titulo = "3 de Outubro, sexta-feira"
    end
    

    respond_to do |format|
      format.html { 
        if @tipo==0 
          flash[:notice]="Endereço incorrecto!"
          redirect_to membros_path(params[:xpto])
        end}
          # new.html.erb
      format.xml  { render :xml => @membro }
    end
  end

  # GET /membros/1/edit
  def edit
    @membro = Membro.find(params[:id])
  end

  # POST /membros
  # POST /membros.xml
  def create
    @membro = Membro.new(params[:membro])
    @membro.tipo = str2tipo(params[:xpto])


@tipo = str2tipo(params[:xpto])
    
    case @tipo
      when 10
	      @sub_titulo = "4 de Outubro, sábado"
      when 11
	      @sub_titulo = "4 de Outubro, sábado"
      when 20
	      @sub_titulo = "3 de Outubro, sexta-feira"
      when 21
	      @sub_titulo = "3 de Outubro, sexta-feira"
    end


    @membro.c1_transporte = false unless @membro.c1_transporte
    @membro.c2_transporte = false unless @membro.c2_transporte
    @membro.c3_transporte = false unless @membro.c3_transporte
    @membro.c1_alojamento = false unless @membro.c1_alojamento
    @membro.c2_alojamento = false unless @membro.c2_alojamento
    @membro.c3_alojamento = false unless @membro.c3_alojamento

    respond_to do |format|
      if @membro.save
        format.html { redirect_to sucess_path }
        format.xml  { render :xml => @membro, :status => :created, :location => @membro }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @membro.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /membros/1
  # PUT /membros/1.xml
  def update
    @membro = Membro.find(params[:id])

    respond_to do |format|
      if @membro.update_attributes(params[:membro])
        flash[:notice] = 'Actualizado com sucesso.'
        format.html { redirect_to(membro_path(params[:xpto],@membro)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @membro.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /membros/1
  # DELETE /membros/1.xml
  def destroy

    @membro = Membro.find(params[:id])
    @membro.destroy

    respond_to do |format|
      format.html { redirect_to(membros_url) }
      format.xml  { head :ok }
    end
  end

end
