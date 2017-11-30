#encoding: UTF-8
require 'spec_helper'
require './lib/v_energetico/energia'
require './lib/v_energetico/lista'
require "benchmark"


describe Energia do 
    before :each do
      
      @Huevo_frito = Energia.new("Huevo frito", 14.1, 0.0, 19.5)
      @Leche_vaca  = Energia.new("Leche vaca", 3.3, 4.8, 3.2)
      @Yogurt      = Energia.new("Yogurt", 3.8, 4.9, 3.8)
      @Cerdo       = Energia.new("Cerdo", 21.5, 0.0, 6.3)
      @Ternera     = Energia.new("Ternera", 21.1, 0.0, 3.1)
      @Pollo       = Energia.new("Pollo", 20.6, 0.0, 5.6)
      @Bacalao     = Energia.new("Bacalao", 17.7, 0.0, 0.4)
      @Atun        = Energia.new("Atún", 21.5, 0.0, 15.5)
      @Salmon      = Energia.new("Salmón", 19.9, 0.0, 13.6)
      @Aceite_oliva= Energia.new("Aceite de oliva", 0.0, 0.2, 99.6)
      @Chocolate   = Energia.new("Chocolate", 5.3, 47.0, 30.0)
      @Azucar      = Energia.new("Azúcar", 0.0, 99.8, 0.0)
      @Arroz       = Energia.new("Arroz", 6.8, 77.7, 0.6)
      @Lentejas    = Energia.new("Lentejas", 23.5, 52.0, 1.4)
      @Papas       = Energia.new("Papas", 2.0, 15.4, 0.1)
      @Tomate      = Energia.new("Tomate", 1.0, 3.5, 0.2)
      @Cebolla     = Energia.new("Cebolla", 1.3, 5.8, 0.3)
      @Manzana     = Energia.new("Manzana", 0.3, 12.4, 0.4)
      @Platanos    = Energia.new("Plátanos", 1.2, 21.4, 0.2)
      @Compota     = Energia.new("Compota", 1.3, 24.5, 0.0)
     end
     
    describe "Expectativas" do
         
         it "Estan los nombres de los alimentos" do
            expect(@Huevo_frito.alimento).to eq("Huevo frito") 
          end
          
          it "Proteinas de los alimentos" do
            expect(@Yogurt.proteinas).to eq(3.8)
          end
          
          it "Glúcidos de los alimentos" do
            expect(@Yogurt.glucidos).to eq(4.9)
          end
          
          it "Lípidos de los alimentos" do
            expect(@Yogurt.lipidos).to eq(3.8)
          end
  
          it "Alimentos formateados" do
            expect(@Yogurt.to_s).to eq("\t\t   Proteínas\tGlúcidos\tLípidos\nYogurt\t\t3.8\t\t4.9\t\t3.8\n")
          end
          
          it "Se comprueba el índice glucémico(IG) de la compota "do
        compota = [[6.7, 6.5, 6.8, 6.9, 7.0, 7.1, 6.9, 6.9, 6.9, 6.7, 6.9, 7.3, 7.0, 7.0, 7.2, 7.1, 6.8, 7.2, 7.3, 7.0, 6.8, 6.7, 6.8, 6.7, 6.9], [4.6, 4.8, 5.3, 5.6, 6.1, 6.5, 6.6, 7.0, 7.0, 6.8, 6.4, 6.3, 6.1, 6.1, 6.2, 6.0, 6.1, 6.1, 6.2, 6.3, 6.4, 6.1, 6.1, 5.7, 5.9]]
        glucosa = [[4.9, 5.3, 5.9, 6.7, 7.2, 7.6, 8.0, 8.2, 8.2, 8.4, 8.3, 8.3, 8.0, 7.5, 7.1, 6.8, 6.8, 6.9, 6.8, 6.3, 6.2, 6.3, 6.2, 6.3, 6.1], [6.3, 5.4, 5.6, 5.7, 6.5, 7.4, 7.9, 7.4, 7.7, 7.9, 7.9, 7.8, 7.8, 7.8, 8.0, 8.5, 9.4, 10.8, 10.5, 9.1, 8.9, 8.3, 7.7, 7.6, 7.5]]
        expect(@Compota.indice_glucemico(compota, glucosa)).to eq(54.499780077077745)
      end
        
          
    end
    
  end
  
  describe Lista do
            
    before :each do
      @list = Lista.new()
      @list3 = Lista.new()
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
  
  describe Grupo_alimentos do   
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
    
    describe "expectativas" do
    
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
  
  describe "Comparable" do 
           
      it "Igualdad entre menús" do
          expect(@Huevo_frito < (@Leche_vaca)).to eq(false)
          expect(@Huevo_frito == (@Leche_vaca)).to eq(false)
          expect(@Huevo_frito > (@Leche_vaca)).to eq(true)
      end
      
    end
    
    context "Usando Benchmark" do
      it "Comprobando los métodos de ordenación" do
        #array_alimentos = [@Huevo_frito, @Leche_vaca, @Yogurt]
        #array_num = [3,4,2,1]
        #expect(array_alimentos.method_for).to eq([@Leche_vaca, @Yogurt, @Huevo_frito])
        #expect(array_num.method_for).to eq([1,2,3,4])
        #expect(array_alimentos.method_each).to eq([@Leche_vaca, @Yogurt, @Huevo_frito])
        #expect(array_alimentos.sort).to eq([@Leche_vaca, @Yogurt, @Huevo_frito])
        array_completo=[@Huevo_frito, @Leche_vaca, @Yogurt, @Cerdo, @Ternera, @Pollo, @Bacalao, @Atun, @Salmon, @Aceite_oliva, @Mantequilla, @Chocolate, @Azucar, @Arroz, @Lentejas, @Papas, @Tomate, @Cebolla, @Calabaza, @Manzana, @Platanos, @Pera]
        #n = 50000
        Benchmark.bm(1) do |x|
          x.report("Método for")   { array_completo.method_for}
          x.report("Método each")  { array_completo.method_each }
          x.report("Método sort")  { array_completo.sort}
        end
    end
  end
  
end