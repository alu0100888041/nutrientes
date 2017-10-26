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
end
