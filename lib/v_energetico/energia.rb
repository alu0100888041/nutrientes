#Clase energía
class Energia
    
    attr_accessor :alimento, :proteinas, :glucidos, :lipidos, :valor_ener
    
    include Comparable
 
 #Nos permite comparar objetos pertenecientes a Energia
 
    def <=>(other) 
        @proteinas <=> other.proteinas
    end
    
    def initialize(a,b,c,d)
       
        @alimento, @proteinas, @glucidos, @lipidos, @valor_ener = a, b, c, d, []
    end

    def to_s

        out = "\t\t   Proteínas\tGlúcidos\tLípidos\n"
            out << @alimento
            out << "\t\t"
            out << @proteinas.to_s
            out << "\t\t"
            out << @glucidos.to_s
            out << "\t\t"
            out << @lipidos.to_s
            out << "\n"
       
        out
  
        
    end
    
    
    #Calcula el valor energetico de un alimento
    def get_valor_energetico
            
            return ((@proteinas + @glucidos) * 4 + @lipidos * 9).round(1)
           
              
    end
    
   
end

#Clase hija de Energia, contiene el nombre de un grupo de alimentos además de un objeto Energía
class Grupo_alimentos < Energia

    attr_accessor :producto, :pr
    
    
    
    def initialize(a,b,c,d,e)
        super(a,b,c,d)
        @nombre_grupo = e
    end
    
      
    def to_s
    
        #out = super
        #out << " "
        #out << "#{@group}"
        #out
    end
    
end