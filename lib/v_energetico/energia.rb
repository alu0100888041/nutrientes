#Clase energía
class Energia
    
    attr_accessor :alimento, :proteinas, :glucidos, :lipidos, :valor_ener
    
    include Comparable
 
 #Nos permite comparar objetos pertenecientes a Energia
 
    def <=>(other) 
         return nil unless other.kind_of? Energia
        @valor_ener <=> other.valor_ener
    end
    
    def initialize(a,b,c,d)
       
        @alimento, @proteinas, @glucidos, @lipidos = a, b, c, d
        @valor_ener = get_valor_energetico
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
    def indice_glucemico(alimento, glucosa)
       
       indice =[],[]
       al = []
       gl = []
       alimento.each_with_index do |val, index|
       alimento[index].each_with_index{|val2,index2| indice[index] << index2 }
       end
       
       indice.each_with_index do |valor,i| #quitamos el valor 0 del indice.
       indice[i] = valor.select{|val| val > 0}
       end
        
       al = [],[]
       gl = [],[]
       alsum = [],[]
       glsum = [],[]
       r = [],[]
       s = [],[]
       
       indice.each_with_index do |val, index|
         val.collect do |index2|
            al[index] << ((alimento[index][index2] - alimento[index][0]) + (alimento[index][index2-1] - alimento[index][0]))*2.5
            gl[index] << ((glucosa[index][index2] - glucosa[index][0]) + (glucosa[index][index2-1] - glucosa[index][0]))*2.5
        end
            alsum[index] = al[index].reduce(:+)
            glsum[index] = gl[index].reduce(:+)
        
       end
       
       r = alsum.zip(glsum)
       
       alsum.each_with_index{|val,index| s[index] = r[index].reduce(:/)*100}
       @indice_glucemico = s.reduce(:+)/2
        
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

class Array
   
    def method_for
        limit = (self.length-1)
        while limit > 0
            for i in 0..limit-1
                if self[i] > self[i+1]
                    self[i],self[i+1] = self[i+1],self[i]
                end
            end
            limit -= 1
        end
        #self
        
    end
      
      def method_each
        change = 0
        while change == 0
          a = nil
          self.each do |item|
            if(a == nil)
              a = item
            elsif (a > item)
              self.delete(a)
              self << a
              a = item
              change = 1
            else
              a = item
            end
          end
          if(change == 1)
            change = 0
          else
            break
          end
          
        end
        #self
        
      end
end