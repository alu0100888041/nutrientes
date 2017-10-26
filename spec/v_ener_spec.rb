require 'spec_helper'
require 'lib/V_energetico/energia'


describe Energia do 
    before :each do
    x=["Huevo frito","Leche vaca", "Yogurt", "Cerdo","Ternera","Pollo","Bacalao","Atún","Salmón","Aceite de oliva","Chocolate","Azúcar","Arroz","Lentejas","Papas","Tomate","Cebolla","Manzana","Plátanos"]
    y=[14.1,3.3,3.8,21.5,21.1,20.6,17.7,21.5,19.9,0.0,5.3,0.0,6.8,23.5,2.0,1.0,1.3,0.3,1.2]
    z=[0.0,4.8,4.9,0.0,0.0,0.0,0.0,0.0,0.0,0.2,47.0,99.8,77.7,52.0,15.4,3.5,5.8,12.4,21.4]
    t=[19.5,3.2,3.8,6.3,3.1,5.6,0.4,15.5,13.6,99.6,30.0,0.0,0.6,1.4,0.1,0.2,0.3,0.4,0.2]
    @tabla_alimentos =Energia.new(x,y,z,t)
    
  end
          describe "expectativas" do
         
        
          it "Estan los nombres de los alimentos" do
            expect(@tabla_alimentos.get_nombre).to eq("Huevo frito\nLeche vaca\nYogurt\nCerdo\nTernera\nPollo\nBacalao\nAtún\nSalmón\nAceite de oliva\nChocolate\nAzúcar\nArroz\nLentejas\nPapas\nTomate\nCebolla\nManzana\nPlátanos\n")
          end
          
          it "Estan las proteinas de los alimentos" do
            expect(@tabla_alimentos.get_proteinas).to eq("14.1\n3.3\n3.8\n21.5\n21.1\n20.6\n17.7\n21.5\n19.9\n0.0\n5.3\n0.0\n6.8\n23.5\n2.0\n1.0\n1.3\n0.3\n1.2\n")
          end
          
          it "Estan los glúcidos de los alimentos" do
            expect(@tabla_alimentos.get_glucidos).to eq("0.0\n4.8\n4.9\n0.0\n0.0\n0.0\n0.0\n0.0\n0.0\n0.2\n47.0\n99.8\n77.7\n52.0\n15.4\n3.5\n5.8\n12.4\n21.4\n")
          end
          
          it "Estan los lípidos de los alimentos" do
            expect(@tabla_alimentos.get_lipidos).to eq("19.5\n3.2\n3.8\n6.3\n3.1\n5.6\n0.4\n15.5\n13.6\n99.6\n30.0\n0.0\n0.6\n1.4\n0.1\n0.2\n0.3\n0.4\n0.2\n")
          end
          
          it "Estan los alimentos formateados" do
            expect(@tabla_alimentos.to_s).to eq("\t\t   Proteínas\tGlúcidos\tLípidos\nHuevo frito\t\t14.1\t\t0.0\t\t19.5\nLeche vaca\t\t3.3\t\t4.8\t\t3.2\nYogurt\t\t3.8\t\t4.9\t\t3.8\nCerdo\t\t21.5\t\t0.0\t\t6.3\nTernera\t\t21.1\t\t0.0\t\t3.1\nPollo\t\t20.6\t\t0.0\t\t5.6\nBacalao\t\t17.7\t\t0.0\t\t0.4\nAtún\t\t21.5\t\t0.0\t\t15.5\nSalmón\t\t19.9\t\t0.0\t\t13.6\nAceite de oliva\t\t0.0\t\t0.2\t\t99.6\nChocolate\t\t5.3\t\t47.0\t\t30.0\nAzúcar\t\t0.0\t\t99.8\t\t0.0\nArroz\t\t6.8\t\t77.7\t\t0.6\nLentejas\t\t23.5\t\t52.0\t\t1.4\nPapas\t\t2.0\t\t15.4\t\t0.1\nTomate\t\t1.0\t\t3.5\t\t0.2\nCebolla\t\t1.3\t\t5.8\t\t0.3\nManzana\t\t0.3\t\t12.4\t\t0.4\nPlátanos\t\t1.2\t\t21.4\t\t0.2\n")
          end
          
          it "Estan los valores energéticos" do
            expect(@tabla_alimentos.get_valor_energetico).to eq("231.9\n61.2\n69.0\n142.7\n112.3\n132.8\n74.4\n225.5\n202.0\n897.2\n479.2\n399.2\n343.4\n314.6\n70.5\n19.8\n31.1\n54.4\n92.2\n")
          end
        
    end
end
