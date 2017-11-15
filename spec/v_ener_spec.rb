#encoding: UTF-8
require 'spec_helper'
require './lib/v_energetico/energia'
require './lib/v_energetico/lista'


describe Energia do 
    before :each do
   
      @Huevo_frito = Grupo_alimentos.new("Huevo frito", 14.1, 0.0, 19.5,"Huevos, lacteos y helados")
      @Leche_vaca  = Grupo_alimentos.new("Leche vaca", 3.3, 4.8, 3.2,"Huevos, lacteos y helados")
      @Yogurt      = Grupo_alimentos.new("Yogurt", 3.8, 4.9, 3.8,"Huevos, lacteos y helados")
      @Cerdo       = Grupo_alimentos.new("Cerdo", 21.5, 0.0, 6.3, "Carnes y derivados")
      @Ternera     = Grupo_alimentos.new("Ternera", 21.1, 0.0, 3.1, "Carnes y derivados")
      @Pollo       = Grupo_alimentos.new("Pollo", 20.6, 0.0, 5.6, "Carnes y derivados")
      @Bacalao     = Grupo_alimentos.new("Bacalao", 17.7, 0.0, 0.4, "Pescados y mariscos")
      @Atun        = Grupo_alimentos.new("Atún", 21.5, 0.0, 15.5, "Pescados y mariscos")
      @Salmon      = Grupo_alimentos.new("Salmón", 19.9, 0.0, 13.6, "Pescados y mariscos")
      @Aceite_oliva= Grupo_alimentos.new("Aceite de oliva", 0.0, 0.2, 99.6, "Alimentos grasos")
      @Mantequilla = Grupo_alimentos.new("Mantequilla", 0.7, 0.0, 83.2, "Alimentos grasos")
      @Chocolate   = Grupo_alimentos.new("Chocolate", 5.3, 47.0, 30.0, "Alimentos grasos")
      @Azucar      = Grupo_alimentos.new("Azúcar", 0.0, 99.8, 0.0, "Alimentos ricos en carbohidratos")
      @Arroz       = Grupo_alimentos.new("Arroz", 6.8, 77.7, 0.6, "Alimentos ricos en carbohidratos")
      @Lentejas    = Grupo_alimentos.new("Lentejas", 23.5, 52.0, 1.4, "Alimentos ricos en carbohidratos")
      @Papas       = Grupo_alimentos.new("Papas", 2.0, 15.4, 0.1, "Alimentos ricos en carbohidratos")
      @Tomate      = Grupo_alimentos.new("Tomate", 1.0, 3.5, 0.2, "Verduras y Hortalizas")
      @Cebolla     = Grupo_alimentos.new("Cebolla", 1.3, 5.8, 0.3, "Verduras y Hortalizas")
      @Calabaza    = Grupo_alimentos.new("Calabaza", 1.1, 4.8, 0.1, "Verduras y Hortalizas")
      @Manzana     = Grupo_alimentos.new("Manzana", 0.3, 12.4, 0.4, "Frutas")
      @Platanos    = Grupo_alimentos.new("Plátanos", 1.2, 21.4, 0.2, "Frutas")
      @Pera        = Grupo_alimentos.new("Pera", 0.5, 12.7, 0.3, "Frutas")
     end
     
    describe "Expectativas" do
         
        
          it "Comprobando la clase de un objeto" do
            expect(@Huevo_frito.class).to eq(Grupo_alimentos)
          end
          
          it "Comprobando is_a" do
            expect(@Huevo_frito.is_a? Energia).to eq(true)
          end
          
          it "La jerarquia de un objeto" do
            expect(@Huevo_frito.kind_of? Energia).to eq(true)
          end
          
    end
   
  end
  
  describe Lista do
            
    before :each do
      @list = Lista.new()
      #@list3 = Lista.new()
      @huevo_f = Energia.new("Huevo Frito", 14.1, 0.0, 19.5)
      @chocolate = Energia.new("Chocolate", 5.3, 47.0, 30.0)
    end
    
    it "Existe una lista con su cabeza y con su cola" do
      expect(@list.inicio.value).to eq(nil)
      expect(@list.final.value).to eq(nil)
    end
    
    it "Comprobamos que la lista está vacía" do
      expect(@list.size).to eq(0)
    end
  
    it "Se puede insertar un elemento en la lista" do
      @list.insert_single(@huevo_f)
      expect(@list.inicio.value).to eq(@huevo_f) 
      expect(@list.size).to eq(1)
      
    end
    
    it "Se extrae el primer elemento de la lista" do
      @list.insert_single(@huevo_f)
      expect(@list.extract_beg()).to eq("\t\t   Proteínas\tGlúcidos\tLípidos\nHuevo Frito\t\t14.1\t\t0.0\t\t19.5\n")
    end
    
    it "Se puede extraer el último elemento de la lista" do
      @list.insert_single(@huevo_f)
      expect(@list.extract_end()).to eq("\t\t   Proteínas\tGlúcidos\tLípidos\nHuevo Frito\t\t14.1\t\t0.0\t\t19.5\n")
    end
    
    it "Se pueden insertar varios elementos" do
      valor=[1,@huevo_f,2,@chocolate]
      valor.each do |i|
        @list.insert_single("#{i}")
    end
    
    expect(@list.size).to eq(4)
    expect(@list.extract_end()).to eq("1")
    expect(@list.extract_beg()).to eq("\t\t   Proteínas\tGlúcidos\tLípidos\nChocolate\t\t5.3\t\t47.0\t\t30.0\n")
    expect(@list.size).to eq(2)
    expect(@list.extract_end()).to eq("\t\t   Proteínas\tGlúcidos\tLípidos\nHuevo Frito\t\t14.1\t\t0.0\t\t19.5\n")
  end
  
  describe "Probando enumerable" do
       
     it "Maximo" do
       @list3.insert_single(1)
       @list3.insert_single(2)
       @list3.insert_single(3)
      expect(@list3.max).to eq(3)
     end
     it "Minimo" do
       @list3.insert_single(1)
       @list3.insert_single(2)
       @list3.insert_single(3)
       expect(@list3.min).to eq(1)
     end
     it "Ordenar" do
       @list3.insert_single(1)
       @list3.insert_single(3)
       @list3.insert_single(2)
       expect(@list3.sort).to eq([1,2,3])
     end
     
     it "Detectar" do
       @list3.insert_single(1)
       @list3.insert_single(3)
       @list3.insert_single(4)
       @list3.insert_single(2)
       expect(@list3.detect{ |i| i.between?(1,2)}).to eq(1)
     end
   end
  end