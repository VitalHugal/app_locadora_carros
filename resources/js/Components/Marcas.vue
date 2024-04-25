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
                        <button type="button" class="btn btn-primary btn-sm">Adicionar</button>
                    </template>
                </card-component>
                <!-- fim do card listagem de marcas -->
            </div>
        </div>
    </div>
</template>

<script>

</script>
