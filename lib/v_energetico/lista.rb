Node= Struct.new(:value, :next, :prev)

class Lista
    attr_accessor :inicio, :final, :size
    
    def initialize()
        @inicio= Node.new(nil,nil,nil)
        @final= Node.new(nil,nil,nil)
        @size = 0
    end
    
    def extract_beg()
        if(@size==0)
           puts "No hay elementos"
        elsif(@size==1)
           sale = Node.new(@inicio.value,nil,nil)
           @size -= 1
           @inicio = Node.new(nil,nil,nil)
           @final = Node.new(nil,nil,nil)
           "#{sale.value}"
        elsif(@size > 1)
           @size -= 1
           sale = Node.new(@inicio.value,nil,nil)
           @inicio.prev.next = nil
           @inicio = @inicio.prev
           "#{sale.value}"
        end
    end
    
    def extract_end()
        if(@size==0)
           puts "No hay elementos"
        elsif(@size == 1)
           sale = Node.new(@final.value,nil,nil)
           @size-=1
           @inicio = Node.new(nil,nil,nil)
           @final = Node.new(nil,nil,nil)
           "#{sale.value}"
        elsif(@size > 1)
           @size-=1
           sale = Node.new(@tail.value,nil,nil)
           @final.next.prev = nil
           @final = @tail.next
           "#{sale.value}"
        end
    end