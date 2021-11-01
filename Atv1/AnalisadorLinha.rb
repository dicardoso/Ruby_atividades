class AnalisadorLinha
    def initialize (linha, texto)
        @linha = linha
        @texto = texto
        @quantidade = 0
        @palavra = []
        @aux = {}
    end

    def analisar 
        @texto.each{ |i|  @aux[i] = @texto.count(i) }

        @aux.each{ |key, value|  
            if value > @quantidade 
                @quantidade = value
            end  
        }

        @aux.each{ |key,value| 
            if value == @quantidade 
                @palavra.push(key)
            end   
        }
    end

    def to_str
        return "\nLinha: #{@linha + 1}\nPalavra: #{@palavra}\nQuantidade: #{@quantidade}\n"
    end
end

nlinha = 0
arquivo = File.open('palavras.txt')

arquivo.each do |linha|
    palavras = linha.split(" ")

    res = AnalisadorLinha.new(nlinha, palavras)
    res.analisar

    print res.to_str
    nlinha += 1
end

