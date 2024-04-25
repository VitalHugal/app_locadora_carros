<template>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <!-- inicio card de busca -->
                <card-component titulo="Busca de marcas">
                    <template v-slot:conteudo>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <!-- Componente que instaciamos -->
                                <input-container titulo="ID" id="inputId" id-help="idHelp"
                                    texto-ajuda="Opcional. Inofrme o ID da marca.">
                                    <input type="number" class="form-control" id="inputId" aria-describedby="idHelp"
                                        placeholder="ID">
                                </input-container>
                            </div>
                            <div class="col-md-6 mb-3">
                                <!-- Componente que instaciamos -->
                                <input-container titulo="Nome da marca" id="inputNome" id-help="NomeHelp"
                                    texto-ajuda="Opcional. Inofrme o nome da marca.">
                                    <input type="text" class="form-control" id="inputNome" aria-describedby="nomeHelp"
                                        placeholder="Nome da marca">
                                </input-container>
                            </div>
                        </div>
                    </template>

                    <template v-slot:rodape>
                        <button type="submit" class="btn btn-primary btn-sm">Pesquisar</button>
                    </template>
                </card-component>
                <!-- fim card de busca -->

                <!-- inicio do card listagem de marcas -->
                <card-component titulo="Relação de marcas">
                    <template v-slot:conteudo>
                        <!-- Componente que instaciamos -->
                        <table-component></table-component>
                    </template>
                    <template v-slot:rodape>
                        <button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal"
                            data-bs-target="#modalMarca">Adicionar</button>
                    </template>
                </card-component>
                <!-- fim do card listagem de marcas -->
            </div>
        </div>
        <modal-component id="modalMarca" titulo="Adicionar marca.">
            <template v-slot:conteudo>
                <div class="form-group">
                    <input-container titulo="Nome da marca" id="novoNome" id-help="novoNomeHelp"
                        texto-ajuda="Inform o nome da marca.">
                        <input type="text" class="form-control" id="novoNome" aria-describedby="novoNomeHelp"
                            placeholder="Nome da marca">
                    </input-container>
                </div>
                <div class="form-group">
                    <input-container titulo="Imagem" id="novoImagem" id-help="novoImagemHelp"
                        texto-ajuda="Selecione uma imagem no formato png.">
                        <input type="file" class="form-control" id="novoImagem" aria-describedby="novoImagemHelp"
                            placeholder="Selecione uma imagem">
                    </input-container>
                </div>
            </template>
            <template v-slot:rodape>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fechar</button>
                <button type="button" class="btn btn-primary">Salvar</button>
            </template>
        </modal-component>
    </div>
</template>

<script>

</script>
