class Energia
    
    attr_accessor :alimento, :proteinas, :glucidos, :lipidos, :valor_ener
    
    def initialize(a,b,c,d)
       
        @alimento, @proteinas, @glucidos, @lipidos, @valor_ener = a, b, c, d, []
    end
    
    def to_s

        out = "\t\t   Proteínas\tGlúcidos\tLípidos\n"
        for i in 0..@alimento.size-1 do
            out << @alimento[i]
            out << "\t\t"
            out << @proteinas[i].to_s
            out << "\t\t"
            out << @glucidos[i].to_s
            out << "\t\t"
            out << @lipidos[i].to_s
            out << "\n"
        end
        out
    end
    
    def get_nombre
        
        out = ""
        for i in 0..@alimento.size-1 do
            out << "#{@alimento[i]}\n"
        end
        out        
    end
    
    def get_proteinas

        out = ""
        for i in 0..@proteinas.size-1 do
            out << "#{@proteinas[i]}\n"
        end
        out  
    end
    
    def get_glucidos

        out = ""
        for i in 0..@glucidos.size-1 do
            out << "#{@glucidos[i]}\n"
        end
        out  
    end
    
    def get_lipidos

      out = ""
        for i in 0..@lipidos.size-1 do
            out << "#{@lipidos[i]}\n"
        end
        out   
    end
    
    def get_valor_energetico

        out = ""
        
        for i in 0..@alimento.size-1 do
            total = 0.0
            total = (@proteinas[i] + @glucidos[i]) * 4 + @lipidos[i] * 9 
            @valor_ener[i] = total.round(2)
            out << @valor_ener[i].to_s
            out << "\n"
        end
        out       
    end
end